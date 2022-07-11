using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hieu.Models;
namespace hieu.Areas.Admin.Controllers
{
    public class TintucController : Controller
    {
        NuocngotEntities db = new NuocngotEntities();

        // GET: Admin/Tintuc
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Tintuc()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetTT()
        {
            var list = db.Tintuc.Select( tt=> new
            {
                Matt = tt.Matt,
                Anh = tt.Anh,
                Tentt = tt.Tentt,
                Noidung = tt.Noidung,
                
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult GetTTID(int Matt)
        {
            return Json(new { data = db.Tintuc.Select(x => new { x.Matt, x.Anh, x.Tentt, x.Noidung }).FirstOrDefault(y => y.Matt == Matt) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult UpdateTT(Tintuc ltt)
        {
            int res = 0;
            try
            {
                db.Tintuc.Attach(ltt);
                db.Entry(ltt).State = EntityState.Modified;
                db.SaveChanges();
                res = 1;
            }
            catch (Exception e)
            {

                res = 0; ;
            }
            return Json(new { kq = "200", res = res }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddTT(Tintuc tt)
        {
            int res = 0;
            try
            {
                db.Tintuc.Add(tt);
                db.SaveChanges();
                res = 1;
            }
            catch (Exception e)
            {

                res = 0;
            }
            return Json(new { kq = "200", res = res }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteTT(Tintuc tt)
        {
            var ls = db.Tintuc.FirstOrDefault(x => x.Matt == tt.Matt);
            db.Tintuc.Remove(ls);
            db.SaveChanges();
            return Json(new { data = "Ok", }, JsonRequestBehavior.AllowGet);
        }



        public JsonResult Upload()
        {
            try
            {
                HttpPostedFileBase file = Request.Files[0];
                if (file != null)
                {
                    string path = Server.MapPath("~") + "Areas\\Admin\\content\\img\\imgtintuc\\";
                    string fileName = file.FileName;
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    string fullPath = path + "\\" + fileName;
                    file.SaveAs(fullPath);
                    return Json("Areas/Admin/content/img/imgtintuc/" + fileName, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(null, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(null, JsonRequestBehavior.AllowGet);
            }
        }
    }
}