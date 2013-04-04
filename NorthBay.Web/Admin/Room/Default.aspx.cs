using System;
using System.Web.UI.WebControls;
using NorthBay.Logic.Room;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Room
{
    public partial class Default : Basepage
    {
        private readonly RoomClass _objRoom = new RoomClass();
        private readonly RoomBillingClass _objRoomBilling = new RoomBillingClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Load javascript just for this page
            JScript.AddScript("global.js");

            //If page is postback, stop executing
            if (Page.IsPostBack)
                return;

            GridView_DataBind();
        }

        private void GridView_DataBind()
        {
            gridView.DataSource = _objRoom.SelectAll();
            gridView.DataBind();
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            var button = sender as Button;

            //check if is button
            if (button == null)
                return;

            var commandName = button.CommandName;

            //if no command name is found
            if (string.IsNullOrEmpty(commandName))
                return;

            switch (commandName.ToLower())
            {
                case "assign":
                    {
                        var roomId = TextHelper.ToInteger(button.CommandArgument);
                        //check if room id exist
                        if (roomId == null)
                            return;

                        Response.Redirect(string.Format("Assign.aspx?id={0}", roomId));
                    }
                    break;
            }
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    {
                        using (var hfId = e.Row.FindControl("hf_id") as HiddenField)
                        {
                            //return if control not found
                            if (hfId == null)
                                return;

                            var id = TextHelper.ToInteger(hfId.Value);
                            //return if id is null
                            if (id == null)
                                return;

                            using (var litStatus = e.Row.FindControl("lit_status") as Literal)
                            {
                                //return if control not found
                                if (litStatus == null)
                                    return;

                                litStatus.Text = GetRoomStatusById((int)id);
                            }
                        }
                    }
                    break;
            }
        }

        private string GetRoomStatusById(int id)
        {
            return _objRoomBilling.IsRoomVacant(id) ? "Vacant" : "Occupied";
        }
    }
}