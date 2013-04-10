using System;
using System.Web.UI.WebControls;
using NorthBay.Logic.Career;

namespace NorthBay.Web.Career
{
    public partial class Career_Default : System.Web.UI.Page
    {
        //creating an instance of the LINQ class
        CareerClass objCareer = new CareerClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subCareersBind();
            }
        }

        private void _subCareersBind()
        {
            ddl_category.DataSource = objCareer.getCareerCategories();
            ddl_category.DataBind();

            gv_career.DataSource = objCareer.getCareers();
            gv_career.DataBind();
       
        }

        protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_category.SelectedIndex != 0)
            {
                gv_career.DataSource = objCareer.getCareersByCategory(ddl_category.SelectedItem.Text);
                gv_career.DataBind();
            }

            else
            {
                gv_career.DataSource = objCareer.getCareers();
                gv_career.DataBind();
            }
        }

 
        protected void gv_career_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_career.DataSource = objCareer.getCareers();
            gv_career.DataBind();
            gv_career.PageIndex = e.NewPageIndex;
            gv_career.DataBind();
        }

        //protected void gv_career_Sorting(object sender, GridViewSortEventArgs e)
        //{
      
        //    if (gv_career.Rows.Count > 0)
        //    {
        //        gv_career.Sort(e.SortExpression, e.SortDirection);
            
        //        gv_career.DataSource = objCareer.getCareers();
        //        gv_career.DataBind();
        //    }
        //}

        //private string GetSortDirection(string column)
        //{

        //    // By default, set the sort direction to ascending.
        //    string sortDirection = "ASC";

        //    // Retrieve the last column that was sorted.
        //    string sortExpression = ViewState["SortExpression"] as string;

        //    if (sortExpression != null)
        //    {
        //        // Check if the same column is being sorted.
        //        // Otherwise, the default value can be returned.
        //        if (sortExpression == column)
        //        {
        //            string lastDirection = ViewState["SortDirection"] as string;
        //            if ((lastDirection != null) && (lastDirection == "ASC"))
        //            {
        //                sortDirection = "DESC";
        //            }
        //        }
        //    }

        //    // Save new values in ViewState.
        //    ViewState["SortDirection"] = sortDirection;
        //    ViewState["SortExpression"] = column;

        //    return sortDirection;
        //}


    }
}