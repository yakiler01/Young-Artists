using System.Data;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Web;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;
using Young_Artists_Server.ViewModels;

namespace Young_Artists_Server.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class TicketOrdersController : ControllerBase
	{
		private readonly YoungArtistsContext _context;

		public TicketOrdersController(YoungArtistsContext context)
		{
			_context = context;
		}

		// GET: api/TicketOrders
		[HttpGet]
		public async Task<IEnumerable<TicketOrder>> GetTicketOrder()
		{
			return _context.TicketOrder.Select(to => new TicketOrder
			{
				OrderId = to.OrderId,
				OrderTotalPrice = to.OrderTotalPrice,
				CustomerId = to.CustomerId,
				OrderUpdateId = to.OrderUpdateId,
				OrderCreateTimestamp = to.OrderCreateTimestamp,
				OrderUpdateTimestamp = to.OrderUpdateTimestamp,
				OrderState = to.OrderState,
			});
		}

		// GET: api/TicketOrders/5
		[HttpGet("{CustomerId}")]
		public async Task<IEnumerable<TicketOrder>> GetTicketOrder(int CustomerId)
		{
			var data = from order in _context.TicketOrder
					   where order.CustomerId == CustomerId
					   select order;
			if (data != null)
			{
				return data.Select(to => new TicketOrder
				{
					OrderId = to.OrderId,
					OrderTotalPrice = to.OrderTotalPrice,
					OrderCreateTimestamp = to.OrderCreateTimestamp,
					OrderUpdateTimestamp = to.OrderUpdateTimestamp,
					OrderState = to.OrderState,
				});
			}
			return data;
		}

		[HttpGet("detail/{OrderId}")]
		public async Task<IEnumerable<TicketOrderDetail>> GetTicketOrderDetail(int OrderId)
		{
			var data = from order in _context.TicketOrderDetail
					   where order.OrderId == OrderId
					   select order;

			return data.Select(to => new TicketOrderDetail
			{
				OrderId = to.OrderId,
				Area = to.Area,
				EventId = to.EventId,
				SeatId = to.SeatId,
			});
		}
		[HttpGet("detail/AllOrderDetail/{CustomerId}")]
		public async Task<IEnumerable<TicketOrderDetail>> GetCustomerTicketOrderDetail(int CustomerId)
		{
			var data = from order in _context.TicketOrderDetail
					   where order.CustomerId == CustomerId
					   select order;

			return data.Select(to => new TicketOrderDetail
			{
				OrderId = to.OrderId,
				Area = to.Area,
				EventId = to.EventId,
				SeatId = to.SeatId,
			});
		}

        [HttpGet("Payment/{OrderId}")]
        public async Task<IActionResult> PaymentOrder(int OrderId)
        {
			var data = await _context.TicketOrder.FirstOrDefaultAsync(x=>x.OrderId == OrderId);

            if (data != null)
            {
				data.OrderState = 1;
				await _context.SaveChangesAsync();
                return Ok();
            }
            return NotFound();
        }
        // PUT: api/TicketOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
		public async Task<IActionResult> PutTicketOrder(int id, TicketOrder ticketOrder)
		{
			if (id != ticketOrder.Id)
			{
				return BadRequest();
			}

			_context.Entry(ticketOrder).State = EntityState.Modified;

			try
			{
				await _context.SaveChangesAsync();
			}
			catch (DbUpdateConcurrencyException)
			{
				if (!TicketOrderExists(id))
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
		// DELETE: api/TicketOrders/5
		[HttpDelete("{id}")]
		public async Task<IActionResult> DeleteTicketOrder(int id)
		{
			var ticketOrder = await _context.TicketOrder.FindAsync(id);
			if (ticketOrder == null)
			{
				return NotFound();
			}

			_context.TicketOrder.Remove(ticketOrder);
			await _context.SaveChangesAsync();

			return NoContent();
		}

		[HttpPost]
		public async Task<string> PostTicketOrder(CTicketOrder_PostOrderInfo_ViewModel OrderInfo)
		{
			// 先創立一個訂單明細
			int newOrderId = await GenerateOrderIdAsync();
			DateTime currentDate = DateTime.Now.Date;
			int dateNumber = int.Parse(currentDate.ToString("yyyyMM"));
			TicketOrder order = new TicketOrder();
			order.OrderId = int.Parse($"{dateNumber}{newOrderId}");
			order.CustomerId = OrderInfo.CustomerId;
			order.OrderUpdateId = 0;
			order.OrderCreateTimestamp = DateTime.Now.ToString("G");
			order.OrderUpdateTimestamp = DateTime.Now.ToString("G");
			order.OrderTotalPrice = Convert.ToInt64(OrderInfo.OrderPrice);
			order.OrderState = 0;
			_context.TicketOrder.Add(order);
			_context.SaveChanges();

			List<COrderInfoViewModel> orderInfoObjects = OrderInfo.OrderInfo;

			foreach (var OrderItem in orderInfoObjects)
			{
				// 先檢查數量
				SeatStock SeatStock = _context.SeatStock.Where(o => o.Area == OrderItem.area && o.EventId == OrderInfo.EventId).FirstOrDefault();
				if (SeatStock.Stock < OrderItem.count)
				{
					return "所選取的票券不足";
				}
			}
			foreach (var OrderItem in orderInfoObjects)
			{

				for (int i = 0; i < OrderItem.count; i++)
				{
					// 創建新詳細訂單
					TicketOrderDetail tod = new TicketOrderDetail();
					tod.Area = OrderItem.area;
					// 傳過來的活動Id
					tod.EventId = OrderInfo.EventId;
					// 查找該區的座位最大值
					int? SeatIdMax = _context.TicketOrderDetail.Where(o => o.Area == OrderItem.area).Max(o => o.SeatId);
					if (SeatIdMax == null)
					{
						SeatIdMax = 1;
					}
					else
					{
						SeatIdMax = _context.TicketOrderDetail.Where(o => o.Area == OrderItem.area).Max(o => o.SeatId) + 1 + i;
					}
					var SeatStock = _context.SeatStock.Where(o => o.Area == OrderItem.area && o.EventId == OrderInfo.EventId).FirstOrDefault();
					SeatStock.Stock -= 1;
					SeatStock.Sold += 1;
					tod.SeatId = SeatIdMax;
					// 傳過來的會員Id
					tod.CustomerId = OrderInfo.CustomerId;
					// 查找訂單Id最大值
					tod.OrderId = int.Parse($"{dateNumber}{newOrderId}");
					_context.TicketOrderDetail.Add(tod);
				}
				_context.SaveChanges();

			}
			return $"{order.OrderId}";
		}

		[HttpPost("CancelTicketOrder/{OrderId}")]
		public async Task<string> CancelTicketOrder(int? OrderId)
		{
			if (OrderId != null)
			{
				var datas = _context.TicketOrder.FirstOrDefault(t => t.OrderId == OrderId);
				var data_details = _context.TicketOrderDetail.Where(t => t.OrderId == OrderId).ToList();
				foreach (var data_detail in data_details)
				{
					var stock = _context.SeatStock.FirstOrDefault(t => t.Area == data_detail.Area && t.EventId == data_detail.EventId);
					stock.Stock += 1;
					stock.Sold -= 1;
					_context.Remove(data_detail);
				}
				_context.Remove(datas);
				_context.SaveChanges();
			}
			return "已取消";
		}
		[HttpPost("CancelTicketOrderDetail/{OrderId}")]
		public async Task<string> CancelTicketOrderDetail(int? OrderId)
		{
			if (OrderId != null)
			{
				var datas = _context.TicketOrder.FirstOrDefault(t => t.OrderId == OrderId);
				datas.OrderState = 2;
				var data_details = _context.TicketOrderDetail.Where(t => t.OrderId == OrderId).ToList();
				foreach (var data_detail in data_details)
				{
					var stock = _context.SeatStock.FirstOrDefault(t => t.Area == data_detail.Area && t.EventId == data_detail.EventId);
					stock.Stock += 1;
					stock.Sold -= 1;
					_context.Remove(data_detail);
				}
				_context.SaveChanges();
			}
			return "已取消";
		}

		private async Task<int> GenerateOrderIdAsync()
		{
			int orderId;
			do
			{
				orderId = new Random().Next(1000, 9999);
			} while (await _context.TicketOrder.AnyAsync(o => o.OrderId == orderId));
			return orderId;
		}


		[HttpPost("GetCheckValue")]
		public async Task<string> GetCheckValue(CPayment Order)
		{
			Random rand = new Random();
            int randomNumber = rand.Next(111111, 999999);
            var order = new Dictionary<string, object>
			{
                //特店交易編號
                { "MerchantTradeNo",  randomNumber+Order.OrderId},

                //特店交易時間 yyyy/MM/dd HH:mm:ss
                { "MerchantTradeDate",  DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")},

                //交易金額
                { "TotalAmount",  Order.Amt},

                //交易描述
                { "TradeDesc",  Order.ItemDesc},

                //商品名稱
                { "ItemName", Order.ItemDesc},

                //允許繳費有效天數(付款方式為 ATM 時，需設定此值)
                { "ExpireDate",  "3"},

                //自訂名稱欄位1
                { "Email",  Order.Email},

                //自訂名稱欄位2
                { "CustomField2",  ""},

                //自訂名稱欄位3
                { "CustomField3",  ""},

                //自訂名稱欄位4
                { "CustomField4",  ""},

                //完成後發通知
                { "ReturnURL",  $"https://localhost:7165/Payment/GotoPayment"},
				//{ "ReturnURL",  ""},

                //付款完成後導頁
                { "OrderResultURL", $"https://localhost:7165/Payment/GotoPayment"},


                //付款方式為 ATM 時，當使用者於綠界操作結束時，綠界回傳 虛擬帳號資訊至 此URL
                { "PaymentInfoURL", $"https://localhost:7165/Payment/GotoPayment"},

                //付款方式為 ATM 時，當使用者於綠界操作結束時，綠界會轉址至 此URL。
                { "ClientRedirectURL",$"https://localhost:7165/Payment/GotoPayment"},

                //特店編號， 2000132 測試綠界編號
                { "MerchantID",  "3002599"},

                //忽略付款方式
                { "IgnorePayment",  "GooglePay#WebATM#CVS#BARCODE"},

                //交易類型 固定填入 aio
                { "PaymentType",  "aio"},

                //選擇預設付款方式 固定填入 ALL
                { "ChoosePayment",  "ALL"},

                //CheckMacValue 加密類型 固定填入 1 (SHA256)
                { "EncryptType",  "1"},
			};

			//檢查碼
			string CheckValue = GetCheckMacValue(order);
			order["CheckMacValue"] = CheckValue;
			string jsonString = JsonSerializer.Serialize(order);
			return jsonString;
		}

		private string GetCheckMacValue(Dictionary<string, object> order)
		{
			var param = order.Keys.OrderBy(x => x).Select(key => key + "=" + order[key]).ToList();

			var checkValue = string.Join("&", param);

			//測試用的 HashKey
			var hashKey = "spPjZn66i0OhqJsQ";

			//測試用的 HashIV
			var HashIV = "hT5OJckN45isQTTs";

			checkValue = $"HashKey={hashKey}" + "&" + checkValue + $"&HashIV={HashIV}";
			Console.WriteLine(checkValue);
			checkValue = HttpUtility.UrlEncode(checkValue).ToLower();

			//checkValue = EncryptSHA256(checkValue);

			string result = string.Empty;

			using (System.Security.Cryptography.SHA256 algorithm = System.Security.Cryptography.SHA256.Create())
			{
				var hash = algorithm.ComputeHash(Encoding.UTF8.GetBytes(checkValue));

				if (hash != null)
				{
					result = BitConverter.ToString(hash)?.Replace("-", string.Empty)?.ToUpper();
				}

			}

			checkValue = result;

			return checkValue.ToUpper();
		}

		//public string EncryptSHA256(string source)
		//{
		//	string result = string.Empty;

		//	using (System.Security.Cryptography.SHA256 algorithm = System.Security.Cryptography.SHA256.Create())
		//	{
		//		var hash = algorithm.ComputeHash(Encoding.UTF8.GetBytes(source));

		//		if (hash != null)
		//		{
		//			result = BitConverter.ToString(hash)?.Replace("-", string.Empty)?.ToUpper();
		//		}

		//	}
		//	return result;
		//}

		private bool TicketOrderExists(int id)
		{
			return _context.TicketOrder.Any(e => e.Id == id);
		}
	}

}
