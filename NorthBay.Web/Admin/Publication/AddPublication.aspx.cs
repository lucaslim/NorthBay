using System;
using NorthBay.Logic.Publication;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Publication
{
    public partial class Add : Basepage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JScript.AddScript("");
            Css.AddCss("");
            if (Page.IsPostBack)
                return;

            SetPublicationCategoryData();
        }

        private void SetPublicationCategoryData()
        {
            var objPublicationCategory = new PublicationCategoryClass();

            ddl_category.DataSource = objPublicationCategory.SelectAll();
            ddl_category.DataTextField = "Name";
            ddl_category.DataValueField = "CategoryId";
            ddl_category.DataBind();

        }


        protected void ButtonClick(object sender, EventArgs e)
        {
            var publication = new Framework.Database.Publication
            {
                Title = txt_title.Text,
                Author = txt_author.Text,
                CategoryId = TextHelper.ToInteger(ddl_category.SelectedValue) ?? 1,
                Description = txt_description.Text,
                PublicationDate = TextHelper.ToDateTime(txt_pubdate.Text) ?? DateTime.Now,
                Active = TextHelper.ToBool(ddl_active.SelectedValue) ?? false
            };

            var objPublication = new PublicationClass();
            
            if (!objPublication.Insert(publication))
            {
            }
            else
            {
                Redirect("~/Admin/Publication/");
            }
        }
    }
}