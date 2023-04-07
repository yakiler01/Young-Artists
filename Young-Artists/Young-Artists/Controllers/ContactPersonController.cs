using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class ContactPersonController : Controller
    {

        //聯絡人列表
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<ContactPerson> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtKeyword))
                datas = from t in db.ContactPeople
                        select t;
            else
                datas = db.ContactPeople.Where(t =>
                t.ContactpersonName.Contains(vm.txtKeyword) ||
                t.ContactpersonTitle.Contains(vm.txtKeyword) ||
                t.ContactpersonPhone.Contains(vm.txtKeyword) ||
                t.ContactpersonEmail.Contains(vm.txtKeyword));
            return View(datas);
        }

        //新增聯絡人
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(ContactPerson p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            db.ContactPeople.Add(p);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        //刪除聯絡人
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                ContactPerson delContactPerson = db.ContactPeople.FirstOrDefault(t => t.Id == id);
                if (delContactPerson != null)
                {
                    db.ContactPeople.Remove(delContactPerson);
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
                ContactPerson x = db.ContactPeople.FirstOrDefault(t => t.Id == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(ContactPerson p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            ContactPerson x = db.ContactPeople.FirstOrDefault(t => t.Id == p.Id);
            if (x != null)
            {
                x.ContactpersonName = p.ContactpersonName;
                x.ContactpersonTitle = p.ContactpersonTitle;
                x.ContactpersonPhone = p.ContactpersonPhone;
                x.ContactpersonEmail = p.ContactpersonEmail;
                x.ContactpersonOnline = p.ContactpersonOnline;
                x.CompanyId = p.CompanyId;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }


    }
}
