using mvcDangNhap.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

//01/04/2020 Code Thêm/Xóa/Sửa OK

namespace mvcDangNhap.Controllers
{
    public class UserController : Controller
    {
        HocAspMVCEntities db = new HocAspMVCEntities();
        List<User> lst_user = new List<User>();       // GET: User
     

        // GET: Category
        public ActionResult Index()
        {
            
            lst_user = db.User.ToList();

            if (ViewBag.GroupID == null) SetViewBag();

            return View(lst_user);
        }
        public void SetViewBag()
        {
         
            ViewBag.GroupID = new SelectList(db.UserGroup.ToList(), "ID", "Name");
        }
        public ActionResult Search(string Name)
        {
            if (Name != null && Name != "")

                lst_user = db.User.Where(p => p.Name.Contains(Name)).ToList();
            else
                lst_user = db.User.ToList();
            
            return Json(lst_user, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Add(User u)
        {
           
            try
            {
                if (u.Photo == null || u.Photo=="")
                    u.Photo = @"noimg.jpg";


                db.User.Add(u);

                db.SaveChanges();

               
            }
            catch
            {

               

            }
           
            return Json(u, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(User u)
        {
            User uupdate = db.User.FirstOrDefault(c => c.ID == u.ID);

            uupdate.Name = u.Name;
            uupdate.UserName = u.UserName;
            uupdate.Password = u.Password;
            uupdate.Photo = u.Photo;
            uupdate.GroupID = u.GroupID;
            if (uupdate.Photo == null || uupdate.Photo == "")
                uupdate.Photo = @"noimg.jpg";

            db.SaveChanges();

            

            return Json(new { ErrMsg = "Lưu thành công" }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Delete(int id)
        {
            User u= db.User.FirstOrDefault(c => c.ID == id);
            db.User.Remove(u);
            db.SaveChanges();

            return Json(new { ErrMsg = "Xóa thành công" }, JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetbyID(int ID)
        {
            var User = db.User.ToList().Find(x => x.ID.Equals(ID));
           
            return Json(User, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult UploadImage(string  id)
        {
            //Kiểm tra file upload có tồn tại không
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var image = Request.Files["HelpSectionImages"];
                // xử lý của bạn
             
                string _FileName = "";
                int index = image.FileName.IndexOf('.');
                _FileName = id + "." + image.FileName.Substring(index + 1);
                string _path = Path.Combine(Server.MapPath("~/Upload/Images/Users"), _FileName);
                image.SaveAs(_path);
                // Bạn có thể trả về 1 json đường dẫn ảnh
                return Json(new { FileName = _FileName}, JsonRequestBehavior.AllowGet);
            }
            return Json("Upload lỗi", JsonRequestBehavior.AllowGet);
        }

    }
}