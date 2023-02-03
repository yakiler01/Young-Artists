using Microsoft.AspNetCore.Mvc;
using NuGet.Protocol;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
	public class SeatStockController : SuperController
	{
		public IActionResult List(int ? id)
		{
            IEnumerable<SeatStock> datas = null;

            YoungArtistsContext db = new YoungArtistsContext();
			if (id != null)
			{
				datas = from t in db.SeatStocks
						where t.EventId == id
						select t;
			}
			else
			{
				datas = from t in db.SeatStocks
						select t;
			}
            return View(datas);
        }

		public IActionResult Create()
		{

			YoungArtistsContext db = new YoungArtistsContext();

			// 區域集合
			List<int> EventId = new List<int>();

			var EventData = from t in db.Events
							select t.EventId;
			foreach (var data in EventData)
			{
				EventId.Add((Int32)data);
			}

			ViewBag.EventId = EventId;

			return View();
		}
		[HttpPost]
		public IActionResult Create(SeatStock ss)
		{
			if (ss != null)
			{
				YoungArtistsContext db = new YoungArtistsContext();
				ss.Sold = 0;
				ss.Stock = ss.Quantity;
                db.SeatStocks.Add(ss);
				db.SaveChanges();
			}


			return RedirectToAction("List");
		}

		public IActionResult Edit(int ? id)
		{
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
				var datas = db.SeatStocks.FirstOrDefault(t => t.Id == id);
	

                // 區域集合
                List<int> EventId = new List<int>();

                var EventData = from t in db.Events
                                select t.EventId;
                foreach (var data in EventData)
                {
                    EventId.Add((Int32)data);
                }

                ViewBag.EventId = EventId;
                


				return View(datas);
            }

            return RedirectToAction("List");
		}
		[HttpPost]
		public IActionResult Edit(SeatStock ss)
		{
            if (ss != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.SeatStocks.FirstOrDefault(d => d.Id == ss.Id);

                datas.EventId = ss.EventId;
                datas.Area = ss.Area;
                datas.Quantity = ss.Quantity;
                datas.Stock = ss.Stock;
                datas.Sold = ss.Sold;
                datas.Price = ss.Price;
                datas.IsAvailable = ss.IsAvailable;

                db.SaveChanges();
            }

            return RedirectToAction("List");
        }

		public ActionResult Delete(int? id)
		{
			if (id != null)
			{
				YoungArtistsContext db = new YoungArtistsContext();
				var datas = db.SeatStocks.FirstOrDefault(t => t.Id == id);
				if (datas != null)
				{
					db.SeatStocks.Remove(datas);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}
		public IActionResult Continued(int? id)
		{
			if (id != null)
			{
				YoungArtistsContext db = new YoungArtistsContext();
				var datas = db.SeatStocks.FirstOrDefault(t => t.Id == id);
				if (datas != null)
				{
					datas.IsAvailable = !datas.IsAvailable; // 上架
					db.SaveChangesAsync();
				}
			}

			return RedirectToAction("List");
		}

	}
}
