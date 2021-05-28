using Microsoft.AspNetCore.Mvc;
using Serenity.Web;

namespace SereneTemplate.BasicSamples.Pages
{
    [PageAuthorize, Route("BasicSamples/[action]")]
    public partial class BasicSamplesController : Controller
    {
    }
}
