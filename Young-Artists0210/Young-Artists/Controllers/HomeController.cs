using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text.Json;
using Young_Artists.Models;
using Young_Artists.ViewModels;

namespace Young_Artists.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewBag.Account=HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMIN);
            ViewBag.ID = HttpContext.Session.GetString(CDictionary.SK_LOINGED_ADMINID);

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            return View();
            //return PartialView();
        }
        [HttpPost]
        public IActionResult Login(CAdminLoginViewModel vm)
        {
            Administrator user = (new YoungArtistsContext()).Administrators.FirstOrDefault(
                t => t.AdministratorAccount.Equals(vm.txtAdminAccount) && t.AdministratorPassword.Equals(vm.txtAdminPassword));

            if (user != null && user.AdministratorPassword.Equals(vm.txtAdminPassword))
            {
                string json = JsonSerializer.Serialize(user);                
                HttpContext.Session.SetString(CDictionary.SK_LOINGED_ADMIN, json);
                HttpContext.Session.SetString(CDictionary.SK_LOINGED_ADMIN, vm.txtAdminAccount);
                HttpContext.Session.SetString(CDictionary.SK_LOINGED_ADMINID, (user.AdministratorId).ToString());

                return RedirectToAction("Index");

            }
            return View();
        }
        public IActionResult LogOut()
        {
            HttpContext.Session.Remove(CDictionary.SK_LOINGED_ADMIN);
            HttpContext.Session.Remove(CDictionary.SK_LOINGED_ADMINID);

            return RedirectToAction("Login");

        }
    }
}