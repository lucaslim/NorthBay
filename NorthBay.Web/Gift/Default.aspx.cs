using System;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Gift;
using NorthBay.Utility;

namespace NorthBay.Web.Gift
{
    public partial class Default : Basepage
    {
        readonly ProductClass _objProduct = new ProductClass();
        readonly ShoppingCart _shoppingCart = new ShoppingCart();

        private Cart ShoppingCart
        {
            get
            {
                if (Session["Cart"] == null)
                    Session["Cart"] = new Cart();

                //Add to object
                _shoppingCart.Cart = (Cart) Session["Cart"];

                return _shoppingCart.Cart;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //SetData();

            if (Page.IsPostBack)
                return;

            GridView_DataBind();

            //Set Shopping Cart
            SetShoppingCart();
        }

        private void SetShoppingCart()
        {
            if(ShoppingCart.Count <= 0)
            {
                lit_output.Text = "There are currently no items in your shopping cart";
                div_subtotal.Visible = false;
                div_tax.Visible = false;
                div_total.Visible = false;
                btn_clear.Visible = false;
                btn_view.Visible = false;

                return;
            }

            var output = string.Empty;

            foreach (var item in ShoppingCart)
            {
                output += "<div class=\"input_label bold\">" + item.Title + "</div>";
                output += "<b>Price: </b>" + item.Price + "<br />";
                output += "<b>Quantity: </b>" + item.Quantity + "<br /><br />";
                output += "<hr class=\"line_long\" />";
            }

            lit_subtotal.Text = _shoppingCart.GetStringTotalPrice();
            lit_tax.Text = _shoppingCart.GetStringTax();
            lit_total.Text = _shoppingCart.GetStringTotalPriceWithTax();

            div_subtotal.Visible = true;
            div_tax.Visible = true;
            div_total.Visible = true;
            btn_clear.Visible = true;
            btn_view.Visible = true;

            lit_output.Text = output;
        }

        private void GridView_DataBind()
        {
            gridView.DataSource = _objProduct.SelectAll();
            gridView.DataBind();
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var commandName = e.CommandName;

            //If no command Name found
            if (string.IsNullOrEmpty(commandName))
                return;

            switch (commandName.ToLower())
            {
                //Add to Cart
                case "add":

                    //Check if is a button
                    if (!(e.CommandSource is Button))
                        return;

                    var button = e.CommandSource as Button;

                    //Check if is DataControlFieldCell
                    if (!(button.Parent is DataControlFieldCell))
                        return;

                    var cell = button.Parent as DataControlFieldCell;

                    //Declare variables;
                    string title = string.Empty;
                    string image = string.Empty;
                    decimal price = 0;

                    //Get Id from GridViewRow
                    object control = cell.FindControl("hf_Id");

                    //If id not found, no point adding to the cart
                    if (!(control is HiddenField))
                        return;

                    object objId = TextHelper.ToInteger(((HiddenField)control).Value);

                    //If id not found, no point adding to cart
                    if (objId == null)
                        return;

                    //Set id
                    var id = (int)objId;

                    var isExist = false;

                    //Check if current item exist in the array
                    foreach (var item in ShoppingCart.Where(item => item.ProductId == id))
                    {
                        //If item exist, add quantity
                        item.Quantity += 1;
                        isExist = true;
                        break;
                    }

                    //If item does not exist, add to cart as new
                    if (!isExist)
                    {
                        //Get Title
                        control = cell.FindControl("lbl_title");
                        if (control is Label)
                        {
                            title = ((Label)control).Text;
                        }

                        //Get Price
                        control = cell.FindControl("lbl_price");
                        if (control is Label)
                        {
                            object objPrice = TextHelper.ToDecimal(((Label)control).Text);

                            if (objPrice != null)
                                price = (decimal)objPrice;
                        }

                        //Get Image
                        control = cell.FindControl("img_product");
                        if(control is Image)
                        {
                            image = ((Image)control).ImageUrl;
                        }


                        var product = new CartProduct
                                           {
                                               ProductId = id,
                                               Title = title,
                                               Price = price,
                                               Image = image,
                                               Quantity = 1
                                           };

                        ShoppingCart.Add(product);
                    }

                    SetShoppingCart();

                    break;
            }
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

            const int maximumHeight = 200;

            newHeight = image.Height;
            newWidth = image.Width;

            if (maximumHeight >= newHeight)
                return;

            var ratio = newHeight / maximumHeight;
            newHeight = maximumHeight;
            newWidth = newWidth / ratio;
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;

            GridView_DataBind();
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            var button = sender as Button;

            if (button == null)
                return;

            Session["Cart"]  = null;

            Redirect("~/Gift/");
        }
    }
}