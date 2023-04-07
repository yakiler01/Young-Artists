using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;

namespace Young_Artists_Server.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class CustomersController : ControllerBase
	{
		private readonly YoungArtistsContext _context;
		// JWT測試 變數
		private readonly static string SECRET_KEY = "MySecretKey_Young_Artists_Server_ThisIsMySecretKey";
		public static readonly SymmetricSecurityKey SIGNING_KEY = new(Encoding.UTF8.GetBytes(SECRET_KEY));
		// JWT測試 變數

		public CustomersController(YoungArtistsContext context)
		{
			_context = context;
		}
		// JWT測試
		[HttpPost]
		public async Task<string> PostCustomers(CCustomerLoginViewModel vm)
		{
			Customers user = (_context.Customers.FirstOrDefault
				(t => t.CustomerEmail.Equals(vm.customerEmail) && t.CustomerPassword.Equals(vm.customerPassword)));

			if (user != null && user.CustomerPassword.Equals(vm.customerPassword))
			{
				var claims = new[]
				{
					new Claim(ClaimTypes.NameIdentifier, user.CustomerId.ToString()),
					new Claim(ClaimTypes.Name, user.CustomerName),
					new Claim(ClaimTypes.Email, user.CustomerEmail),
					new Claim(ClaimTypes.MobilePhone, user.CustomerPhone),
					new Claim("CustomerRegion", user.CustomerRegion),
					new Claim(ClaimTypes.StreetAddress, user.CustomerAddress),
					new Claim(ClaimTypes.DateOfBirth, user.CustomerBirthDate),
					new Claim(ClaimTypes.Gender, user.CustomerGender),
                    new Claim("CustomerPassword", user.CustomerPassword),
                    new Claim("CustomerCreatTimestamp", user.CustomerCreatTimestamp),
					new Claim("CustomerUpdateTimestamp", user.CustomerUpdateTimestamp)
				};
				var token = new JwtSecurityToken(
					issuer: "Young-Artists-Server",
					audience: "Young-Artists-Customer",
					claims: claims,
					expires: DateTime.Now.AddSeconds(99999),
					signingCredentials: new SigningCredentials(SIGNING_KEY, SecurityAlgorithms.HmacSha256)
				);

				var tokenString = new JwtSecurityTokenHandler().WriteToken(token);
				return tokenString;
			}
			return "帳號或密碼錯誤";
		}
		[HttpGet("verify")]
		public async Task<Customers> GetMe()
		{
			string token = HttpContext.Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
			JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
			SecurityToken validatedToken;
			var tokenValidationParameters = new TokenValidationParameters
			{
				ValidateLifetime = true,
				ValidIssuer = "Young-Artists-Server",
				ValidAudience = "Young-Artists-Customer",
				IssuerSigningKey = SIGNING_KEY,
				ClockSkew = TimeSpan.Zero
			};
			var user = new Customers();
			try
			{
				handler.ValidateToken(token, tokenValidationParameters, out validatedToken);
				var claims = handler.ReadJwtToken(token).Claims;
				string userEmail = claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value;
				if (userEmail != null)
				{
					user.CustomerId = Convert.ToInt32(claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)?.Value);
					user.CustomerName = claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value;
					user.CustomerEmail = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value;
					user.CustomerPhone = claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone)?.Value;
                    user.CustomerPassword = claims.FirstOrDefault(c => c.Type == "CustomerPassword")?.Value;
                    user.CustomerRegion = claims.FirstOrDefault(c => c.Type == "CustomerRegion")?.Value;
					user.CustomerAddress = claims.FirstOrDefault(c => c.Type == ClaimTypes.StreetAddress)?.Value;
					user.CustomerBirthDate = claims.FirstOrDefault(c => c.Type == ClaimTypes.DateOfBirth)?.Value;
					user.CustomerGender = claims.FirstOrDefault(c => c.Type == ClaimTypes.Gender)?.Value;
					user.CustomerCreatTimestamp = claims.FirstOrDefault(c => c.Type == "CustomerCreatTimestamp")?.Value;
					user.CustomerUpdateTimestamp = claims.FirstOrDefault(c => c.Type == "CustomerUpdateTimestamp")?.Value;
					return user;
				}
			}
			catch
			{
				user = null;
			}
			return user;
		}
		// JWT測試

		// GET: api/Customers
		[HttpGet]
		public async Task<IEnumerable<Customers>> GetCustomers()
		{
			var data = await (from customer in _context.Customers
							  select customer).ToArrayAsync();
			return data;
		}

		// GET: api/Customers/5
		[HttpGet("{id}")]
		public async Task<Customers> GetCustomers(int id)
		{
			var customers = await _context.Customers.FindAsync(id);
			return customers;
		}


		[HttpPut("{id}")]
		public async Task<IActionResult> PutCustomers(int id, Customers customers)
		{
			if (id != customers.CustomerId)
			{
				return BadRequest();
			}
            _context.Entry(customers).State = EntityState.Modified;
			//var result = _context.Customers.Where(c => c.CustomerId == customers.CustomerId);


            try
			{
				await _context.SaveChangesAsync();
			}
			catch (DbUpdateConcurrencyException)
			{
				if (!CustomersExists(id))
				{
					return NotFound();
				}
				else
				{
					throw;
				}
			}

			return NoContent();
		}

		// 登入用post
		//[HttpPost]
		//public async Task<string> PostCustomers(CCustomerLoginViewModel vm)
		//{
		//    Customers user = (_context.Customers.FirstOrDefault
		//        (t => t.CustomerEmail.Equals(vm.customerEmail) && t.CustomerPassword.Equals(vm.customerPassword)));

		//    if (user != null && user.CustomerPassword.Equals(vm.customerPassword))
		//    {

		//        var result = new
		//        {
		//            user.CustomerId,
		//            user.CustomerName,
		//            user.CustomerEmail,
		//            user.CustomerPassword,
		//            user.CustomerPhone,
		//            user.CustomerRegion,
		//            user.CustomerAddress,
		//            user.CustomerBirthDate,
		//            user.CustomerGender,
		//            user.CustomerCreatTimestamp,
		//            user.CustomerUpdateTimestamp,
		//            // 之後應該會用到
		//            UserName = vm.customerEmail
		//        };

		//        string json = JsonSerializer.Serialize(result);

		//        return json;

		//    }
		//    return "帳號或密碼錯誤";
		//}

		// 註冊用post
		[HttpPost("SignUp")]
		public async Task<string> PostCustomers(CCustomerSignUpViewModel vm)
		{


			if (_context.Customers.Any(c => c.CustomerEmail == vm.customerEmail || c.CustomerPhone == vm.customerPhone))
			{
				return "帳號已存在";
			}
			else
			{
				Customers cus = new Customers
				{
					CustomerName = vm.customerName,
					CustomerEmail = vm.customerEmail,
					CustomerPassword = vm.customerPassword,
					CustomerPhone = vm.customerPhone,
					CustomerRegion = vm.customerRegion,
					CustomerAddress = vm.customerAddress,
					CustomerBirthDate = vm.customerBirthDate,
					CustomerGender = vm.customerGender,
					CustomerCreatTimestamp = DateTime.Now.ToString(),
					CustomerUpdateTimestamp = DateTime.Now.ToString(),

				};
				_context.Customers.Add(cus);
				await _context.SaveChangesAsync();

				return "註冊成功";
			}


		}

		// DELETE: api/Customers/5
		[HttpDelete("{id}")]
		public async Task<IActionResult> DeleteCustomers(int id)
		{
			var customers = await _context.Customers.FindAsync(id);
			if (customers == null)
			{
				return NotFound();
			}

			_context.Customers.Remove(customers);
			await _context.SaveChangesAsync();

			return NoContent();
		}

		private bool CustomersExists(int id)
		{
			return _context.Customers.Any(e => e.CustomerId == id);
		}
	}
}
