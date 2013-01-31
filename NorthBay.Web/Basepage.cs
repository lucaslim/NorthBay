﻿using System;
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

        protected static string FormatDate(object date)
        {
            return TextHelper.FormatDate(date);
        }

        internal static bool IsValidButtonCommandName(object sender, out string commandName)
        {
            commandName = string.Empty;

            //Check if sender is button
            if (!(sender is Button))
                return false;

            //Get button control
            var button = sender as Button;

            //Set command name
            commandName = button.CommandName;

            //check if command name is empty
            return !string.IsNullOrEmpty(commandName);
        }

        internal static void Redirect(string url)
        {
            HttpContext.Current.Response.Redirect(url);
        }
    }
}