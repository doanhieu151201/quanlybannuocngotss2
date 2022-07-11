using hieu.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hieu.Controllers
{
    public class HomeController : Controller
    {
        private NuocngotEntities db = new NuocngotEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public JsonResult AjaxHome()
        {
            var list = db.SP.Select(a => new
            {
                Masp = a.Masp,
                Anh = a.Anh,
                Ten = a.Ten,
                Gia = a.Gia,
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetSPNhieu()
        {
            var list = db.SP.OrderByDescending(x => x.Ban).Select(a => new
            {
                Masp = a.Masp,
                Anh = a.Anh,
                Ten = a.Ten,
                Gia = a.Gia,
                Ban=a.Ban
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}