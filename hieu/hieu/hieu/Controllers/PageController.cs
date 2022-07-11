using hieu.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hieu.Controllers
{
    public class PageController : Controller
    {
        private NuocngotEntities db = new NuocngotEntities();
        // GET: SHOP
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Cart()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }

        public ActionResult Coca()
        {
            return View();
        }
        public ActionResult Fanta()
        {
            return View();
        }
        public ActionResult Sprite()
        {
            return View();
        }
        public ActionResult CheckOut()
        {
            return View();
        }
        public JsonResult CreateHoaDon(Hoadon model)
        {
            try
            {
                if (model.Chitiethoadons.Count > 0)
                {
                    foreach (var item in model.Chitiethoadons)
                    {
                        item.Mahd = model.Mahd;
                    }
                }
                db.Hoadon.Add(model);
                db.SaveChanges();
                return Json(new { ok = 1 }, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new { ok = 0 }, JsonRequestBehavior.AllowGet);
            }

        }
    



        public ActionResult Shopdetails(string Masp)
        {
            ViewBag.Masp = Masp;
            return View();
        }
        public JsonResult Getchitiet(int Masp)
        {
            var obj = db.SP.Select(a => new
            {
                Masp = a.Masp,
                Ten = a.Ten,
                Anh = a.Anh,
                Gia = a.Gia,
            }).SingleOrDefault(x => x.Masp == Masp);
            return Json(obj, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Getcoca()
        {
            var list = db.SP.Where(x=> x.Loai=="coca").Select(a => new
            {
                Masp = a.Masp,
                Anh = a.Anh,
                Ten = a.Ten,
                Gia = a.Gia,
                Loai=a.Loai,
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Getfanta()
        {
            var list = db.SP.Where(x => x.Loai == "fanta").Select(a => new
            {
                Masp = a.Masp,
                Anh = a.Anh,
                Ten = a.Ten,
                Gia = a.Gia,
                Loai = a.Loai,
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Getsprite()
        {
            var list = db.SP.Where(x => x.Loai == "sprite").Select(a => new
            {
                Masp = a.Masp,
                Anh = a.Anh,
                Ten = a.Ten,
                Gia = a.Gia,
                Loai = a.Loai,
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}