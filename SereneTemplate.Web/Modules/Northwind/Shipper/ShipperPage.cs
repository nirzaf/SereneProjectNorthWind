﻿using Microsoft.AspNetCore.Mvc;
using Serenity.Web;




namespace SereneTemplate.Northwind.Pages
{
    [PageAuthorize(typeof(Entities.ShipperRow))]
    public class ShipperController : Controller
    {
        [Route("Northwind/Shipper")]
        public ActionResult Index()
        {
            return View(MVC.Views.Northwind.Shipper.ShipperIndex);
        }
    }
}
