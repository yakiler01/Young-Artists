using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class CompanyController : Controller
    {
        //廠商列表
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<Company> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtKeyword))
                datas = from t in db.Companies
                        select t;
            else
                datas = db.Companies.Where(t =>
                t.CompanyName.Contains(vm.txtKeyword) ||
                t.CompanyPhone.Contains(vm.txtKeyword) ||
                t.CompanyAddress.Contains(vm.txtKeyword) ||
                t.CompanyEmail.Contains(vm.txtKeyword));
            return View(datas);
        }

        //新增廠商
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Company p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            db.Companies.Add(p);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        //刪除廠商
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Company delCompany = db.Companies.FirstOrDefault(t => t.Id == id);
                if (delCompany != null)
                {
                    db.Companies.Remove(delCompany);
                    db.SaveChangesAsync();
                }
            }

            return RedirectToAction("List");
        }

        //廠商修改
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Company x = db.Companies.FirstOrDefault(t => t.Id == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(Company p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Company x = db.Companies.FirstOrDefault(t => t.Id == p.Id);
            if (x != null)
            {
                x.CompanyId = p.CompanyId;
                x.CompanyName = p.CompanyName;
                x.CompanyPhone = p.CompanyPhone;
                x.CompanyAddress = p.CompanyAddress;
                x.CompanyEmail = p.CompanyEmail;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
    }
}
