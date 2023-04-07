using Microsoft.AspNetCore.Mvc;

namespace Young_Artist_Server.Controllers
{
    public class PaymentController : Controller
    {
        public IActionResult GoToPayment()
        {
            return Redirect("http://localhost:5173/PaymentView/");
        }
    }
}
