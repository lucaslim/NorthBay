using System;
using NorthBay.Logic.User;

namespace NorthBay.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                return;
        }

        protected void ButtonClick(object sender, EventArgs e)
        {
            var objUser = new UserClass();

            //Username: lucas@nuxbox.me
            //Password: 123
            string redirectUrl;

            //Authenticate User
            if (!objUser.AuthenticateUser(txt_user.Text, txt_password.Text, out redirectUrl))
            {
                lit_error.Text = "<div style=\"font-size:11px; font-style: italic; color: red; padding-bottom:5px;\">The email or password you've entered does not belong to any account.</div>";
            }
        }
    }
}