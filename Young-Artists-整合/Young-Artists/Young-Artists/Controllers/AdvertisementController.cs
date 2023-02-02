using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    //廣告
    public class AdvertisementController : Controller
    {
        //廣告圖片路徑
        IWebHostEnvironment _environment;

        public AdvertisementController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

    


        //廣告List
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<Advertisement> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtKeyword))
                datas = from t in db.Advertisements
                        select t;
            else
                datas = db.Advertisements.Where(t =>
                t.AdvertisementName.Contains(vm.txtKeyword) ||
                t.AdvertisementStartdate.Contains(vm.txtKeyword) ||
                t.AdvertisementEnddate.Contains(vm.txtKeyword));
            return View(datas);
        }

        //新增廣告
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(CAdvertisementViewModel p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Advertisement x = new Advertisement();
            if (p.photo != null)
            {
                string fileExtension = System.IO.Path.GetExtension(p.photo.FileName);
                string photoName = Guid.NewGuid().ToString() + fileExtension;
                string path = _environment.WebRootPath + "/Images/" + photoName;
                x.AdvertisementSrc = photoName;
                p.photo.CopyTo(new FileStream(path, FileMode.Create));
            }

            x.AdvertisementId = p.AdvertisementId;
            x.AdvertisementName = p.AdvertisementName;
            //x.AdvertisementSrc= p.AdvertisementSrc;
            x.AdvertisementAlt = p.AdvertisementAlt;
            x.AdvertisementHref = p.AdvertisementHref;
            x.AdvertisementStartdate = p.AdvertisementStartdate;
            x.AdvertisementEnddate = p.AdvertisementEnddate;
            x.CompanyId = p.CompanyId;
            x.EventId = p.EventId;
            x.AdvertisementOnline = p.AdvertisementOnline;

            db.Advertisements.Add(x);

            db.SaveChanges();
            return RedirectToAction("List");
        }

        //刪除廣告
        public IActionResult Delete(int? id)
        {
            if (id != null) 
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Advertisement delAdvertisement = db.Advertisements.FirstOrDefault(t => t.Id == id);
                if (delAdvertisement != null)
                {
                    db.Advertisements.Remove(delAdvertisement);
                    db.SaveChangesAsync();
                }
            }

            return RedirectToAction("List");
        }

        //廣告修改
        public IActionResult Edit(int? id)
        {
            if(id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Advertisement x = db.Advertisements.FirstOrDefault(t=>t.Id== id);
                if(x!=null)
                    return View(x);
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(CAdvertisementViewModel p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Advertisement x = db.Advertisements.FirstOrDefault(t => t.Id == p.Id);
            if (x != null)
            {
                //if(p.photo !=null)
                //{
                //    string photoName = Guid.NewGuid().ToString() + ".jpg";
                //    string path = _environment.WebRootPath+ "/images/"+photoName;
                //    x.AdvertisementSrc = photoName;
                //    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                //}
                if (p.photo != null)
                {
                    string fileExtension = System.IO.Path.GetExtension(p.photo.FileName);
                    string photoName = Guid.NewGuid().ToString() + fileExtension;
                    string path = _environment.WebRootPath + "/Images/" + photoName;
                    x.AdvertisementSrc = photoName;
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                }

                x.AdvertisementId = p.AdvertisementId;
                x.AdvertisementName = p.AdvertisementName;
                //x.AdvertisementSrc= p.AdvertisementSrc;
                x.AdvertisementAlt= p.AdvertisementAlt;
                x.AdvertisementHref= p.AdvertisementHref;
                x.AdvertisementStartdate= p.AdvertisementStartdate; 
                x.AdvertisementEnddate= p.AdvertisementEnddate;
                x.CompanyId= p.CompanyId;
                x.EventId= p.EventId;
                x.AdvertisementOnline= p.AdvertisementOnline;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }





    }
}
