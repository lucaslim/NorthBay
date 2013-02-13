using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Security;
using NorthBay.Logic.User;
using NorthBay.Utility.Configuration;

namespace NorthBay.Web
{
    public class Global : HttpApplication
    {
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var cultureInfo = (CultureInfo) Thread.CurrentThread.CurrentCulture.Clone();

            //Set global date format
            cultureInfo.DateTimeFormat.ShortDatePattern = WebConfigApplicationSettings.DateFormat;
            cultureInfo.DateTimeFormat.DateSeparator = "/";

            //Set global time format
            cultureInfo.DateTimeFormat.ShortTimePattern = WebConfigApplicationSettings.TimeFormat;
            cultureInfo.DateTimeFormat.TimeSeparator = ":";

            Thread.CurrentThread.CurrentCulture = cultureInfo;
        }

        /// <summary>
        /// Checks for user role and to restrict access to folders
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FormsAuthentication_OnAuthenticate(Object sender, FormsAuthenticationEventArgs e)
        {
            UserClass userClass = new UserClass();

            userClass.CheckAuthentication(e);
        }


        protected void Application_Error(object sender, EventArgs e)
        {
            //Server.Transfer("~/Error.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }
    }
}   