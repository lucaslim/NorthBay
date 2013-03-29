using System;
using System.Linq;
using System.Transactions;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Gift;
using NorthBay.Utility;
using NorthBay.Utility.Configuration;

namespace NorthBay.Web.Admin.Gift
{
    public partial class Add : Basepage
    {
        private readonly ProductClass _objProduct = new ProductClass();
        private readonly ProductCategoryClass _objProductCategory = new ProductCategoryClass();
        private readonly ProductCategoryTableClass _objProductCategoryTable = new ProductCategoryTableClass();

        private int Id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if page postback
            if (Page.IsPostBack)
                return;

            //Set drop down list data
            SetProductCateogryData();
        }

        private void SetProductCateogryData()
        {
            cbl_category.DataSource = _objProductCategory.SelectAll();
            cbl_category.DataTextField = "Name";
            cbl_category.DataValueField = "ProductCategoryId";
            cbl_category.DataBind();

            SetProductCategorySelection();

        }

        private void SetProductCategorySelection()
        {
            if (cbl_category.Items.Count == 0)
                return;

            var list = _objProductCategoryTable.SelectByProductId(Id);

            foreach (var item in from ListItem item in cbl_category.Items
                                 let value = TextHelper.ToInteger(item.Value)
                                 where value != null
                                 where list.Any(x => x.ProductCategoryId == value)
                                 select item)
            {
                item.Selected = true;
            }
        }

        private string UploadFile()
        {
            //If no file return empty
            if (string.IsNullOrEmpty(fu_productImage.FileName))
                return string.Empty;

            //Set file name and directory that is set in config
            var filename = string.Format("{0}{1}{2}", Config.PRODUCT_IMAGE_PATH, Id, System.IO.Path.GetExtension(fu_productImage.FileName));

            //Create Directory
            FileHelper.CreateDirectory(filename);

            //Save image
            fu_productImage.SaveAs(Server.MapPath(filename));

            //Check if file is saved in server
            return fu_productImage.PostedFile != null ? filename : string.Empty;
        }

        /// <summary>
        /// Button Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonClick(object sender, EventArgs e)
        {

            using (var ts = new TransactionScope())
            {
                var product = new Product
                {
                    Title = txt_title.Text,
                    Description = txt_description.Text,
                    Price = (decimal)TextHelper.ToDecimal(txt_price.Text),
                    Image = "",
                };

                //Update
                int id;
                if (!_objProduct.Insert(product, out id))
                    return;

                Id = id;

                foreach (var productCategoryTable in from ListItem item
                                                         in cbl_category.Items
                                                     where item.Selected
                                                     select new ProductCategoryTable
                                                     {
                                                         ProductId = Id,
                                                         ProductCategoryId = (int)TextHelper.ToInteger(item.Value)
                                                     })
                {
                    _objProductCategoryTable.Insert(productCategoryTable);
                }

                //Add image
                var fileUrl = UploadFile();

                //if upload file success
                if (!string.IsNullOrEmpty(fileUrl))
                    product.Image = fileUrl;

                if (!_objProduct.Update(product))
                    return;


                ts.Complete();

                Redirect("~/Admin/Gift/");
            }
        }
    }
}