using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Restaurant;

namespace NorthBay.Web.Admin.Canteen
{
    public partial class canteen_admin : System.Web.UI.Page
    {
        itemsClass objitem = new itemsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subRebind();
            }
        }


        //updating and deleting
        protected void subAdmin(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Insert": _strMessage(objitem.Insert(txt_nameI.Text, decimal.Parse(txt_priceI.Text.ToString()), txt_descI.Text), "insert");
                    _subRebind();
                    break;
                case "Updating":
                    _showUpdate(int.Parse(e.CommandArgument.ToString()));
                    break;
                case "Deleting":
                    _showDelete(int.Parse(e.CommandArgument.ToString()));
                    break;
            }
        }

        //Updating the data
        protected void subUpdate(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Updating":
                    TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                    TextBox txtPrice = (TextBox)e.Item.FindControl("txt_priceU");
                    TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");

                    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                    int itemID = int.Parse(hdfID.Value.ToString());
                    _strMessage(objitem.Update(itemID, txtName.Text, decimal.Parse(txtPrice.Text.ToString()), txtDesc.Text), "update");
                    _subRebind();
                    break;
                case "Canceling":
                    _subRebind();
                    break;
            }
        }

        //deleting the data 
        protected void subDelete(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Deleting":
                    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                    _strMessage(objitem.Delete(_id), "delete");

                    _subRebind();
                    break;
                case "Canceling":
                    _subRebind();
                    break;
            }
        }

        private void _showUpdate(int id)
        {
            _PanelControl(pnl_update);
            itemsClass _linq = new itemsClass();
            ltv_update.DataSource = _linq.getitembyid(id);
            ltv_update.DataBind();
        }

        //delete function
        private void _showDelete(int id)
        {
            _PanelControl(pnl_delete);
            ltv_delete.DataSource = objitem.getitembyid(id);
            ltv_delete.DataBind();
        }
        
        //panels to  control

        private void _PanelControl(Panel pnl)
        {
            pnl_all.Visible = false;
            pnl_update.Visible = false;
            pnl_delete.Visible = false;
            pnl.Visible = true;
        }

        //Binding the data
        private void _subRebind()
        {
            txt_nameI.Text = string.Empty;
            txt_descI.Text = string.Empty;
            txt_priceI.Text = string.Empty;
            ltv_all.DataSource = objitem.getallitems();
            ltv_all.DataBind();
            _PanelControl(pnl_all);

        }

        //display message of succes and failure
        private void _strMessage(bool flag, string str)
        {
            if (flag)
            {
                lbl_msg.Text = "item" + str + "was successful";
            }

            else
            {
                lbl_msg.Text = "item not inserted";
            }

        }
    }
}