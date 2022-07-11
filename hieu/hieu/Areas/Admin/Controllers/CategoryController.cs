using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hieu.Models;
namespace hieu.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        NuocngotEntities db = new NuocngotEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Category()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetCategory()
        {
            var list = db.DanhmucSP.Select(sp => new
            {
                id = sp.id,
                TenDm = sp.TenDm,
            }).OrderBy(x => x.id).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult GetLSPID(int id)
        {
            return Json(new { data = db.DanhmucSP.Select(x => new { x.id, x.TenDm }).FirstOrDefault(y => y.id == id) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult UpdateLSP(DanhmucSP danhmuc)
        {
            int res = 0;
            try
            {
                db.DanhmucSP.Attach(danhmuc);//gọi dữ liệu đã có sẵn trong CSDL để sửa
                db.Entry(danhmuc).State = EntityState.Modified;
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
        public ActionResult SaveLSP(DanhmucSP danhmuc)
        {
            int res = 0;
            try
            {
                db.DanhmucSP.Add(danhmuc);
                db.SaveChanges();
                res = 1;
            }
            catch (Exception e)
            {

                res = 0;
            }
            return Json(new { kq = "200", res = res }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult DeleteLSP(int id)
        {
            var ls = db.DanhmucSP.FirstOrDefault(x => x.id == id);//Trả về phần tử đầu tiên của một chuỗi hoặc một giá trị mặc định nếu không tìm thấy phần tử nào.

            db.DanhmucSP.Remove(ls);
            db.SaveChanges();
            return Json(new { data = "Ok", }, JsonRequestBehavior.AllowGet);
        }
    }
}