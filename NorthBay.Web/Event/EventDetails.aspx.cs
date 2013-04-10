using System;
using NorthBay.Logic.Event;

namespace NorthBay.Web.Event
{
    public partial class Event_EventDetails : System.Web.UI.Page
    {
        //creating an instance of the LINQ class
        EventClass objEvent = new EventClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Get event id from query string.....
                int _id = int.Parse(Request.QueryString["id"]);

                _subEventBind(_id);

            }
        }

        private void _subEventBind(int _id)
        {
            dtv_Details.DataSource = objEvent.getEventByID(_id);
            dtv_Details.DataBind();

        }

    }
}