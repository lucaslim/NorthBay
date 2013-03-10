using System.Web;
using System.Web.Security;
using NorthBay.Framework.Database;
using NorthBay.Utility;

namespace NorthBay.Framework.Authentication
{
    public static class UserSession
    {
        public static bool IsAuthenticated
        {
            get { return HttpContext.Current.User.Identity.IsAuthenticated; }
        }

        public static void Create(User model)
        {
            //Set authorization cookie
            FormsAuthentication.SetAuthCookie(TextHelper.ToString(model.UserId), false);

            var returnUrl = QueryHelper.GetQueryString("ReturnUrl");

            //Create Cookie
            if (!UserCookie.Create(model))
                return;

            var redirectUrl = returnUrl;

            if (string.IsNullOrEmpty(redirectUrl))
            {
                switch (model.UserRoleId)
                {
                        //Administrator
                    case 1:
                        redirectUrl = "~/Admin/";
                        break;

                    default:
                        redirectUrl = "~/";
                        break;
                }
            }

            //Redirect
            PageHelper.Redirect(redirectUrl);
        }

        public static FormsAuthenticationTicket GetTicket()
        {
            //Check if cookie is supported
            if (!FormsAuthentication.CookiesSupported)
                return null;

            //if no form cookies
            var cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (cookie == null)
                return null;

            var formsAuthenticationTicket = FormsAuthentication.Decrypt(cookie.Value);

            //if ticket not found
            return formsAuthenticationTicket;
        }
    }
}
