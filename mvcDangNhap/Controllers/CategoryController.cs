using mvcDangNhap.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvcDangNhap.common;

namespace mvcDangNhap.Controllers
{
 //   [MyAuthorizeAttribute(GroupName = "ADMIN")]
    public class CategoryController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();

        List<Category> lstCategory = new List<Category>();
        // GET: Category
        public ActionResult Index(string txtsearch="")
        {
           
                    if (txtsearch != null || txtsearch != "")

                        lstCategory = db.Category.Where(p => p.Name.Contains(txtsearch)).ToList();
                    else
                        lstCategory = db.Category.ToList();

                    return View(lstCategory);

               
          


           
        }

       
       
        public ActionResult Create()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Create(Category cate)
        {
            if (ModelState.IsValid)
            {

                db.Category.Add(cate);
                db.SaveChanges();
                ViewBag.StatusMessage = "Lưu thành công";
                return RedirectToAction("Index");
            }
           
            return View();
           
        }


        [ChildActionOnly]
        public ActionResult vidu()
        {



            return PartialView("viduPartial", db.Category.ToList());

        }


        public ActionResult Delete(int id)
        {
            Category cate = db.Category.FirstOrDefault(c => c.ID == id);
            db.Category.Remove(cate);
            db.SaveChanges();

            return RedirectToAction("Index");

        }


        public ActionResult Edit(int id)
        {
            Category cate = db.Category.FirstOrDefault(c => c.ID == id);

            return View(cate);
        }
        [HttpPost]
        public ActionResult Edit(Category cate)
        {
            Category ucate = db.Category.FirstOrDefault(c => c.ID == cate.ID);
            
                    ucate.Name = cate.Name;
                    db.SaveChanges();
                    ViewBag.StatusMessage = "Lưu thành công";
                      
            return RedirectToAction("Index");
        }



    }
}