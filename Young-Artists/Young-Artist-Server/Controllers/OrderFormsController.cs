using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;

namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderFormsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public OrderFormsController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/OrderForms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderForm>>> GetOrderForm()
        {
            return await _context.OrderForm.ToListAsync();
        }

        // GET: api/OrderForms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderForm>> GetOrderForm(int id)
        {
            var orderForm = await _context.OrderForm.FindAsync(id);

            if (orderForm == null)
            {
                return NotFound();
            }

            return orderForm;
        }

        // PUT: api/OrderForms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutOrderForm(int id, OrderForm orderForm)
        //{
        //    if (id != orderForm.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(orderForm).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!OrderFormExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //
        [HttpPut]
        public async Task<string> PutOrderForm(OrderFormCommodity orderForm)
        {
            //var order = await _context.OrderForm.SingleOrDefaultAsync(o => o.NumberId == orderForm.NumberId && o.CommodityId == orderForm.CommodityId);
            var order = await _context.OrderForm.SingleOrDefaultAsync(o => o.Id == orderForm.Id);

            if (order == null)
            {
                return "不OK";
            }

            order.QuantityOrder = orderForm.QuantityOrder;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderFormExists(order.Id))
                {
                    return "不OK2";
                }
                else
                {
                    throw;
                }
            }

            return "ok";
        }
        //送出訂單 修改isCart
        [HttpPut("{jsonCart}")]
        public async Task<string> PutIsCart(string jsonCart)
        {
            jsonCart = HttpUtility.UrlDecode(jsonCart);

            //OrderFormCommodity orderForm
            //string encodedJsonString = HttpUtility.UrlEncode(jsonCart.ToString());
            JArray array = JArray.Parse(jsonCart);
            List<OrderFormCommodity> orders = JsonConvert.DeserializeObject<List<OrderFormCommodity>>(array.ToString());
            //Debug.WriteLine(orders[0].NumberId + "123" + orders[0].CommodityId);
            for (int i = 0; i < orders.Count; i++)
            {
                //var order = await _context.OrderForm.SingleOrDefaultAsync(o => o.NumberId == orders[i].NumberId && o.CommodityId == orders[i].CommodityId);
                var order = await _context.OrderForm.SingleOrDefaultAsync(o => o.Id == orders[i].Id);
                //Debug.WriteLine(order.IsCart);
                order.IsCart = true;
                await _context.SaveChangesAsync();
            }
            //var order = await _context.OrderForm.SingleOrDefaultAsync(o => o.NumberId == orderForm.NumberId && o.CommodityId == orderForm.CommodityId);

            if (orders == null)
            {
                return "不OK";
            }

            return "ok";
        }
        //獲取在購物車裡的商品
        [HttpGet("member/{memberId}")]
        public async Task<ActionResult<List<OrderFormCommodity>>> GetOrderByMemberId(int memberId)
        {
            //var orders = await _context.OrderForm.Where(o => o.NumberId == memberId).ToListAsync();

            //if (orders == null)
            //{
            //    return NotFound();
            //}

            //return orders;
            var orders = await _context.OrderForm
               .Where(o => o.NumberId == memberId && o.IsCart == false)
               .Join(
                   _context.Commodity, // 您要連結的資料表
                   order => order.CommodityId, // OrderForm資料表的鍵選擇器
                   commodity => commodity.Id, // Product資料表的鍵選擇器
                   (order, commodity) => new OrderFormCommodity
                   {
                       //圖片 名字 價格
                       // 使用來自兩個資料表的值填充新的OrderForm物件的屬性
                       Id = order.Id,
                       CommodityId = commodity.Id,
                       NumberId = order.NumberId,
                       OrderTime = order.OrderTime,
                       QuantityOrder = order.QuantityOrder,
                       CommodityNum = commodity.CommodityNum,
                       CommodityImage = commodity.CommodityImage,
                       CommodityPrice = commodity.CommodityPrice,
                       CommodityName = commodity.CommodityName,
                       // 根據需要添加更多屬性
                   })
               .ToListAsync();

            if (orders == null)
            {
                return NotFound();
            }

            return orders;
        }

        //獲取在提交後的訂單
        [HttpGet("CustomerCommodity/{memberId}")]
        public async Task<ActionResult<List<OrderFormCommodity>>> GetOrderByCustomerCommodity(int memberId)
        {
            var orders = await _context.OrderForm
               .Where(o => o.NumberId == memberId && o.IsCart == true)
               .Join(
                   _context.Commodity, // 您要連結的資料表
                   order => order.CommodityId, // OrderForm資料表的鍵選擇器
                   commodity => commodity.Id, // Product資料表的鍵選擇器
                   (order, commodity) => new OrderFormCommodity
                   {
                       //圖片 名字 價格
                       // 使用來自兩個資料表的值填充新的OrderForm物件的屬性
                       Id = order.Id,
                       CommodityId = commodity.Id,
                       NumberId = order.NumberId,
                       OrderTime = order.OrderTime,
                       QuantityOrder = order.QuantityOrder,
                       CommodityNum = commodity.CommodityNum,
                       CommodityImage = commodity.CommodityImage,
                       CommodityPrice = commodity.CommodityPrice,
                       CommodityName = commodity.CommodityName,
                       IsState = order.IsState,
                       // 根據需要添加更多屬性
                   })
               .ToListAsync();

            if (orders == null)
            {
                return NotFound();
            }

            return orders;
        }

        // POST: api/OrderForms
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OrderForm>> PostOrderForm(OrderForm orderForm)
        {
            //ActionResult<OrderForm>
            OrderForm order = new OrderForm();
            order.NumberId = orderForm.NumberId;
            order.CommodityId = orderForm.CommodityId;
            order.OrderTime = DateTime.Now.ToString();
            order.QuantityOrder = orderForm.QuantityOrder;
            order.IsState = orderForm.IsState;
            order.IsCart = orderForm.IsCart;


            _context.OrderForm.Add(order);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOrderForm", new { id = orderForm.Id }, orderForm);
        }

        // DELETE: api/OrderForms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrderForm(int id)
        {
            var orderForm = await _context.OrderForm.FindAsync(id);
            if (orderForm == null)
            {
                return NotFound();
            }

            _context.OrderForm.Remove(orderForm);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OrderFormExists(int id)
        {
            return _context.OrderForm.Any(e => e.Id == id);
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
            string jsonString = JsonConvert.SerializeObject(order);
            //JsonSerializer.Serialize(order);
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
                //Encoding
                var hash = algorithm.ComputeHash(Encoding.UTF8.GetBytes(checkValue));

                if (hash != null)
                {
                    result = BitConverter.ToString(hash)?.Replace("-", string.Empty)?.ToUpper();
                }

            }

            checkValue = result;

            return checkValue.ToUpper();
        }

    }
}
