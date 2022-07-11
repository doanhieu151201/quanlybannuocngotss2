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
    public class SPController : Controller
    {
        // GET: Admin/SP
        NuocngotEntities db = new NuocngotEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SanPham()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetSP()
        {
            var list = db.SP.Select(sp => new
            {
                Masp = sp.Masp,
                Anh = sp.Anh,
                Ten= sp.Ten,
                Gia = sp.Gia,
                Loai=sp.Loai,
            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult GetSPID(int Masp)
        {
            return Json(new { data = db.SP.Select(x => new { x.Masp, x.Anh, x.Ten, x.Gia, x.Loai}).FirstOrDefault(y => y.Masp == Masp) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult UpdateSanPham(SP sp)
        {
            try
            {
                var obj = db.SP.SingleOrDefault(x => x.Masp == sp.Masp);
                obj.Masp = sp.Masp;
                obj.Anh = sp.Anh;
                obj.Ten = sp.Ten;
                obj.Gia = sp.Gia;
                obj.Loai = sp.Loai;
                db.SaveChanges();
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(null, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult AddSanPham(SP sp)
        {
            int res = 0;
            try
            {
                db.SP.Add(sp);
                db.SaveChanges();
                res = 1;
            }
            catch (Exception e)
            {

                res = 0;
            }
            return Json(new { kq = "200", res = res }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteSP(SP sp)
        {
            var ls = db.SP.FirstOrDefault(x => x.Masp == sp.Masp);
            db.SP.Remove(ls);
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
                    string path = Server.MapPath("~") + "Areas\\Admin\\content\\img\\imgcoca\\";
                    string fileName = file.FileName;
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    string fullPath = path + "\\" + fileName;
                    file.SaveAs(fullPath);
                    return Json("Areas/Admin/content/img/imgcoca/" + fileName, JsonRequestBehavior.AllowGet);
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