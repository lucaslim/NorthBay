using System;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
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
                        control = cell.FindControl("img_item");
                        if(control is HtmlImage)
                        {
                            image = ((HtmlImage)control).Src;
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

                    string output = string.Empty;

                    foreach (var item in ShoppingCart)
                    {
                        output += "Title: " + item.Title + "<br />";
                        output += "Price: " + item.Price + "<br />";
                        output += "Quantity: " + item.Quantity  + "<br /><br />";
                    }

                    output += "Sub-Total: " + _shoppingCart.GetStringTotalPrice() + "<br />";
                    output += "Tax: " + _shoppingCart.GetStringTax() + "<br />";
                    output += "Total: " + _shoppingCart.GetStringTotalPriceWithTax() + "<br />";

                    lit_output.Text = output;

                    break;
            }
        }
    }
}