using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using Young_Artists_Customers.Models;
using Young_Artists_Customers.ViewModels;

namespace Young_Artists_Customers.Controllers
{
    public class CustomerController : Controller
    {
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<Customer> datas=null;
            YoungArtistsContext db = new YoungArtistsContext();
            if (string.IsNullOrEmpty(vm.txtKeyword))
                datas = from t in db.Customers
                        select t;
            else
                datas = db.Customers.Where(t=>t.CustomerName.Contains(vm.txtKeyword)||t.CustomerEmail.Contains(vm.txtKeyword)||                
                t.CustomerPhone.Contains(vm.txtKeyword) ||
                t.CustomerRegion.Contains(vm.txtKeyword) ||
                t.CustomerAddress.Contains(vm.txtKeyword) ||
                t.CustomerBirthDate.Contains(vm.txtKeyword) ||
                t.CustomerGender.Contains(vm.txtKeyword));
            return View(datas);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Customer p) 
        {
            YoungArtistsContext db = new YoungArtistsContext();
            db.Customers.Add(p);
            p.CustomerCreatTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm ss tt");
            p.CustomerUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm ss tt");
            db.SaveChanges();
            return RedirectToAction("List");
        }

        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Customer delCustomer =db.Customers.FirstOrDefault(t=>t.CustomerId== id);
                if(delCustomer!= null)
                {
                    db.Customers.Remove(delCustomer);
                    db.SaveChangesAsync() ;
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public ActionResult Edit(Customer p)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Customer x = db.Customers.FirstOrDefault(t => t.CustomerId == p.CustomerId);
            if (x != null)
            {
                x.CustomerName = p.CustomerName;
                x.CustomerEmail = p.CustomerEmail;
                x.CustomerPassword = p.CustomerPassword;
                x.CustomerPhone = p.CustomerPhone;
                x.CustomerRegion = p.CustomerRegion;
                x.CustomerAddress = p.CustomerAddress;
                x.CustomerBirthDate = p.CustomerBirthDate;
                x.CustomerGender = p.CustomerGender;
                x.CustomerCreatTimestamp = p.CustomerCreatTimestamp;                
                //x.CustomerUpdateTimestamp = p.CustomerUpdateTimestamp;
                x.CustomerUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm ss tt");
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public ActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Customer x = db.Customers.FirstOrDefault(t => t.CustomerId == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }
    }
}
