using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using NorthBay.Logic.Menu;
using NorthBay.Utility;
using Menu = NorthBay.Framework.Database.Menu;


namespace NorthBay.Web.Masterpage
{
    public partial class Main : BaseMasterpage
    {
        private readonly MenuClass _objMenu = new MenuClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetMenuData(); //calls function  
                //GetFooterMenu();
                //GetFooterMenu2();
            }
        }

        private void GetMenuData() //create function to get menu data from database 
        {
            //Get menu list
            var menuList = _objMenu.SelectAll().OrderBy(x => x.DisplaySequence).Where(x => x.IsActive);

            //loop through menu list
            foreach (var menu in menuList)
            {
                if (menu.ParentMenuItemId != null)
                    continue;

                //Create menu object
                var menuItem = new MenuItem(menu.Name, TextHelper.ToString(menu.MenuItemId))
                                   {
                                       NavigateUrl = menu.Url
                                   };

                //Add to main menu
                main_menu.Items.Add(menuItem);

                //Add Child Menu
                AddChildMenu(menuList, menuItem);
            }

        }

        private void AddChildMenu(IEnumerable<Menu> menuList, MenuItem menuItem)
        {
            var parentId = TextHelper.ToInteger(menuItem.Value);

            var childMenuList = menuList.OrderBy(x => x.DisplaySequence).Where(x => x.ParentMenuItemId == parentId && x.IsActive).ToList();

            foreach (var menu in childMenuList)
            {

                //Create menu object
                var childItem = new MenuItem(menu.Name, TextHelper.ToString(menu.MenuItemId))
                                    {
                                        NavigateUrl = menu.Url
                                    };

                //Add to main menu
                menuItem.ChildItems.Add(childItem);

                //Add Child Menu
                AddChildMenu(menuList, childItem);
            }
        }

        //protected void GetFooterMenu()
        //{
        //    DataTable footertable = new DataTable();
        //    SqlConnection conn = new SqlConnection(strCon);
        //    string sql = "select menuItemID , name, description,parentMenuItemID, url , displaySequence from menuDemo where menuItemID between 1 and 11";
        //    SqlCommand cmd = new SqlCommand(sql, conn);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(footertable);
        //    DataView view = new DataView(footertable);
        //    view.RowFilter = "parentMenuItemID is NULL";
        //    foreach (DataRowView row in view)
        //    {
        //        MenuItem menuItem = new MenuItem(row["name"].ToString(), row["menuItemID"].ToString());
        //        menuItem.NavigateUrl = row["url"].ToString();
        //        footerMenu.Items.Add(menuItem);

        //    }
        //}

        //protected void GetFooterMenu2()
        //{
        //    DataTable footertable = new DataTable();
        //    SqlConnection conn = new SqlConnection(strCon);
        //    string sql = "select menuItemID , name, description,parentMenuItemID, url , displaySequence from menuDemo where menuItemID > 11";
        //    SqlCommand cmd = new SqlCommand(sql, conn);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(footertable);
        //    DataView view = new DataView(footertable);
        //    view.RowFilter = "parentMenuItemID is NULL";
        //    foreach (DataRowView row in view)
        //    {
        //        MenuItem menuItem = new MenuItem(row["name"].ToString(), row["menuItemID"].ToString());
        //        menuItem.NavigateUrl = row["url"].ToString();
        //        footerMenu2.Items.Add(menuItem);

        //    }
        //}
    }
}