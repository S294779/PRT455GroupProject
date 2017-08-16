using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace demo3.Controllers
{
    public class NewHomeController : Controller
    {
        // GET: NewHome
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Goto()
        {
            return View("Sharebrain");

        }
    }
}