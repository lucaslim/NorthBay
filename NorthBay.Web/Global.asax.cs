using System;
using System.Globalization;
using System.Threading;
using System.Web;
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

        protected void Application_Error(object sender, EventArgs e)
        {
            //Server.Transfer("~/Error.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }
    }
}