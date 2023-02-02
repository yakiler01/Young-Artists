using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class TicketOrderController : Controller
    {
        public IActionResult List(int? id)
        {
			ViewBag.Account = HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMINID);
			IEnumerable<TicketOrder> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (id != null)
            {

                datas = from t in db.TicketOrders
                        where t.CustomerId == id
                        select t;

				return View(datas);
            }
            else
            {

                datas = from t in db.TicketOrders
                        select t;
                return View(datas);

            }
        }
        public IActionResult List_Detail(int? id)
        {
            IEnumerable<TicketOrderKeywordViewModel> datas = null;

            YoungArtistsContext db = new YoungArtistsContext();
            if (id != null)
            {
                datas = from to in db.TicketOrders
                        join tod in db.TicketOrderDetails on to.OrderId equals tod.OrderId
                        where tod.OrderId == id
                        select new TicketOrderKeywordViewModel { Id = tod.Id, OrderId = to.OrderId, OrderTotalPrice = to.OrderTotalPrice, OrderCreateTimestamp = to.OrderCreateTimestamp, OrderUpdateTimestamp = to.OrderUpdateTimestamp, OrderUpdateId = to.OrderUpdateId, EventId = tod.EventId, Area = tod.Area, SeatId = tod.SeatId, CustomerId = tod.CustomerId, OrderState = to.OrderState };


                return View(datas);
            }
            else
            {
                var datas_detail = from to in db.TicketOrders
								   join tod in db.TicketOrderDetails on to.OrderId equals tod.OrderId
								   select new TicketOrderKeywordViewModel {Id =tod.Id, OrderId = to.OrderId, OrderTotalPrice = to.OrderTotalPrice, OrderCreateTimestamp = to.OrderCreateTimestamp, OrderUpdateTimestamp = to.OrderUpdateTimestamp, OrderUpdateId = to.OrderUpdateId, EventId = tod.EventId, Area = tod.Area, SeatId = tod.SeatId, CustomerId = tod.CustomerId, OrderState = to.OrderState };
				return View(datas_detail);

            }
        }


        public IActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public IActionResult Create( TicketOrder to)
        {
            YoungArtistsContext db = new YoungArtistsContext();
			ViewBag.Account = HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMINID);

			if (db.TicketOrders.Max(x => x.OrderId) == null)
            {
                to.OrderId = 1;
            }
            else
            {
                to.OrderId = db.TicketOrders.Max(x => x.OrderId) + 1;

            }
            to.CustomerId = 1;
            to.OrderCreateTimestamp = DateTime.Now.ToString("G");
            to.OrderUpdateTimestamp = DateTime.Now.ToString("G");
            to.OrderUpdateId = ViewBag.Account;
            
            db.TicketOrders.Add(to);
            db.SaveChanges();

            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();

            if (id != null)
            {
                var datas = db.TicketOrders.FirstOrDefault(t => t.Id == id);

                var datasOrderId = datas.OrderId;
                var datasDetailCount = db.TicketOrderDetails.Count(t=>t.OrderId == datasOrderId);

                for (int i = 0; i < datasDetailCount;i++)
                {
                    Delete_Detail_All(datasOrderId);
                }

                db.Remove(datas);
                db.SaveChanges();
            }

            return RedirectToAction("List");
        }

        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.TicketOrders.FirstOrDefault(t => t.OrderId == id);
                if (datas != null)
                {

                    return View(datas);
                }
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(TicketOrder t)
        {
			ViewBag.Account = HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMINID);

			YoungArtistsContext db = new YoungArtistsContext();
            var datas = db.TicketOrders.FirstOrDefault(d => d.OrderId == t.Id);
            if (datas != null)
            {
                datas.OrderUpdateId = Convert.ToInt32(ViewBag.Account);
				datas.OrderUpdateTimestamp = DateTime.Now.ToString("G");
                datas.OrderState = t.OrderState;
                datas.OrderTotalPrice = t.OrderTotalPrice;
                db.SaveChanges();
                return RedirectToAction("List");
            }

            return RedirectToAction("List");
        }


		public IActionResult Edit_Detail(int? id)
		{
			if (id != null)
			{
				YoungArtistsContext db = new YoungArtistsContext();
				var datas = db.TicketOrderDetails.FirstOrDefault(t => t.Id == id);
				if (datas != null)
				{
                    // 區域集合
                    List<string> Area = new List<string>();
                    // 抓區域資料
                    var AreaData = from t in db.SeatStocks
                    select t.Area;
                    // 丟進集合
                    foreach (var data in AreaData) 
                    { 
                      Area.Add(data.ToString()); 
                    }


                    // 區域集合
                    List<int> EventId = new List<int>();

                    var EventData = from t in db.Events
                                    select t.EventId;
                    foreach (var data in EventData)
                    {
                        EventId.Add((Int32)data);
                    }



                    ViewBag.Area = Area;
                    ViewBag.EventId = EventId;

                    return View(datas);
				}
			}
			return RedirectToAction("List_Detail");
		}
		[HttpPost]
		public IActionResult Edit_Detail(TicketOrderDetail t)
		{

			YoungArtistsContext db = new YoungArtistsContext();
			var datas = db.TicketOrderDetails.FirstOrDefault(d => d.Id == t.Id);
			if (datas != null)
			{
                datas.EventId = t.EventId;
				datas.Area = t.Area;
				datas.SeatId = t.SeatId;
				db.SaveChanges();
				return RedirectToAction("List_Detail");
			}

			return RedirectToAction("List_Detail");
		}

        public IActionResult Delete_Detail(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
			int? Detail_id = 0;
			if (id != null)
            {
                var datas_detail = db.TicketOrderDetails.FirstOrDefault(t => t.Id == id);
                // 要回頭找座位價格 然後扣訂單總金額
                var datas = db.TicketOrders.FirstOrDefault(t => t.OrderId == datas_detail.OrderId);
                Detail_id = datas_detail.OrderId;
                var stock = db.SeatStocks.FirstOrDefault(t => t.Area == datas_detail.Area && t.EventId == datas_detail.EventId) ;

                stock.Stock += 1;
                stock.Sold -= 1;

                datas.OrderTotalPrice -= stock.Price;

                db.Remove(datas_detail);
                db.SaveChanges();
                //List_Detail(Detail_id);
				return RedirectToAction("List_Detail", new { id = Detail_id });

			}

			return RedirectToAction("List_Detail");
        }

        public IActionResult Delete_Detail_All(int? OrderId)
        {
            YoungArtistsContext db = new YoungArtistsContext();

            if (OrderId != null)
            {
                var datas_detail = db.TicketOrderDetails.FirstOrDefault(t => t.OrderId == OrderId);
                // 要回頭找座位價格 然後扣訂單總金額
                var Detail_id = datas_detail.OrderId;
                var stock = db.SeatStocks.FirstOrDefault(t => t.Area == datas_detail.Area && t.EventId == datas_detail.EventId);
                stock.Stock += 1;
                stock.Sold -= 1;

                db.Remove(datas_detail);
                db.SaveChanges();
                List_Detail(Detail_id);
            }

            return RedirectToAction("List_Detail");
        }
    }
}
