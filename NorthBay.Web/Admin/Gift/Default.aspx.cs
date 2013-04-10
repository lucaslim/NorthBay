using System;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Gift;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Gift
{
    public partial class Default : Basepage
    {
        private readonly ProductClass _objProduct = new ProductClass();

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
                return ViewState["SortExpression"] as string ?? "ProductId";
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
            gridView.DataSource = _objProduct.SortAll(SortExpression, SortDirection);
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
            gridView.DataSource = _objProduct.SortAll(SortExpression, SortDirection);
            gridView.DataBind();
        }


        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;

            GridView_DataBind();
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridView.Rows)
            {
                var objControl = row.FindControl("cb_select");

                if (!(objControl is CheckBox))
                    continue;

                var checkbox = objControl as CheckBox;
                // If checkbox is not check, move on
                if (!checkbox.Checked)
                    continue;

                //look for hidden field
                objControl = row.FindControl("hf_id");

                if (!(objControl is HiddenField))
                    continue;

                var hiddenField = objControl as HiddenField;

                //Get id
                var id = TextHelper.ToInteger(hiddenField.Value) ?? -1;

                if (id == -1) continue;

                //Delete data by Id
                _objProduct.Delete(id);
            }

            //Rebind
            GridView_DataBind();
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var image = e.Row.FindControl("img_product") as Image;

                if (image == null)
                    return;

                var product = e.Row.DataItem as Product;

                if (product == null)
                    return;

                int newWidth;
                int newHeight;
                GetImageSize(MapPath(product.Image), out newWidth, out newHeight);

                image.Height = Unit.Pixel(newHeight);
                image.Width = Unit.Pixel(newWidth);
            }
        }

        private void GetImageSize(string imagePath, out int newWidth, out int newHeight)
        {
            //Set Image Size
            var image = System.Drawing.Image.FromFile(imagePath);

            const int maximumHeight = 100;

            newHeight = image.Height;
            newWidth = image.Width;

            if (maximumHeight >= newHeight)
                return;

            var ratio = newHeight / maximumHeight;
            newHeight = maximumHeight;
            newWidth = newWidth / ratio;
        }

    }
}