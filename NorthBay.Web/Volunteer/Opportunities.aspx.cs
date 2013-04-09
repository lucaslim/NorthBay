using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Volunteer;

namespace NorthBay.Web.Volunteer
{
    public partial class Opportunities : Basepage
    {
        private readonly VolunteerCategoryClass _objVolunteer = new VolunteerCategoryClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                return;

            dl_opportunities.DataSource = _objVolunteer.SelectAll();
            dl_opportunities.DataBind();
        }

        protected void ListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var literal = e.Item.FindControl("lit_volunteer") as Literal;

                if (literal == null)
                    return;

                var dataItem = e.Item.DataItem as VolunteerCategory;

                if (dataItem == null)
                    return;

                StringBuilder sb = new StringBuilder();

                foreach (var volunteer in dataItem.Volunteers)
                {
                    sb.Append("<tr><td>" + volunteer.Title + "</td></tr>");
                }

                literal.Text = sb.ToString();
            }
        }

        protected void DataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var literal = e.Item.FindControl("lit_volunteer") as Literal;

                if (literal == null)
                    return;

                var dataItem = e.Item.DataItem as VolunteerCategory;

                if (dataItem == null)
                    return;

                StringBuilder sb = new StringBuilder();

                foreach (var volunteer in dataItem.Volunteers)
                {
                    sb.Append("<tr><td>" + volunteer.Title + "</td></tr>");
                }

                literal.Text = sb.ToString();
            }
        }
    }
}