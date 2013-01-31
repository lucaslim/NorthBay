using System;
using NorthBay.Framework.Database;
using NorthBay.Logic.Volunteer;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Volunteer
{
    public partial class Add : Basepage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load javascript just for this page
            JScript.AddScript("");


            //Load css just for this page
            Css.AddCss("");

            //Check if page postback
            if (Page.IsPostBack)
                return;
        }

        /// <summary>
        /// Button Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonClick(object sender, EventArgs e)
        {
            //create volunteering model and assign values to it
            var volunteering = new Volunteering
                                   {
                                       Title = txt_title.Text,
                                       Category = ddl_category.SelectedValue,
                                       Description = txt_description.Text,
                                       PostDate = (DateTime)TextHelper.ToDateTime(txt_postdate.Text),
                                       EndDate = (DateTime)TextHelper.ToDateTime(txt_enddate.Text),
                                       Active = (bool)TextHelper.ToBool(ddl_active.SelectedValue)
                                   };

            //Create new Volunteering Object
            var objVolunteer = new VolunteeringClass();

            if (!objVolunteer.Insert(volunteering))
            {
                //show error message
            }
            else
            {
                Redirect("View.aspx");
            }
        }
    }
}