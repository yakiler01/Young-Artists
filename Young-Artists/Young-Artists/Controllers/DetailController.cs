using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class DetailController : Controller
    {
        public IActionResult List()
        {
            YoungArtistsContext db = new YoungArtistsContext();
            var datas = from e in db.Events
                        join d in db.Details on e.EventId equals d.EventId
                        select new DetailsViewModels {
                            EventId = e.EventId,
                            EventImage = e.EventImage,
                            EventName = e.EventName,
                            EventInfo = e.EventInfo,
                            CompanyId = e.CompanyId,
                            EventSellStartTimestamp = e.EventSellStartTimestamp,
                            EventSellEndTimestamp = e.EventSellEndTimestamp,
                            EventStartTimestamp = e.EventStartTimestamp,
                            EventEndTimestamp = e.EventEndTimestamp,
                            EventTypeId = e.EventTypeId,
                            EventLocationId = e.EventLocationId,
                            EventIsstate = e.EventIsstate,
                            DetailsId = d.DetailsId,
                            Eventtime = d.Eventtime,
                            State = d.State,
                            Reason = d.Reason
                        };
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Detail d)
        {
            YoungArtistsContext art = new YoungArtistsContext();
            art.Details.Add(d);
            art.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext art = new YoungArtistsContext();
                Detail d = art.Details.FirstOrDefault(t => t.DetailsId == id);
                if (d != null)
                {
                    art.Details.Remove(d);
                    art.SaveChanges();
                }
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext art = new YoungArtistsContext();
                Detail d = art.Details.FirstOrDefault(t => t.DetailsId == id);
                if (d != null)
                {
                    return View(d);
                }
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(Detail a)
        {
            YoungArtistsContext art = new YoungArtistsContext();
            Detail d = art.Details.FirstOrDefault(t => t.DetailsId == a.DetailsId);
            if (d != null)
            {
                d.Eventtime = a.Eventtime;
                d.EventId = a.EventId;
                d.State = a.State;
                d.Reason = a.Reason;
                art.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
    }
}