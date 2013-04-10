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

        /// <summary>
        /// Using viewstate to store the sort direction
        /// </summary>
        private SortDirection SortDirection
        {
            get
            {
                if (ViewState["SortDirection"] == null)
                    ViewState["SortDirection"] = SortDirection.Ascending;

                return (SortDirection)ViewState["SortDirection"];
            }
            set { ViewState["SortDirection"] = value; }
        }

        /// <summary>
        /// Using Viewstate to store the sort expression
        /// </summary>
        private string SortExpression
        {
            get
            {
                return ViewState["SortExpression"] as string ?? "Building";
            }
            set { ViewState["SortExpression"] = value; }
        }

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
            gridView.DataSource = _objRoom.SortAll(SortExpression, SortDirection);
            gridView.DataBind();
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (string.IsNullOrEmpty(SortExpression))
                SortExpression = e.SortExpression;
            else
            {
                //If sorting the same column
                if (SortExpression == e.SortExpression)
                {
                    //Set Sort Direction
                    SortDirection = SortDirection == SortDirection.Ascending
                                        ? SortDirection.Descending
                                        : SortDirection.Ascending;
                }
                else
                {
                    SortExpression = e.SortExpression;
                    SortDirection = e.SortDirection;
                }
            }

            //Calling Sort All Function
            GridView_DataBind();
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;

            GridView_DataBind();
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