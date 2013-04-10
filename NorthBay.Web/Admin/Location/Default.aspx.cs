using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Location;

public partial class Admin_Location_Default : System.Web.UI.Page
{
    LocationClass objLinq = new LocationClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            panel_update.Visible = false;
            _subRebind();
        }
    }

    private void _subRebind()
    {
        //Empty the text box
        txt_unitI.Text = string.Empty;
        txt_street_noI.Text = string.Empty;
        txt_street_nameI.Text = string.Empty;
        txt_cityI.Text = string.Empty;
        //txt_provinceI.Text = string.Empty;
        txt_pcodeI.Text = string.Empty;
        txt_tnumberI.Text = string.Empty;
        txt_emailI.Text = string.Empty;
        txt_latitudeI.Text = string.Empty;
        txt_longitudeI.Text = string.Empty;


        ddl_location_addresses.DataSource = objLinq.getLocationAddresses();
        ddl_location_addresses.DataValueField = "LocationId";
        ddl_location_addresses.DataTextField = "Address";
        ddl_location_addresses.DataBind();

        //This section here and once more in next procedure  to  conect between the selection  dropdown list and what will be shown in the listview 
        int _id = int.Parse(ddl_location_addresses.SelectedValue.ToString());
        ltv_locations.DataSource = objLinq.getLocationById(_id);
        ltv_locations.DataBind();

     
        
    }

    protected void subChange(object sender, EventArgs e)
    {
        int _id = int.Parse(ddl_location_addresses.SelectedValue.ToString());
        ltv_locations.DataSource = objLinq.getLocationById(_id);
        ltv_locations.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "<span style='color:green;'> Location " + str + " was successful </span>";
        }
        else
        {
            lbl_message.Text = "<span style='color:red;'> Sorry, unable to " + str + " location </span>";
        }
    }

    protected void subInsert(object sender, EventArgs e)
    {
        //This method "_strMessage" displays when a record is inserted to the database
        _strMessage(objLinq.commitInsert(txt_unitI.Text, txt_street_noI.Text, txt_street_nameI.Text, txt_cityI.Text, ddl_provinceI.SelectedItem.Value, txt_pcodeI.Text, txt_tnumberI.Text, txt_emailI.Text, decimal.Parse(txt_latitudeI.Text), decimal.Parse(txt_longitudeI.Text), txt_imageurlI.Text), "insert");
        _subRebind();
    }

    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "subUpdate":
                TextBox txt_unitE = (TextBox)e.Item.FindControl("txt_unitE");
                TextBox txt_street_noE = (TextBox)e.Item.FindControl("txt_street_noE");
                TextBox txt_street_nameE = (TextBox)e.Item.FindControl("txt_street_nameE");
                TextBox txt_cityE = (TextBox)e.Item.FindControl("txt_cityE");
                DropDownList ddl_provinceE = (DropDownList)e.Item.FindControl("ddl_provinceE");
                HiddenField hdf_provinceE = (HiddenField)e.Item.FindControl("hdf_provinceE");
                TextBox txt_pcodeE = (TextBox)e.Item.FindControl("txt_pcodeE");
                TextBox txt_tnumberE = (TextBox)e.Item.FindControl("txt_tnumberE");
                TextBox txt_emailE = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txt_latitudeE = (TextBox)e.Item.FindControl("txt_latitudeE");
                decimal latitudeE = decimal.Parse(txt_latitudeE.Text.ToString());
                TextBox txt_longitudeE = (TextBox)e.Item.FindControl("txt_longitudeE");
                decimal longitudeE = decimal.Parse(txt_longitudeE.Text.ToString());
                TextBox txt_imageurlE = (TextBox)e.Item.FindControl("txt_imageurlE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int locationID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(locationID, txt_unitE.Text, txt_street_noE.Text, txt_street_nameE.Text, txt_cityE.Text, ddl_provinceE.SelectedItem.Value, txt_pcodeE.Text, txt_tnumberE.Text, txt_emailE.Text, latitudeE, longitudeE, txt_imageurlE.Text), "Update");
                _subRebind();

                break;
            case "subDelete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "subDisplayInsert":
                panel_update.Visible = false;
                panel_insert.Visible = true;
                break;
        }

    }

    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
                
            foreach (ListViewDataItem item in ltv_locations.Items)
            {
                HiddenField hdf_provinceE = (HiddenField)item.FindControl("hdf_provinceE");
                DropDownList ddl_provinceE = (DropDownList)item.FindControl("ddl_provinceE");             
                ddl_provinceE.Items.FindByValue(hdf_provinceE.Value).Selected = true;

                break;
            }
       
    }


    protected void btn_display_update_Click(object sender, EventArgs e)
    {
        panel_update.Visible = true;
        panel_insert.Visible = false;
    }
}