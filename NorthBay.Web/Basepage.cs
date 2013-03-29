using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Utility;

namespace NorthBay.Web
{
    public class Basepage : Page
    {
        internal CssHelper Css;
        internal JScriptHelper JScript;

        protected int LoggedInUserId
        {
            get
            {
                if (IsAuthenticated())
                {
                    var id = TextHelper.ToInteger(User.Identity.Name);

                    if (id != null)
                        return (int) id;
                }
                return 0;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            // Load Javascript
            JScript = new JScriptHelper(this);
            JScript.AddScript("jquery.js");

            // Load CSS
            Css = new CssHelper(this);
            //Css.AddCss("styles.css");

            base.OnLoad(e);

            //Load JS Script           
            if (!JScript.LoadScript())
                throw new HttpUnhandledException("Unable to load js scripts.");

            //Load Css
            if (!Css.LoadCss())
                throw new HttpUnhandledException("Unable to load css stylesheets.");
        }
        
        /// <summary>
        /// Check if user is logged in
        /// </summary>
        /// <returns></returns>
        protected bool IsAuthenticated()
        {
            return User.Identity.IsAuthenticated;
        }

        /// <summary>
        /// Format Date based on the standard format
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        protected static string FormatDate(object date)
        {
            return TextHelper.FormatDate(date);
        }

        /// <summary>
        /// Redirect Page
        /// </summary>
        /// <param name="url"></param>
        internal static void Redirect(string url)
        {
            HttpContext.Current.Response.Redirect(url);
        }
    }
}