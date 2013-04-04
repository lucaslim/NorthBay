using System;
using NorthBay.Framework.Database;
using NorthBay.Logic.Room;
using NorthBay.Logic.Volunteer;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Volunteer
{
    public partial class Edit : Basepage
    {
        private readonly VolunteerClass _objVolunteer = new VolunteerClass();
        private readonly RoomBillingClass _objRoomBilling = new RoomBillingClass();

        private int Id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if id is return
            if (!CheckId())
                Redirect("~/Admin/Volunteer/");

            //Load javascript just for this page
            JScript.AddScript("");

            //Load css just for this page
            Css.AddCss("");

            //Check if page postback
            if (Page.IsPostBack)
                return;

            //Set drop down list data
            SetVolunteerCateogryData();

            //Fill controls with data
            SetVolunteerData();
        }

        

        private void SetVolunteerData()
        {
            var volunteer = _objVolunteer.Select(Id);

            if (volunteer == null)
                return;

            txt_title.Text = volunteer.Title;
            txt_description.Text = volunteer.Description;
            ddl_category.SelectedValue = TextHelper.ToString(volunteer.VolunteerCategoryId);
            txt_postdate.Text = TextHelper.FormatDate(volunteer.PostDate);
            txt_enddate.Text = TextHelper.FormatDate(volunteer.EndDate);
            ddl_active.SelectedValue = volunteer.Active ? "True" : "False";
        }

        /// <summary>
        /// Check query string for valid Id
        /// </summary>
        /// <returns></returns>
        private bool CheckId()
        {
            var strId = QueryHelper.GetQueryString("id");

            //if id is null
            if (string.IsNullOrEmpty(strId))
                return false;

            var id = TextHelper.ToInteger(strId);

            //If unable to convert string Id to integer
            if (id == null)
                return false;

            //Set id to property
            Id = (int)id;

            return true;
        }


        private void SetVolunteerCateogryData()
        {
            var objVolunteerCategory = new VolunteerCategoryClass();

            ddl_category.DataSource = objVolunteerCategory.SelectAll();
            ddl_category.DataTextField = "Name";
            ddl_category.DataValueField = "VolunteerCategoryId";
            ddl_category.DataBind();

        }

        /// <summary>
        /// Button Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonClick(object sender, EventArgs e)
        {
            //create volunteering model and assign values to it
            var volunteer = new Framework.Database.Volunteer
            {
                VolunteerId = Id,
                Title = txt_title.Text,
                VolunteerCategoryId = TextHelper.ToInteger(ddl_category.SelectedValue) ?? 1,
                Description = txt_description.Text,
                PostDate = TextHelper.ToDateTime(txt_postdate.Text) ?? DateTime.Now,
                EndDate = TextHelper.ToDateTime(txt_enddate.Text),
                Active = TextHelper.ToBool(ddl_active.SelectedValue) ?? false
            };

            if (!_objVolunteer.Update(volunteer))
            {
                //show error message
            }
            else
            {
                Redirect("~/Admin/Volunteer/");
            }
        }
    }
}