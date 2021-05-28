using Microsoft.AspNetCore.Mvc;
using Serenity.Web;

namespace SereneTemplate.Northwind.Pages
{
    [PageAuthorize(typeof(Entities.ProductRow))]
    public class ProductController : Controller
    {
        [Route("Northwind/Product")]
        public ActionResult Index()
        {
            return View(MVC.Views.Northwind.Product.ProductIndex);
        }
    }
}
