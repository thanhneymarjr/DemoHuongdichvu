using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcDangNhap.Areas.admin.Controllers
{
    public class CategoryController : BaseController
    {
        // GET: admin/Category
        public ActionResult Index()
        {
          
                return View();
            
        }
    }
}