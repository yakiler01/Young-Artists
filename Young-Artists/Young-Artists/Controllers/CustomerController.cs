using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using System.Web.Mvc;
using X.PagedList;
using Young_Artists.Models;
using Young_Artists.ViewModels;
using X.PagedList;
using HttpGetAttribute = Microsoft.AspNetCore.Mvc.HttpGetAttribute;
using ActionResult = Microsoft.AspNetCore.Mvc.ActionResult;
using HttpPostAttribute = Microsoft.AspNetCore.Mvc.HttpPostAttribute;
//using Microsoft.AspNetCore.Mvc;Microsoft.AspNetCore.Mvc.

namespace Young_Artists.Controllers
{
    public class CustomerController : SuperController
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
            p.CustomerCreatTimestamp = DateTime.Now.ToString("yyyy-MM-dd tt HH:mm:ss");
            p.CustomerUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd tt HH:mm:ss");
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

        [HttpPost]
        public IActionResult Edit(Customer p)
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
                x.CustomerUpdateTimestamp = DateTime.Now.ToString("yyyy-MM-dd tt HH:mm:ss");
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }


        [HttpGet]
        public IActionResult List(string sortCustomer, int page = 1)
        {
            int pageSize = 10;
            ViewBag.SortBy = sortCustomer;
            var currentPage = page < 1 ? 1 : page;
            //IEnumerable<Customer> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            //datas = from t in db.Customers
            //        select t;
            IPagedList<Customer> results = null;
            switch (sortCustomer)
            {
                case "UpCustomerId":
                    results = db.Customers.OrderBy(t => t.CustomerId).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerId":
                    results = db.Customers.OrderByDescending(t => t.CustomerId).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerName":
                    results = db.Customers.OrderBy(t => t.CustomerName).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerName":
                    results = db.Customers.OrderByDescending(t => t.CustomerName).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerPhone":
                    results = db.Customers.OrderBy(t => t.CustomerPhone).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerPhone":
                    results = db.Customers.OrderByDescending(t => t.CustomerPhone).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerRegion":
                    results = db.Customers.OrderBy(t => t.CustomerRegion).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerRegion":
                    results = db.Customers.OrderByDescending(t => t.CustomerRegion).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerAddress":
                    results = db.Customers.OrderBy(t => t.CustomerAddress).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerAddress":
                    results = db.Customers.OrderByDescending(t => t.CustomerAddress).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerBirthDate":
                    results = db.Customers.OrderBy(t => t.CustomerBirthDate).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerBirthDate":
                    results = db.Customers.OrderByDescending(t => t.CustomerBirthDate).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerGender":
                    results = db.Customers.OrderByDescending(t => t.CustomerGender).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerGender":
                    results = db.Customers.OrderBy(t => t.CustomerGender).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerCreatTimestamp":
                    results = db.Customers.OrderByDescending(t => t.CustomerCreatTimestamp).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerCreatTimestamp":
                    results = db.Customers.OrderBy(t => t.CustomerCreatTimestamp).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "UpCustomerUpdateTimestamp":
                    results = db.Customers.OrderByDescending(t => t.CustomerUpdateTimestamp).ToList().ToPagedList(currentPage, pageSize);
                    break;
                case "DownCustomerUpdateTimestamp":
                    results = db.Customers.OrderBy(t => t.CustomerUpdateTimestamp).ToList().ToPagedList(currentPage, pageSize);
                    break;
                default:
                    results = db.Customers.ToList().ToPagedList(currentPage, pageSize);
                    break;

            }
            return View(results);
        }




    }
}
