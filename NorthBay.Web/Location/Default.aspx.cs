using System;
using NorthBay.Logic.Location;

namespace NorthBay.Web.Location
{
    public partial class Location_Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //creating an instance of the LINQ class
            LocationClass objLocation = new LocationClass();
            lv_locations.DataSource = objLocation.allLocations();
            lv_locations.DataBind();
        }
    }
}