using Microsoft.AspNetCore.Mvc;

using Young_Artists.Models;
using Young_Artists.ViewModels;


namespace Young_Artists.Controllers
{
    public class EventLocationController : Controller
    {
        IWebHostEnvironment _environment;
        public EventLocationController(IWebHostEnvironment e)
        {
            _environment = e;
        }

        public IActionResult List(EventKeywordViewModel vm)
        {
            IEnumerable<EventLocation> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtEventKeyword))
                datas = from t in db.EventLocations
                        select t;
            else
                datas = db.EventLocations.Where(t => t.EventLocationName.Contains(vm.txtEventKeyword));
            return View(datas);
        }
        public IActionResult Create()
        {
            var model = new EventLocation();
            model.EventLocationName = "國家音樂廳";
            model.EventLocationInfo = "內有兩個表演空間，分別是採「鞋盒式」設計的音樂廳（2022席，含14個輪椅席）、演奏廳（354席，含4個輪椅席），皆具國際級頂尖音場設計。鎮館之寶是全亞洲最大的機械式管風琴。";

            model.EventLocationIsstate = true;
            return View(model);

        }
        [HttpPost]
        public IActionResult Create(EventLocation el , EventLocationViewModel vm)
        {
            YoungArtistsContext db = new YoungArtistsContext();

            if (vm.photo != null)
            {
                string fileExtension = System.IO.Path.GetExtension(vm.photo.FileName);
                string photoName = Guid.NewGuid().ToString() + fileExtension;
                string path = _environment.WebRootPath + "/Images/" + photoName;
                el.EventLocationImage = photoName;
                vm.photo.CopyTo(new FileStream(path, FileMode.Create));
            }

            db.EventLocations.Add(el);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                EventLocation delEventLoction = db.EventLocations.FirstOrDefault(t => t.EventLocationId == id);
                if (delEventLoction != null)
                {
                    db.EventLocations.Remove(delEventLoction);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(EventLocationViewModel vm,EventLocation e)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            var datas = db.EventLocations.FirstOrDefault(t => t.EventLocationId == e.EventLocationId);


            if (datas != null)
            {
                if (vm.photo != null)
                {

                    string fileExtension = System.IO.Path.GetExtension(vm.photo.FileName);
                    string photoName = Guid.NewGuid().ToString() + fileExtension;
                    string path = _environment.WebRootPath + "/Images/" + photoName;
                    datas.EventLocationImage = photoName;
                    vm.photo.CopyTo(new FileStream(path, FileMode.Create));

                }
                datas.EventLocationInfo = e.EventLocationInfo;
                datas.EventLocationAddress = e.EventLocationAddress;
                datas.EventLocationIsstate = e.EventLocationIsstate;
                datas.EventLocationName = e.EventLocationName;

                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                var datas = db.EventLocations.FirstOrDefault(t => t.EventLocationId == id);
                if (datas != null)
                {


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
                var datas = db.EventLocations.FirstOrDefault(t => t.EventLocationId == id);
                if (datas != null)
                {
                    datas.EventLocationIsstate = !datas.EventLocationIsstate; // 上架
                    db.SaveChangesAsync();
                }
            }

            return RedirectToAction("List");
        }
        
    }
}
