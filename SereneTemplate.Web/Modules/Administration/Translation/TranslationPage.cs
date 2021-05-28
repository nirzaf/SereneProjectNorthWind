using Microsoft.AspNetCore.Mvc;
using Serenity.Web;

namespace SereneTemplate.Administration.Pages
{
    [PageAuthorize(PermissionKeys.Translation)]
    public class TranslationController : Controller
    {
        [Route("Administration/Translation")]
        public ActionResult Index()
        {
            return View(MVC.Views.Administration.Translation.TranslationIndex);
        }
    }
}