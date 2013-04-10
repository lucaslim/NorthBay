using System;

namespace NorthBay.Web.Location
{
    public partial class Location_MapToLocations : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            //Receving 'to address' from Location/Directions.aspx.cs
            txtTo.Text = Request.QueryString["toAddress"];
        }
    }
}