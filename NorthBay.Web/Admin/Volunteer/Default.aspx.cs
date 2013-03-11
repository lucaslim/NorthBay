using System;
using System.Collections.Specialized;
using System.Web.UI.WebControls;
using NorthBay.Logic.Volunteer;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Volunteer
{
    public partial class Default : Basepage
    {
        private readonly VolunteerClass _objVolunteer = new VolunteerClass();
        private readonly VolunteerCategoryClass _objVolunteerCategory = new VolunteerCategoryClass();

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
            get { return ViewState["SortExpression"] as string ?? string.Empty; }
            set { ViewState["SortExpression"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //If page is postback, stop executing
            if (Page.IsPostBack)
                return;

            GridView_DataBind();
        }

        private void GridView_DataBind()
        {
            gridView.DataSource = _objVolunteer.SelectView();
            gridView.DataBind();
        }

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Get row id
            int? id = GetRowId(e.RowIndex);

            //check if integer is null
            if (id == null)
                return;

            if (!_objVolunteer.Delete((int)id))
                //Show error message
                return;

            //Rebind
            GridView_DataBind();
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var newValues = e.NewValues;

            int? id = TextHelper.ToInteger(GetRowId(e.RowIndex));
            //If no Id found return
            if (id == null)
                return;

            //Set new values to object
            var volunteering = new Framework.Database.Volunteer
            {
                VolunteerId = (int)id,
                VolunteerCategoryId = 0,
                Title = TextHelper.ToString(newValues["title"]),
                Description = TextHelper.ToString(newValues["description"]),
                PostDate = (DateTime)TextHelper.ToDateTime(newValues["post_date"]),
                EndDate = (DateTime)TextHelper.ToDateTime(newValues["end_date"])
            };

            //Update object
            if (!_objVolunteer.Update(volunteering))
                //Show error message
                return;

            //return to normal
            gridView.EditIndex = -1;

            //rebind
            GridView_DataBind();
        }

        protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Set edit index to new edit index
            gridView.EditIndex = e.NewEditIndex;

            //Rebind
            GridView_DataBind();
        }

        protected void GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Set edit index to -1 to cancel
            gridView.EditIndex = -1;

            //Rebind
            GridView_DataBind();
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
            gridView.DataSource = _objVolunteer.SortAll(SortExpression, SortDirection);
            gridView.DataBind();
        }

        private int? GetRowId(int rowIndex)
        {
            DataKey key = gridView.DataKeys[rowIndex];

            //check if key is null
            if (key == null)
                return null;

            IOrderedDictionary keyValues = key.Values;

            //check if key values are null
            if (keyValues == null)
                return null;

            //Convert key value to integer
            return TextHelper.ToInteger(keyValues["volunteering_id"]);
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var pageIndex = e.NewPageIndex;

            gridView.DataSource = _objVolunteer.Paging(pageIndex);
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var objControl = e.Row.FindControl("ddl_category");

                if (objControl is Controls.DropDownList)
                {
                    Controls.DropDownList control = objControl as Controls.DropDownList;
                    control.DataSource = _objVolunteerCategory.SelectAll();
                    control.DataTextField = "Name";
                    control.DataValueField = "VolunteerCategoryId";
                    control.DataBind();
                }
            }
        }
    }
}