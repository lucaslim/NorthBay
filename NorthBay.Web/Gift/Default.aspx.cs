using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Gift;
using NorthBay.Utility;

namespace NorthBay.Web.Gift
{
    public partial class Default : System.Web.UI.Page
    {
        public List<GiftItem> ShoppingCart
        {
            get
            {
                if (Session["Cart"] == null)
                    Session["Cart"] = new List<GiftItem>();

                return (List<GiftItem>)Session["Cart"];
            }
        }

        List<Product> list = new List<Product>();

        protected void Page_Load(object sender, EventArgs e)
        {
            SetData();

            if (Page.IsPostBack)
                return;

            gridView.DataSource = list;
            gridView.DataBind();

        }

        private void SetData()
        {
            ProductClass productClass = new ProductClass();
            ProductCategoryTableClass productCategoryTableClass = new ProductCategoryTableClass();

            Product item = new Product();
            ProductCategoryTable table = new ProductCategoryTable();

            item.Title = "Apple iPhone 5";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = (decimal)660.99;
            item.Image = @"http://cdn.iphonehacks.com/wp-content/uploads/2012/09/iphone5-front-back.jpg";

            int id;

            productClass.Insert(item, out id);

            table.ProductCategoryId = 1;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);



            item = new Product();

            item.Title = "Acer";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = 698;
            item.Image = @"http://media.bestofmicro.com/comparatif-tout-en-un,V-2-313454-3.jpg";

            productClass.Insert(item, out id);
            table = new ProductCategoryTable();
            table.ProductCategoryId = 1;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);

            item = new Product();

            item.Title = "Apple iPad";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = 300;
            item.Image = @"http://www.jjmehta.com/images/tablet/apple_ipad2_wifi_1.jpg";

            productClass.Insert(item, out id);
            table = new ProductCategoryTable();
            table.ProductCategoryId = 1;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);

            item = new Product();

            item.Title = "Flower #3";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = 500;
            item.Image = @"http://www.marketflowers.com/images/gallery/51_734.jpg";

            productClass.Insert(item, out id);
            table = new ProductCategoryTable();
            table.ProductCategoryId = 2;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);


            item = new Product();

            item.Title = "Flower #2";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = 200;
            item.Image = @"http://alicjamann.files.wordpress.com/2012/06/pink_oleander_flowers_410x400.jpg?w=450";

            productClass.Insert(item, out id);
            table = new ProductCategoryTable();
            table.ProductCategoryId = 2;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);


            item = new Product();
            item.Title = "Flower #1";
            item.Description = "Donec dictum accumsan lectus, eget sagittis metus interdum eu. Maecenas eget erat nisl, quis tristique odio. Sed tristique tristique rutrum. Phasellus laoreet fermentum diam pretium tristique. In bibendum faucibus felis nec convallis. Vestibulum fermentum pulvinar vestibulum. Phasellus condimentum, risus vel viverra egestas, libero nibh aliquet sapien, nec sagittis purus nibh at eros. Praesent aliquet accumsan velit. Vivamus suscipit pretium enim sagittis egestas. Aliquam ante libero, rutrum vitae varius vel, rutrum eu turpis. Nunc hendrerit risus ac mi posuere egestas dapibus orci ullamcorper. Cras commodo, ligula quis suscipit consectetur, dui erat pellentesque orci, non convallis elit leo sit amet nunc.";
            item.Price = 700;
            item.Image = @"http://www.freewebs.com/lnichollsphotography/Flowers%20and%20Plants/Flowers%20and%20Flying%20Bee.jpg";

            productClass.Insert(item, out id);
            table = new ProductCategoryTable();
            table.ProductCategoryId = 2;
            table.ProductId = id;

            productCategoryTableClass.Insert(table);

            list.Add(item);
        }

        //protected void listView_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    var commandName = e.CommandName;

        //    //If no command Name found
        //    if (string.IsNullOrEmpty(commandName))
        //        return;

        //    switch (commandName.ToLower())
        //    {
        //        //Add to Cart
        //        case "add":

        //            GiftItem giftItem = new GiftItem();
        //            giftItem.Id = (int)TextHelper.ToInteger(listView.DataKeys[e.Item.DataItemIndex].Values["Id"]);
        //            giftItem.Title = ((Label)e.Item.FindControl("lbl_title")).Text;
        //            giftItem.Price = (Double)TextHelper.ToDouble(((Label)e.Item.FindControl("lbl_price")).Text);
        //            giftItem.Quantity = 1;

        //            ShoppingCart.Add(giftItem);


        //            break;
        //    }
        //}
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
                    int id;
                    string title = string.Empty;
                    double price = 0;

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
                    id = (int)objId;

                    var isExist = false;

                    //Check if current item exist in the array
                    foreach (var item in ShoppingCart.Where(item => item.Id == id))
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
                            object objPrice = TextHelper.ToDouble(((Label)control).Text);

                            if (objPrice != null)
                                price = (double)objPrice;
                        }


                        var giftItem = new GiftItem
                                           {
                                               Id = id,
                                               Title = title,
                                               Price = price,
                                               Quantity = 1
                                           };

                        ShoppingCart.Add(giftItem);
                    }

                    string output = string.Empty;
                    double total = 0;

                    foreach (var item in ShoppingCart)
                    {
                        output += "Title: " + item.Title + "<br />";
                        output += "Price: " + item.Price + "<br />";
                        output += "Quantity: " + item.Quantity + "<br /><br />";

                        total += item.Price * item.Quantity;
                    }

                    output += "Total Price: " + total;

                    lit_output.Text = output;

                    break;
            }
        }
    }

    public class GiftItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
    }
}