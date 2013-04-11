using System;
using NorthBay.Logic.Room;

namespace NorthBay.Web.Room
{
    public partial class Default : Basepage
    {
        private readonly RoomClass _objRoom = new RoomClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                return;

            //Get Average Room Price
            lit_average.Text = string.Format("${0}", _objRoom.GetAverageRoomPrice());

            rpt_rooms.DataSource = _objRoom.SelectRoomsByBuilding();
            rpt_rooms.DataBind();   
        }
    }
}