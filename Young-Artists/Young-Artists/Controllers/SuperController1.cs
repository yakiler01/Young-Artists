using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Young_Artists.Controllers
{
    public class SuperController1 : Controller
    {
        // GET: SuperController1
        public ActionResult Index()
        {
            return View();
        }

        // GET: SuperController1/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SuperController1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SuperController1/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: SuperController1/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SuperController1/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: SuperController1/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SuperController1/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
