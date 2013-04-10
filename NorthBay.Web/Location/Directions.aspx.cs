using System;

namespace NorthBay.Web.Location
{
    public partial class Location_Directions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Creating an ifarm for google directions and passing 'to adddress' query string from Location/Default.aspx
            lit_maptolocations.Text = "<iframe frameborder='0' scrolling='no' width='95%'  height='750px' src='MapToLocations.aspx?toAddress=" + Request.QueryString["toAddress"] + "'> </iframe>";

        }
    }
}