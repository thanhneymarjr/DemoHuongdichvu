using mvcDangNhap.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcDangNhap.Controllers
{
   
   
    public class lopController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();
        // GET: lop
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
           
            return View();

        }

        [HttpPost]
        public ActionResult Create(lop l)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    db.lop.Add(l);
                    db.SaveChanges();
                    ViewBag.StatusMessage = "Lưu thành công";
                }
            }
            catch (Exception ex)
            {
                ViewBag.StatusMessage = ex.InnerException.InnerException.Message;
                ViewBag.StatusMessage= ViewBag.StatusMessage.Split('\r')[0];
                
            }
            
            return RedirectToAction("Index");

        }

       
    }
}