using System;
using System.Linq;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Gift;
using NorthBay.Utility;

namespace NorthBay.Web.Gift
{
    public partial class View : Basepage
    {
        readonly ShoppingCart _objShoppingCart = new ShoppingCart();

        private Cart ShoppingCart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Load Shopping Cart
            ShoppingCart = LoadShoppingCartObject();

            //Page postback
            if (Page.IsPostBack)
                return;

            //Databind
            GvCart_DataBind();
        }

        private Cart LoadShoppingCartObject()
        {
            if (_objShoppingCart.Cart == null)
            {
                if (Session["Cart"] == null)
                    return null;

                //Add to object
                _objShoppingCart.Cart = (Cart)Session["Cart"];
            }

            return _objShoppingCart.Cart;
        }

        private void SaveShoppingCartObject()
        {
            Session["Cart"] = _objShoppingCart.Cart;
        }

        private void GvCart_DataBind()
        {
            gv_cart.DataSource = ShoppingCart;
            gv_cart.DataBind();
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            //if is button
            if (!(sender is Button))
                return;

            var button = sender as Button;

            //Get command name
            var commandName = button.CommandName;

            //if command name is empty
            if (string.IsNullOrEmpty(commandName))
                return;

            int? productId;

            switch (commandName.ToLower())
            {
                case "update":
                    productId = TextHelper.ToInteger(button.CommandArgument);

                    //if id not found
                    if (productId == null)
                        return;

                    //Get Quantity
                    var control = button.Parent.FindControl("txt_quantity");

                    //if is not textbox
                    if (!(control is TextBox))
                        return;

                    var quantity = TextHelper.ToInteger(((TextBox)control).Text);

                    //If quantity is not valid
                    if (quantity == null)
                        return;

                    if (_objShoppingCart.UpdateProductById((int)productId, (int)quantity))
                    {
                        SaveShoppingCartObject();
                        GvCart_DataBind();
                    }

                    break;
            }
        }

        protected void GvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                var tableCells = e.Row.Cells;

                //Merge rows
                tableCells[0].ColumnSpan = 2;
                tableCells[2].ColumnSpan = 2;
                for (int x = 1; x <= tableCells.Count; x++)
                {
                    var cell = tableCells[x];

                    //Remove cell
                    tableCells.Remove(cell);
                }

                var lblSubTotal = e.Row.FindControl("lbl_subtotal") as Label;

                //Set sub total price
                if (lblSubTotal != null)
                    lblSubTotal.Text = _objShoppingCart.GetStringTotalPrice();

                var lblTax = e.Row.FindControl("lbl_tax") as Label;

                //Set sub total price
                if (lblTax != null)
                    lblTax.Text = _objShoppingCart.GetStringTax();

                var lblTotal = e.Row.FindControl("lbl_total") as Label;

                //Set sub total price
                if (lblTotal != null)
                    lblTotal.Text = _objShoppingCart.GetStringTotalPriceWithTax();
            }
        }

        protected void GvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var productId = TextHelper.ToInteger(e.NewValues["ProductId"]);
            var quantity = TextHelper.ToInteger(e.NewValues["Quantity"]);
            if (productId != null && quantity != null)
            {
                _objShoppingCart.UpdateProductById((int)productId, (int)quantity);

                GvCart_DataBind();
            }
        }

        protected void test(object sender, GridViewRowEventArgs e)
        {


        }
    }
}