using System;
using NorthBay.Logic.Publication;
using NorthBay.Utility;
using System.Web.UI.WebControls;


namespace NorthBay.Web.Publication
{
    
    public partial class Default : Basepage
    {
        private readonly PublicationClass objPublication = new PublicationClass();
        private readonly PublicationClass objTempPublication = new PublicationClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblPublicationDetail.Visible = false;
            if (!Page.IsPostBack)
            {
                gridView.DataSource = objPublication.SelectAll();
                gridView.DataBind();
            }
        }

        
        protected void linkButtonPub_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).CommandArgument.ToString());
            

            lblPublicationTitle.Text = "Title: "+objPublication.Select(id).Title;
            lblPublicationDetail.Visible = true;
            lblPublicationDescription.Text = "Article: " + objTempPublication.Select(id).Description;

        }
   
    }
}