﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace mvcDangNhap
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //localhost:xxxx/Login/Index
            routes.MapRoute(
               name: "dang-nhap",
               url: "dang-nhap/{*pathInfo}",
               defaults: new { controller = "Login", action = "Index"},
              namespaces: new[] { "mvcDangNhap.Controllers" }
           );

            routes.MapRoute(
              name: "kiem-tra-dang-nhap",
              url: "kiem-tra-dang-nhap/{*pathInfo}",
              defaults: new { controller = "Login", action = "Login" ,username = UrlParameter.Optional ,password = UrlParameter.Optional,ghinho = UrlParameter.Optional },
              namespaces: new[] { "mvcDangNhap.Controllers" }
          );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "mvcDangNhap.Controllers" }
            );
            

        }
    }
}
