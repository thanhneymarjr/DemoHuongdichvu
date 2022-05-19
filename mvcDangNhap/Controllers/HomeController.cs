using mvcDangNhap.common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using mvcDangNhap.Models;
using PagedList;

namespace mvcDangNhap.Controllers
{
  ///  [MyAuthorizeAttribute(GroupName = "ADMIN")]
    public class HomeController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();
       
        public ActionResult Index(int? page)
        {
           // List<products> dsproducts = db.products.ToList();
           // ViewBag.dsProducts = dsproducts;

            // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo id mới có thể phân trang.
            var dsproducts = (from l in db.product
                              select l).OrderBy(x => x.id);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            int pageSize = 3;

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(dsproducts.ToPagedList(pageNumber, pageSize));


            
        }


  //      [MyAuthorizeAttribute(GroupName = "ADMIN")]  //Gọi đến lớp MyAuthorizeAttribute
        public ActionResult About()
        {
          
            ViewBag.Message = "Your application description page.";

            return View();


        }
       //[MyAuthorizeAttribute(GroupName = "ADMIN")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            //if (Session["USER_SESSION"] != null)
            //{
            //    var userSession = new UserLogin();
            //    userSession = (UserLogin)Session["USER_SESSION"];

            //}
            return View();
        }

       
    }
}