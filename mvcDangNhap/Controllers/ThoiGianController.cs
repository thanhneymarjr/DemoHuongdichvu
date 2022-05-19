using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcDangNhap.Controllers
{
    public class ThoiGianController : Controller
    {
        // GET: ThoiGian
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DatThoiGian()
        {
            string text = DateTime.Now.ToString();
            return Content(text);
        }
    }
}