using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Young_Artists.Models;
using Young_Artists.ViewModel;

namespace Young_Artists.Controllers
{
    //商品表
    public class CommodityController : Controller
    {
        IWebHostEnvironment _environment;
        public CommodityController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
            IEnumerable < Commodity > datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            datas = from t in db.Commodities
                    select t;
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(CCommodityViewModel vm)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Commodity x = new Commodity();
            if (x != null)
            {
                if (vm.photo != null)
                {
                    string fileExtension = System.IO.Path.GetExtension(vm.photo.FileName);
                    string photoName = Guid.NewGuid().ToString() + fileExtension;
                    string path = _environment.WebRootPath + "/Images/" + photoName;
                    x.CommodityImage = photoName;
                    vm.photo.CopyTo(new FileStream(path, FileMode.Create));
                }
                x.CommodityName = vm.CommodityName;
                x.CommodityNarrative = vm.CommodityNarrative;
                x.CommodityNum = vm.CommodityNum;
                x.CommodityStart = DateTime.Now.ToString();
                //x.CommodityStart = vm.CommodityStart;
                x.CommodityPrice = vm.CommodityPrice;
                x.CommodityClassification = vm.CommodityClassification;
                x.CommodityState = vm.CommodityState;
                db.Commodities.Add(x);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Commodity delCommodity = db.Commodities.FirstOrDefault(c => c.Id== id);
            if(delCommodity != null)
            {
                db.Commodities.Remove(delCommodity);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Commodity x = db.Commodities.FirstOrDefault(t => t.Id == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(CCommodityViewModel vm)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Commodity x = db.Commodities.FirstOrDefault(t => t.Id == vm.Id);
            if (x != null)
            {
                if (vm.photo != null)
                {
                    string fileExtension = System.IO.Path.GetExtension(vm.photo.FileName);
                    string photoName = Guid.NewGuid().ToString() + fileExtension;
                    string path = _environment.WebRootPath + "/Images/" + photoName;
                    x.CommodityImage = photoName;
                    vm.photo.CopyTo(new FileStream(path, FileMode.Create));
                }
                x.CommodityName = vm.CommodityName;
                x.CommodityNarrative = vm.CommodityNarrative;
                x.CommodityNum = vm.CommodityNum;
                x.CommodityStart = vm.CommodityStart;
                x.CommodityPrice = vm.CommodityPrice;
                //x.CommodityImage = vm.CommodityImage;
                x.CommodityClassification = vm.CommodityClassification;
                x.CommodityState = vm.CommodityState;
                //db.Commodities.Add(x);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
    }
}
