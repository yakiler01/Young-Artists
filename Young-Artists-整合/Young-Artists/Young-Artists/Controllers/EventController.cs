using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Young_Artists.Models;
using Young_Artists.ViewModels;


namespace Young_Artists.Controllers
{
    public class EventController : Controller
    {
        IWebHostEnvironment _environment;
        public EventController(IWebHostEnvironment e)
        {
            _environment = e;
        }

        public IActionResult List(EventKeywordViewModel vm)
        {

            IEnumerable<Event> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtEventKeyword))
                datas = from t in db.Events
                        select t;
            else
                datas = db.Events.Where(t => t.EventName.Contains(vm.txtEventKeyword));
            return View(datas);
        }
        public IActionResult Create()
        {
            var model = new Event();
            model.EventStartTimestamp = DateTime.Now.ToString("2023-01-23T19:00");
            model.EventEndTimestamp = DateTime.Now.ToString("2023-01-23T19:00");
            model.EventSellStartTimestamp = DateTime.Now.ToString("2023-01-23T19:00");
            model.EventSellEndTimestamp = DateTime.Now.ToString("2023-01-23T19:00");
            model.EventIsstate = true;
            model.EventName = "周杰倫演唱會";
            return View(model);
            
        }
        [HttpPost]
        public IActionResult Create(Event e, EventViewModel ev)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            e.EventStartTimestamp = Convert.ToDateTime(e.EventStartTimestamp).ToString("G");
            e.EventEndTimestamp = Convert.ToDateTime(e.EventEndTimestamp).ToString("G");
            e.EventSellStartTimestamp = Convert.ToDateTime(e.EventSellStartTimestamp).ToString("G");
            e.EventSellEndTimestamp = Convert.ToDateTime(e.EventSellEndTimestamp).ToString("G");

            if (ev.photo != null)
            {
                string fileExtension = System.IO.Path.GetExtension(ev.photo.FileName);
                string photoName = Guid.NewGuid().ToString() + fileExtension;
                string path = _environment.WebRootPath + "/Images/" + photoName;
                e.EventImage = photoName;
                ev.photo.CopyTo(new FileStream(path, FileMode.Create));
            }

            db.Events.Add(e);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Event delEvent = db.Events.FirstOrDefault(t => t.EventId == id);
                if (delEvent != null)
                {
                    db.Events.Remove(delEvent);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(Event e, EventViewModel vm)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            var datas = db.Events.FirstOrDefault(t => t.EventId == e.EventId);
            e.EventStartTimestamp = Convert.ToDateTime(e.EventStartTimestamp).ToString("G");
            e.EventEndTimestamp = Convert.ToDateTime(e.EventEndTimestamp).ToString("G");
            e.EventSellStartTimestamp = Convert.ToDateTime(e.EventSellStartTimestamp).ToString("G");
            e.EventSellEndTimestamp = Convert.ToDateTime(e.EventSellEndTimestamp).ToString("G");

            if (datas != null)
            {
                if (vm.photo != null)
                {

                        string fileExtension = System.IO.Path.GetExtension(vm.photo.FileName);
                        string photoName = Guid.NewGuid().ToString() + fileExtension;
                        string path = _environment.WebRootPath + "/Images/" + photoName;
                        datas.EventImage = photoName;
                        vm.photo.CopyTo(new FileStream(path, FileMode.Create));

                }
                datas.CompanyId = e.CompanyId;
                datas.EventName = e.EventName;
                datas.EventInfo = e.EventInfo;
                datas.EventSellStartTimestamp = e.EventSellStartTimestamp;
                datas.EventSellEndTimestamp = e.EventSellEndTimestamp;
                datas.EventStartTimestamp = e.EventStartTimestamp;
                datas.EventSellStartTimestamp = e.EventSellStartTimestamp;
                datas.EventTypeId = e.EventTypeId;
                datas.EventLocationId = e.EventLocationId;
                datas.EventIsstate = e.EventIsstate;

                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
       
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.Events.FirstOrDefault(t => t.EventId == id);
                if (datas != null)
                {
                    string date_EventStartTimestamp = datas.EventStartTimestamp;
                    string date_EventEndTimestamp = datas.EventEndTimestamp; 
                    string date_EventSellStartTimestamp = datas.EventSellStartTimestamp;
                    string date_EventSellEndTimestamp = datas.EventSellEndTimestamp;
                    // 將字串轉換為日期時間物件
                    DateTime dateTime_EventStartTimestamp = DateTime.Parse(date_EventStartTimestamp);
                    DateTime dateTime_EventEndTimestamp = DateTime.Parse(date_EventEndTimestamp);
                    DateTime dateTime_EventSellStartTimestamp = DateTime.Parse(date_EventSellStartTimestamp);
                    DateTime dateTime_EventSellEndTimestamp = DateTime.Parse(date_EventSellEndTimestamp);

                    // 轉換為指定格式的字串
                    string newFormat_EventStartTimestamp = dateTime_EventStartTimestamp.ToString("yyyy-MM-ddTHH:mm");
                    string newFormat_EventEndTimestamp = dateTime_EventEndTimestamp.ToString("yyyy-MM-ddTHH:mm");
                    string newFormat_EventSellStartTimestamp = dateTime_EventSellStartTimestamp.ToString("yyyy-MM-ddTHH:mm");
                    string newFormat_EventSellEndTimestamp = dateTime_EventSellEndTimestamp.ToString("yyyy-MM-ddTHH:mm");

                    datas.EventStartTimestamp = newFormat_EventStartTimestamp;
                    datas.EventEndTimestamp = newFormat_EventEndTimestamp;
                    datas.EventSellStartTimestamp = newFormat_EventSellStartTimestamp;
                    datas.EventSellEndTimestamp = newFormat_EventSellEndTimestamp;

                    return View(datas);
                }
            }
            return RedirectToAction("List");
        }

        public IActionResult Discontinued(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.Events.FirstOrDefault(t => t.EventId == id);
                if (datas != null)
                {
                    datas.EventIsstate = false; // 下架
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
                var datas = db.Events.FirstOrDefault(t => t.EventId == id);
                if (datas != null)
                {
                    datas.EventIsstate = true; // 上架
                    db.SaveChangesAsync();
                }
            }

            return RedirectToAction("List");
        }
    }
}
