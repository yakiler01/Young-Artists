using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artists.Models;
using Young_Artists.ViewModel;
using Young_Artists.ViewModels;
using Customer = Young_Artists.Models.Customer;

namespace Young_Artists.Controllers
{
    //商品訂單表
    public class OrderFormController : Controller
    {
        public IActionResult Index()
        {
            //var query = from o in orders
            //            join c in customers on o.CustomerID equals c.ID
            //            select new { o.OrderID, c.Name };
            return View();
        }
        public IActionResult List(CKeywordViewModel vm)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            //if (string.IsNullOrEmpty(vm.txtKeyword.ToString()))
            //if (vm.txtKeyword == 0)
            //{
            //    datas = from o in db.OrderForms
            //            select o;
            //}
            //else
            //{
            //    datas = db.OrderForms.Where(t => t.NumberId == vm.txtKeyword);
            //}
            
           var datas = from o in db.OrderForms
                       join c in db.Commodities on o.CommodityId equals c.Id
                       join cu in db.Customers on o.NumberId equals cu.CustomerId
                       select new COrderFormViewModel {
                         Id = o.Id,
                         NumberId=o.NumberId,
                         CommodityId=o.CommodityId,
                         OrderTime=o.OrderTime,
                         QuantityOrder=o.QuantityOrder,
                         IsState=o.IsState,
                         CommdityPrice = c.CommodityPrice,
                         CommodityName = c.CommodityName,
                         CustomerName = cu.CustomerName
                       };


            /*datas = from o in db.OrderForms
                        //join c in db.Customers on o.NumberId equals c.CustomerId
                        //select new {db.OrderForms=o,db.Customers=c};
                        //db.OrderForms.Join(db.Customers,
                        //o => o.NumberId,
                        //c => c.CustomerId,
                        //(o, c) => new {o});
                    from o in db.OrderForms
                    select o;*/
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(OrderForm orderForm)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            orderForm.OrderTime = DateTime.Now.ToString();
            db.OrderForms.Add(orderForm);
            db.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            OrderForm delOrderForm = db.OrderForms.FirstOrDefault(c => c.Id == id);
            if (delOrderForm != null)
            {
                db.OrderForms.Remove(delOrderForm);
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext db = new YoungArtistsContext();
                OrderForm x = db.OrderForms.FirstOrDefault(t => t.Id == id);
                return View(x);
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(OrderForm c)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            OrderForm x = db.OrderForms.FirstOrDefault(t => t.Id == c.Id);
            if (x != null)
            {
                x.NumberId = c.NumberId;
                x.CommodityId = c.CommodityId;
                x.OrderTime = c.OrderTime;
                x.QuantityOrder = c.QuantityOrder;
                x.IsState = c.IsState;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult QueryCustomer(int id)
        {
            /*IEnumerable<Customer> datas = null;
            Customer customer= null;
            YoungArtistsContext db = new YoungArtistsContext();
            //if (string.IsNullOrEmpty(vm.txtKeyword.ToString()))
            customer = db.Customers.FirstOrDefault(t => t.CustomerId == id);
            return View(customer);*/
            
            IEnumerable<Customer> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            datas = datas = db.Customers.Where(t => t.CustomerId == id);
            return View(datas);
            
        }
        public IActionResult QueryCommodity(int id)
        {
            /*IEnumerable<Customer> datas = null;
            Customer customer= null;
            YoungArtistsContext db = new YoungArtistsContext();
            //if (string.IsNullOrEmpty(vm.txtKeyword.ToString()))
            customer = db.Customers.FirstOrDefault(t => t.CustomerId == id);
            return View(customer);*/

            IEnumerable<Commodity> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            datas = datas = db.Commodities.Where(t => t.Id == id);
            return View(datas);

        }
        public IActionResult OnLine(int? id)
        {
            YoungArtistsContext db = new YoungArtistsContext();
            OrderForm x = db.OrderForms.FirstOrDefault(t => t.Id == id);
            if (x != null)
            {
                x.IsState = !x.IsState;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
        public IActionResult List2(CKeywordViewModel vm)
        {
            //IEnumerable<> datas = null;
            YoungArtistsContext db = new YoungArtistsContext();
            var datas = db.OrderForms.Join(db.Customers,
                        o => o.NumberId,
                        c => c.CustomerId,
                        (o, c) => new {o,c});
                        /*datas = from o in db.OrderForms
                                    //join c in db.Customers on o.NumberId equals c.CustomerId
                                    //select new {db.OrderForms=o,db.Customers=c};
                                    //db.OrderForms.Join(db.Customers,
                                    //o => o.NumberId,
                                    //c => c.CustomerId,
                                    //(o, c) => new {o});
                                from o in db.OrderForms
                                select o;*/
            return View(datas);
        }
    }
}
