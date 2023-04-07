using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;
using System.Collections.Generic;
using System.Collections;
using System.Text.Json.Serialization;
using System.Text.Json;
using Newtonsoft.Json;

namespace Young_Artists.Controllers
{
	public class FrontCodeController : SuperController
	{

		public IActionResult Index()
		{
			YoungArtistsContext db = new YoungArtistsContext();
			var datas = from t in db.Events.Where(t => t.EventId == 1)
						select t;
			return View(datas);
		}
		public IActionResult Buy()
		{
			ViewBag.Account = HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMINID);
			YoungArtistsContext db = new YoungArtistsContext();
			var datas = from t in db.SeatStocks.Where(t => t.EventId == 1)
						select t;
			return View(datas);
		}
        public IActionResult Confirm2(List<OrderDestributor> getList)
        {
            string jsonArray = Request.Form["jsonString"];
            getList = JsonConvert.DeserializeObject<List<OrderDestributor>>(jsonArray);
            YoungArtistsContext db = new YoungArtistsContext();

            // 檢查庫存
            foreach (OrderDestributor p in getList)
            {
                bool check_stock = db.SeatStocks.Where(x => x.Area == p.area).Any(y => y.Stock == 0);
                SeatStock check_stock_decrease = db.SeatStocks.Where(x => x.Area == p.area).FirstOrDefault();

                // 如果庫存少於購買量 返回頁面
                if (check_stock_decrease.Stock - p.stock < 0)
                {
                    return RedirectToAction("Buy");
                }
                // 如果庫存 = 0 返回頁面 
                if (check_stock)
                {
                    return RedirectToAction("Buy");
                }
            }
            // 訂單總價
            decimal? total_price = 0;
            // 找現在訂單ID最大值，如果沒有存在任何order_id，則讓訂單資料表插入一筆 order_id = 1
            var NewOrder_id = db.TicketOrders.Max(t => t.OrderId) + 1;
            if (NewOrder_id == null)
            {
                NewOrder_id = 1;
            }

            // 建立新訂單分配器
            var NewOrderDistributor = new OrderDestributor();
            // 訂單資料表加入新訂單
            if (NewOrder_id != null)
            {
                // 訂單資料表的 訂單id
                NewOrderDistributor._order.OrderId = NewOrder_id;
                // 訂單資料表的 訂單修改人 0 = 系統
                NewOrderDistributor._order.OrderUpdateId = 0;
                // 訂單資料表的 訂單狀態
                NewOrderDistributor._order.OrderState = 0;
                // 訂單資料表的 建立時間 修改時間
                NewOrderDistributor._order.OrderCreateTimestamp = DateTime.Now.ToString("G");
                NewOrderDistributor._order.OrderUpdateTimestamp = DateTime.Now.ToString("G");
                // 訂單資料表的 顧客id
            }
            int customer_id = 0;
            foreach (OrderDestributor p in getList)
            {
                for (int i = 0; i < p.stock; i++)
                {
                    var NewOrderDistributor_ticket = new OrderDestributor();

                    // 票資料表
                    NewOrderDistributor_ticket._ticket.OrderId = NewOrder_id; // 讓票資料表中的order_id = 訂單資料表中的order_id
                    NewOrderDistributor_ticket._ticket.EventId = p.event_id;
                    NewOrderDistributor_ticket._ticket.Area = p.area;
                    NewOrderDistributor_ticket._ticket.CustomerId = p.customer_id;
                    // 先找資料表中 該區域的最大值 如果是空的 就等於1 如果有就最大值+1
                    int? maxAreaSeatId = db.TicketOrderDetails.Where(x => x.Area == p.area).Max(y => y.SeatId);
                    if (maxAreaSeatId == null)
                    {
                        NewOrderDistributor_ticket._ticket.SeatId = 1;
                    }
                    else
                    {
                        NewOrderDistributor_ticket._ticket.SeatId = maxAreaSeatId + 1;
                    }
                    // 減少p.area庫存
                    NewOrderDistributor_ticket._stock = db.SeatStocks.Where(x => x.Area == p.area).FirstOrDefault();
                    NewOrderDistributor_ticket._stock.Stock -= 1;
                    NewOrderDistributor_ticket._stock.Sold += 1;

                    // 票資料表加入新資料
                    db.TicketOrderDetails.Add(NewOrderDistributor_ticket._ticket);
                    db.SaveChanges();

                }
                // 訂單總價++
                total_price += p.total_price;
                customer_id = p.customer_id;
            }

            NewOrderDistributor._order.CustomerId = customer_id;
            db.TicketOrders.Add(NewOrderDistributor._order);
            db.SaveChanges();
            var Update_order_total_price = db.TicketOrders.FirstOrDefault(t => t.OrderId == NewOrder_id);
            Update_order_total_price.OrderTotalPrice = total_price;
            db.SaveChanges();

            return RedirectToAction("Buy");
        }
    }
}
