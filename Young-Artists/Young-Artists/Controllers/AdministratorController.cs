using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;
using Young_Artists.ViewModel;

namespace Young_Artists.Controllers
{
    public class AdministratorController : SuperController
    {
        public IActionResult List()
        {

            IEnumerable<Administrator> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();            
                datas = from t in db.Administrators
                        select t;           
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Administrator p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            db.Administrators.Add(p);
            p.AdministratorCreatTimestamp = DateTime.Now.ToString("yyyy-MM-dd tt HH:mm:ss");
            p.AdministratorUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd tt HH:mm:ss");
            db.SaveChanges();
            return RedirectToAction("List");
        }
        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Administrator delAdministrator = db.Administrators.FirstOrDefault(t => t.AdministratorId == id);
                if (delAdministrator != null)
                {
                    db.Administrators.Remove(delAdministrator);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public ActionResult Edit(Administrator p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Administrator x = db.Administrators.FirstOrDefault(t => t.AdministratorId == p.AdministratorId);
            if (x != null)
            {
                x.AdministratorAccount = p.AdministratorAccount;
                x.AdministratorPassword = p.AdministratorPassword;
                x.AdministratorCreatTimestamp = p.AdministratorCreatTimestamp;
                x.AdministratorUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm ss tt");
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public ActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Administrator x = db.Administrators.FirstOrDefault(t => t.AdministratorId == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }
    }
}
