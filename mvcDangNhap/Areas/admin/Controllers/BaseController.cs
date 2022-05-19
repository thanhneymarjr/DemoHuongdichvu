﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using mvcDangNhap.common;

namespace mvcDangNhap.Areas.admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: admin/Base
           

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
           
            if (Session["USER_SESSION"] == null && Session["SESSION_GROUP"] == null)
                          
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "Login", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}