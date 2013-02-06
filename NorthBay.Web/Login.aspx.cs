using System;
using NorthBay.Logic.User;

namespace NorthBay.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonClick(object sender, EventArgs e)
        {
            var objUser = new UserClass();

            //Authenticate User
            objUser.AuthenticateUser(txt_user.Text, txt_password.Text);
        }
    }
}