using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Printing;
using X.PagedList;
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

        public IActionResult Index(int page = 1, int pageSize = 3)
        {
            IPagedList<Commodity> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            //datas = from t in db.Commodities
            //        select t;
            //var datas = db.Commodities.AsQueryable();
            var currentPage = page < 1 ? 1 : page;
            var results = db.Commodities.ToPagedList(page, pageSize);
            return View(results);
            //return View();
        }

        //public IActionResult List()
        //{
        //    IEnumerable<Commodity> datas = null;
        //    YoungArtistsContext db = new YoungArtistsContext();
        //    datas = from t in db.Commodities
        //            select t;

        //    return View(datas);
        //}
        //int page = 1, int pageSize = 3
        //public IActionResult List(int page =1)
        //{
        //    IPagedList<Commodity> datas = null;
        //    YoungArtistsContext db = new YoungArtistsContext();
        //    //datas = from t in db.Commodities
        //    //        select t;
        //    var currentPage = page < 1 ? 1 : page;
        //    var results = db.Commodities.ToPagedList(currentPage, 2);
        //    return View(results);
        //}
        //public IActionResult List(int page = 1, int pageSize =2)
        //{
        //    IPagedList < Commodity > datas = null;
        //    YoungArtistsContext db = new YoungArtistsContext();
        //    //datas = from t in db.Commodities
        //    //        select t;
        //    //var datas = db.Commodities.AsQueryable();
        //    var results = db.Commodities.ToPagedList(page, pageSize);
        //    return View(results);
        //}

        [HttpGet]
        public IActionResult List(string sortCommodity,int page =1 )
        {
            int pageSize = 5;
            ViewBag.SortBy = sortCommodity;
            var currentPage = page < 1 ? 1 : page;
            //IEnumerable<Commodity> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            //datas = from t in db.Commodities
            //        select t;
            IPagedList<Commodity> results = null;
            switch (sortCommodity)
            {
                case "UpCommodityName":
                    results = db.Commodities.OrderBy(t=>t.CommodityName).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityName":
                    //datas = from t in db.Commodities
                    //        orderby t.CommodityName descending
                    //        select t;
                    results = db.Commodities.OrderByDescending(t => t.Id).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCommodityNum":
                    results = db.Commodities.OrderBy(t => t.CommodityNum).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityNum":
                    results = db.Commodities.OrderByDescending(t => t.CommodityNum).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCommodityId":
                    results = db.Commodities.OrderBy(t => t.Id).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityId":
                    results = db.Commodities.OrderByDescending(t => t.Id).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCommodityPrice":
                    results = db.Commodities.OrderBy(t => t.CommodityPrice).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityPrice":
                    results = db.Commodities.OrderByDescending(t => t.CommodityPrice).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCommodityStart":
                    results = db.Commodities.OrderBy(t => t.CommodityStart).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityStart":
                    results = db.Commodities.OrderByDescending(t => t.CommodityStart).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCommodityState":
                    results = db.Commodities.OrderByDescending(t => t.CommodityState).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCommodityState":
                    results = db.Commodities.OrderBy(t => t.CommodityState).ToList().ToPagedList(currentPage, pageSize);
                    break;
                default:
                    results = db.Commodities.ToList().ToPagedList(currentPage, pageSize);
                    break;

            }
            return View(results);
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
                //x.CommodityStart = vm.CommodityStart;
                x.CommodityPrice = vm.CommodityPrice;
                //x.CommodityImage = vm.CommodityImage;
                x.CommodityClassification = vm.CommodityClassification;
                x.CommodityState = vm.CommodityState;
                //db.Commodities.Add(x);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult OnLine(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Commodity x = db.Commodities.FirstOrDefault(t => t.Id == id);
            if (x != null)
            {
                x.CommodityState = !x.CommodityState;
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
                for(int i =0;i<idList.Count;i++)
                {
                    Commodity x = db.Commodities.FirstOrDefault(t => t.Id == idList[i]);
                    if (x != null)
                    {
                        x.CommodityState = true;
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
                    Commodity x = db.Commodities.FirstOrDefault(t => t.Id == idList[i]);
                    if (x != null)
                    {
                        x.CommodityState = false;
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
                    Commodity delCommodity = db.Commodities.FirstOrDefault(t => t.Id == idList[i]);
                    if (delCommodity != null)
                    {
                        db.Commodities.Remove(delCommodity);
                        db.SaveChangesAsync();
                    }
                }
            }
            return RedirectToAction("List");
        }
    }
}
