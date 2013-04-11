using System;
using NorthBay.Logic.Publication;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Publication
{
    public partial class EditPublication : Basepage
    {
        private readonly PublicationClass objPublication = new PublicationClass();
        private int Id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!CheckId())
                Redirect("~/Admin/Publication/");
            JScript.AddScript("");
            Css.AddCss("");

            if (Page.IsPostBack)
                return;
            SetPublicationCategoryData();
            SetPublicationData();
        }
        private void SetPublicationData()
        {
            var publication = objPublication.Select(Id);
            if (publication == null)
                return;
            txt_title.Text = publication.Title;
            txt_author.Text = publication.Author;
            txt_description.Text = publication.Description;
            ddl_category.SelectedValue = TextHelper.ToString(publication.CategoryId);
            txt_pubdate.Text = TextHelper.FormatDate(publication.PublicationDate);
            ddl_active.SelectedValue = publication.Active ? "True" : "False";

        }
        private bool CheckId()
        {
            var strId = QueryHelper.GetQueryString("id");
            if (string.IsNullOrEmpty(strId))
                return false;
            var id = TextHelper.ToInteger(strId);
            if (id == null)
                return false;
            Id = (int)id;
            return true;
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
                PublicationId = Id,
                Title = txt_title.Text,
                Author = txt_author.Text,
                Active = TextHelper.ToBool(ddl_active.SelectedValue) ?? true,
                CategoryId = TextHelper.ToInteger(ddl_category.SelectedValue) ?? 1,
                Description = txt_description.Text,
                PublicationDate = TextHelper.ToDateTime(txt_pubdate.Text) ?? DateTime.Now
            };

            if (!objPublication.Update(publication))
            { }
            else
            {
                Redirect("~/Admin/Publication/");
            }
        }
    }
}