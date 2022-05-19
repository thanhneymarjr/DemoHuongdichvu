using mvcDangNhap.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcDangNhap.Controllers
{
    public class GroupController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();
        List<UserGroup> lst = new List<UserGroup>();
        // GET: UserGroup
        public ActionResult Index()
        {

            lst = db.UserGroup.ToList();

            return View(lst);
        }
        public ActionResult Search(string Name)
        {
            if (Name != null || Name != "")

                lst = db.UserGroup.Where(p => p.Name.Contains(Name)).ToList();
            else
                lst = db.UserGroup.ToList();


            return Json(lst, JsonRequestBehavior.AllowGet);
        }


       


    }
}