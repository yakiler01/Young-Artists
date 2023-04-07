using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class EventTypeController : Controller
    {
        public IActionResult List(EventKeywordViewModel vm)
        {
            IEnumerable<EventType> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtEventKeyword))
                datas = from t in db.EventTypes
                        select t;
            else
                datas = db.EventTypes.Where(t => t.EventTypeName.Contains(vm.txtEventKeyword));
            return View(datas);
        }
        public IActionResult Create()
        {

            return View();

        }
        [HttpPost]
        public IActionResult Create(EventType et)
        {
            YoungArtistsContext db = new YoungArtistsContext();


            db.EventTypes.Add(et);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                EventType delEventType = db.EventTypes.FirstOrDefault(t => t.EventTypeId == id);
                if (delEventType != null)
                {
                    db.EventTypes.Remove(delEventType);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(EventType et)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            var datas = db.EventTypes.FirstOrDefault(t => t.EventTypeId == et.EventTypeId);


            if (datas != null)
            {
                datas.EventTypeName = et.EventTypeName;

                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.EventTypes.FirstOrDefault(t => t.EventTypeId == id);
                if (datas != null)
                {
                    return View(datas);
                }
            }
            return RedirectToAction("List");
        }
    }
}
