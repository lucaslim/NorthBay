using System;
using NorthBay.Logic.Career;

namespace NorthBay.Web.Career
{
    public partial class Career_Details : System.Web.UI.Page
    {
        //creating an instance of the LINQ class
        CareerClass objCareer = new CareerClass();
  
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {  
                // Get career id from query string.....
                int _id = int.Parse(Request.QueryString["Careerid"]);

                _subCareerBind(_id);
           
            }
        }

        private void _subCareerBind(int _id)
        {
            dtv_Details.DataSource = objCareer.getCareersByID(_id);
            dtv_Details.DataBind();

        }

        //Display application form
        protected void btnApply_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Career/Application.aspx?Careerid=" + Request.QueryString["Careerid"]);
        }


   
    }
}