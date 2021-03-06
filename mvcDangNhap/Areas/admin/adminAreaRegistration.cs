using System.Web.Mvc;

namespace mvcDangNhap.Areas.admin
{
    public class adminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "admin_default",
                "admin/{controller}/{action}/{id}",
                new { action = "Index", controller = "Home", id = UrlParameter.Optional },
           
               namespaces: new[] { "mvcDangNhap.Areas.Admin.Controllers" }

            );
        }
    }
}