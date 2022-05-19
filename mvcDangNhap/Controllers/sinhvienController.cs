using mvcDangNhap.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcDangNhap.Controllers
{
    public class sinhvienController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();
        List<sinhvien> lstsv = new List<sinhvien>();
        // GET: sinhvien
        public ActionResult Index()
        {

            lstsv = db.sinhvien.ToList();
            //Sử dụng procedure trong sql
            ViewBag.dssv_bysp = db.sp_getsinhvien_byLop(1);//ví dụ mã lớp 1
            //sử dụng truy vấn LinQ
            var dssv_bylq = (from s in db.sinhvien
                             where s.ma_lop == 1
                             select s).ToList();
            ViewBag.dssv_bylq = dssv_bylq;
            return View(lstsv);
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();

        }

        [HttpPost]
        public ActionResult Create(sinhvien sv)
        {
            if (ModelState.IsValid)
            {

                db.sinhvien.Add(sv);
                db.SaveChanges();
                ViewBag.StatusMessage = "Lưu thành công";               
            }
            return RedirectToAction("Index");

        }

        public ActionResult Edit(int id)
        {

            sinhvien sv = db.sinhvien.FirstOrDefault(c => c.sv_id == id);
            SetViewBag(sv.ma_lop);

            return View(sv);
        }
        [HttpPost]
        public ActionResult Edit(sinhvien sv)//Lamda
        {
            sinhvien usv = db.sinhvien.FirstOrDefault(c => c.sv_id == sv.sv_id);

            usv.TenSV = sv.TenSV;
            usv.ma_lop = sv.ma_lop;

            db.SaveChanges();
            ViewBag.StatusMessage = "Lưu thành công";

            return RedirectToAction("Index");
        }
        public void SetViewBag(int? selectedid=null)
        {

            ViewBag.ma_lop = new SelectList(db.lop.ToList(), "lop_id", "TenLop", selectedid);
        }

        
        public ActionResult Search(string TenSV)
        {
            if (TenSV != null && TenSV != "")

                lstsv = db.sinhvien.Where(p => p.TenSV.Contains(TenSV)).ToList();
            else
                lstsv= db.sinhvien.ToList();


            return Json(lstsv, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Delete(int id)
        {
            sinhvien cate = db.sinhvien.FirstOrDefault(c => c.sv_id == id);
            db.sinhvien.Remove(cate);
            db.SaveChanges();

            return RedirectToAction("Index");

        }
    }
}