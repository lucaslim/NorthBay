using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Restaurant;

namespace NorthBay.Web.Canteen
{
    public partial class canteen_home : Basepage
    {
        itemsClass objitem = new itemsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            //calling subrebind
            _subrebind();
        }


        //This was the code whicch I was trying to work with the food ordering system

        //protected void orc_canteen(object sender, GridViewCommandEventArgs e)
        //{
        //    switch(e.CommandName)
        //    {
        //        case "add" :
        //            var button = e.CommandSource as Button;
        //            var cell = button.Parent as DataControlFieldCell;
        //            object control = cell.FindControl("item_name");
        //            control = cell.FindControl("item_name");
        //            if (control is Label)
        //            {
        //                //item = ((Label)control).Text;
        //            }
        //            break;
        //    }
        //}

        

        //sub rebind to bind the gridview
        private void _subrebind()
        {
            grd_all.DataSource = objitem.getallitems();
            grd_all.DataBind();
        }
    }
}