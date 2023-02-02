using Microsoft.AspNetCore.Mvc;
using Young_Artists.Models;

namespace Young_Artists.Controllers
{
    //顧客表
    public class CustomersController : Controller
    {
        public IActionResult QueryId(int id)
        {
            return View();
        }
        public IActionResult List()
        {
            IEnumerable<Customer> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            datas = from t in db.Customers
                    select t;
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Customer customer)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            customer.CustomerCreatTimestamp = DateTime.Now.ToString();
            customer.CustomerUpdateTimestamp = DateTime.Now.ToString();
            db.Add(customer);
            db.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Customer delCustomers = db.Customers.FirstOrDefault(c => c.CustomerId == id);
            if (delCustomers != null)
            {
                db.Customers.Remove(delCustomers);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                Customer x = db.Customers.FirstOrDefault(t => t.CustomerId == id);
                return View(x);
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(Customer c)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            Customer x = db.Customers.FirstOrDefault(t => t.CustomerId == c.CustomerId);
            if (x != null)
            {
                x.CustomerName = c.CustomerName;
                x.CustomerEmail = c.CustomerEmail;
                x.CustomerPassword = c.CustomerPassword;
                x.CustomerPhone = c.CustomerPhone;
                x.CustomerRegion = c.CustomerRegion;
                x.CustomerAddress = c.CustomerAddress;
                x.CustomerBirthDate = c.CustomerBirthDate;
                x.CustomerGender = c.CustomerGender;
                x.CustomerCreatTimestamp = c.CustomerCreatTimestamp;
                x.CustomerUpdateTimestamp = c.CustomerUpdateTimestamp;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
    }
}
