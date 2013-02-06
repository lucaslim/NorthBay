using System;
using System.Web;
using System.Web.Security;
using NorthBay.Framework.Database;
using NorthBay.Utility;

namespace NorthBay.Framework.Authentication
{
    public static class UserCookie
    {
        private const string CookieName = "CookieJar";

        public static bool Create(User model)
        {
            //Create Cookie
            var cookie = new HttpCookie(CookieName);

            //Assign Cookie
            cookie["id"] = TextHelper.ToString(model.UserId);
            cookie["name"] = model.Name;
            cookie["roleId"] = TextHelper.ToString(model.RoleId);
            cookie.Expires = DateTime.Now.AddDays(30);

            //Add Cookie
            HttpContext.Current.Response.Cookies.Add(cookie);

            return IsCookieExist();
        }

        private static bool IsCookieExist()
        {
            return HttpContext.Current.Response.Cookies[CookieName] != null;
        }

        public static bool Remove()
        {
            HttpCookie cookie = HttpContext.Current.Response.Cookies[CookieName];

            //Set expiry to negative
            if (cookie != null)
                cookie.Expires = DateTime.Now.AddYears(-30);

            HttpContext.Current.Response.Cookies.Remove(CookieName);

            //Remove FormsAuthentication
            FormsAuthentication.SignOut();

            return HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null;
        }
    }
}
