using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Young_Artists.Models;
using Young_Artists.ViewModels;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Printing;
using X.PagedList;
using Young_Artists.ViewModel;

namespace Young_Artists.Controllers
{
    public class EventController : Controller
    {
        IWebHostEnvironment _environment;
        public EventController(IWebHostEnvironment e)
        {
            _environment = e;
        }
		[HttpGet]
		public IActionResult List(string sortEvent, int page = 1)
		{
			int pageSize = 5;
			ViewBag.SortBy = sortEvent;
			var currentPage = page < 1 ? 1 : page;
			YoungArtistsContext db = new YoungArtistsContext();
			IPagedList<Event> results = null;
			switch (sortEvent)
			{
				case "UpEventId":
					results = db.Events.OrderBy(t => t.EventId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventId":
					results = db.Events.OrderByDescending(t => t.EventId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpCompanyId":
					results = db.Events.OrderBy(t => t.CompanyId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownCompanyId":
					results = db.Events.OrderByDescending(t => t.CompanyId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventName":
					results = db.Events.OrderBy(t => t.EventName).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventName":
					results = db.Events.OrderByDescending(t => t.EventName).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventType":
					results = db.Events.OrderBy(t => t.EventTypeId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventType":
					results = db.Events.OrderByDescending(t => t.EventTypeId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventLocation":
					results = db.Events.OrderBy(t => t.EventLocationId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventLocation":
					results = db.Events.OrderByDescending(t => t.EventLocationId).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventStart":
					results = db.Events.OrderBy(t => t.EventStartTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventStart":
					results = db.Events.OrderByDescending(t => t.EventStartTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventState":
					results = db.Events.OrderByDescending(t => t.EventIsstate).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventState":
					results = db.Events.OrderBy(t => t.EventIsstate).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventStartSell":
					results = db.Events.OrderBy(t => t.EventSellStartTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventStartSell":
					results = db.Events.OrderByDescending(t => t.EventSellStartTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventEnd":
					results = db.Events.OrderBy(t => t.EventEndTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventEnd":
					results = db.Events.OrderByDescending(t => t.EventEndTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "UpEventEndSell":
					results = db.Events.OrderBy(t => t.EventSellEndTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				case "DownEventEndSell":
					results = db.Events.OrderByDescending(t => t.EventSellEndTimestamp).ToList().ToPagedList(currentPage, pageSize);
					break;
				default:
					results = db.Events.ToList().ToPagedList(currentPage, pageSize);
					break;

			}
			return View(results);
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
            model.EventStartTimestamp = DateTime.Now.ToString("2023-03-25T19:00");
            model.EventEndTimestamp = DateTime.Now.ToString("2023-04-20T19:00");
            model.EventSellStartTimestamp = DateTime.Now.ToString("2023-04-15T19:00");
            model.EventSellEndTimestamp = DateTime.Now.ToString("2023-04-20T19:00");
			model.EventIsstate = true;
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
                datas.EventEndTimestamp = e.EventEndTimestamp;
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



        public IActionResult Continued(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.Events.FirstOrDefault(t => t.EventId == id);
                if (datas != null)
                {
                    datas.EventIsstate = !datas.EventIsstate; // 上架
                    db.SaveChangesAsync();
                }
            }

            return RedirectToAction("List");
        }
		public IActionResult OnLine(int? id)
		{
			YoungArtistsContext db = new YoungArtistsContext();
			Event x = db.Events.FirstOrDefault(t => t.EventId == id);
			if (x != null)
			{
				x.EventIsstate = !x.EventIsstate;
				db.SaveChangesAsync();
			}
			Debug.WriteLine("123");
			return RedirectToAction("List");
		}
		[HttpPost]
		public IActionResult BatchOnLine(string chkVal1)
		{
			YoungArtistsContext db = new YoungArtistsContext();
			if (chkVal1 != "")
			{
				List<int> idList = JsonConvert.DeserializeObject<List<int>>(chkVal1);
				for (int i = 0; i < idList.Count; i++)
				{
					Event x = db.Events.FirstOrDefault(t => t.EventId == idList[i]);
					if (x != null)
					{
						x.EventIsstate = true;
						db.SaveChangesAsync();
					}
				}
			}
			return RedirectToAction("List");
		}

		[HttpPost]
		public IActionResult BatchOffLine(string chkVal2)
		//int[] idList List<int> idList
		{
			YoungArtistsContext db = new YoungArtistsContext();
			if (chkVal2 != "")
			{
				List<int> idList = JsonConvert.DeserializeObject<List<int>>(chkVal2);

				for (int i = 0; i < idList.Count; i++)
				{
					Event x = db.Events.FirstOrDefault(t => t.EventId == idList[i]);
					if (x != null)
					{
						x.EventIsstate = false;
						db.SaveChangesAsync();
					}
				}
			}
			return RedirectToAction("List");
		}

		[HttpPost]
		public IActionResult BatchDelect(string chkVal3)
		//int[] idList List<int> idList
		{
			YoungArtistsContext db = new YoungArtistsContext();
			if (chkVal3 != "")
			{
				List<int> idList = JsonConvert.DeserializeObject<List<int>>(chkVal3);
				for (int i = 0; i < idList.Count; i++)
				{
					Event delEvent = db.Events.FirstOrDefault(t => t.EventId== idList[i]);
					if (delEvent != null)
					{
						db.Events.Remove(delEvent);
						db.SaveChangesAsync();
					}
				}
			}
			return RedirectToAction("List");
		}
	}
}
