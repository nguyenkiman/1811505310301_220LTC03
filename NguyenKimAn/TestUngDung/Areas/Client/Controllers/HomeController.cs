using ModelEF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Client.Controllers
{
    public class HomeController : Controller
    {
        private NguyenKimAnContext db = new NguyenKimAnContext();
        // GET: Client/Home
        public ActionResult Index()
        {
            var products = db.Products;
            return View(products.ToList());
        }
    }
}