using System;
using NorthBay.Logic.User;
using NorthBay.Utility;

namespace NorthBay.Web.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonClick(object sender, EventArgs e)
        {
            UserClass objUser = new UserClass();

            if(objUser.Logout())
                PageHelper.Redirect("~/");
        }
    }
}