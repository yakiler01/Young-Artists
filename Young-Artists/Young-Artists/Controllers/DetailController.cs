using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;

namespace Young_Artists.Controllers
{
    public class DetailController : Controller
    {
        public IActionResult List()
        {
            IEnumerable<Detail> datas = null;
            YoungArtistsContext art = new YoungArtistsContext();
            datas = from t in art.Details
                    select t;
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