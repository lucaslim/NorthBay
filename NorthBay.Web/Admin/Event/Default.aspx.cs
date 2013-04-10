using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Event;

namespace NorthBay.Web.Admin.Event
{
    public partial class Default : System.Web.UI.Page
    {
        //creating an instance of the LINQ class
        EventClass objEvent = new EventClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subRebind();
            }
        }

        private void _subRebind()
        {
            txt_TitleI.Text = string.Empty;
            txt_DescriptionI.Text = string.Empty;
            txt_EventDateI.Text = string.Empty;
            txt_ImageUrlI.Text = string.Empty;
            txt_EventTypeI.Text = string.Empty;

            rpt_all.DataSource = objEvent.getEvents();
            rpt_all.DataBind();
            _panelControl(pnl_all);
        }


        private void _panelControl(Panel pnl)
        {
            pnl_all.Visible = false;
            pnl_delete.Visible = false;
            pnl_update.Visible = false;
            pnl.Visible = true;


        }

        //Display message to show the insert/update/delete successful or not
        private void _strMessage(bool flag, string str)
        {
            if (flag)

                lbl_message.Text = "Event " + str + " was successful";

            else

                lbl_message.Text = "Sorry, unable to " + str + " this Event";

        }

        protected void subAdmin(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Insert":

                    _strMessage(objEvent.commitInsert(txt_TitleI.Text, txt_DescriptionI.Text, DateTime.Parse(txt_EventDateI.Text), txt_ImageUrlI.Text, int.Parse(txt_EventTypeI.Text)), "insert");
                    _subRebind();
                    break;
                case "Update":
                    _showUpdate(int.Parse(e.CommandArgument.ToString()));
                    break;
                case "Delete":
                    _showDelete(int.Parse(e.CommandArgument.ToString()));
                    break;
            }
        }


        private void _showUpdate(int EventId)
        {
            _panelControl(pnl_update);
            EventClass objEvent = new EventClass();
            rpt_update.DataSource = objEvent.getEventByID(EventId);
            rpt_update.DataBind();
        }

        private void _showDelete(int EventId)
        {
            _panelControl(pnl_delete);
            rpt_delete.DataSource = objEvent.getEventByID(EventId);
            rpt_delete.DataBind();
        }

        //Update,Delete subroutine
        protected void subUpDel(object sender, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "Update":
                    TextBox txt_TitleU = (TextBox)e.Item.FindControl("txt_TitleU");
                    TextBox txt_DescriptionU = (TextBox)e.Item.FindControl("txt_DescriptionU");
                    TextBox txt_EventDateU = (TextBox)e.Item.FindControl("txt_EventDateU");
                    TextBox txt_ImageUrlU = (TextBox)e.Item.FindControl("txt_ImageUrlU");
                    TextBox txt_EventTypeU = (TextBox)e.Item.FindControl("txt_EventTypeU");

                    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_EventId");
                    int EventId = int.Parse(hdfID.Value.ToString());


                    _strMessage(objEvent.commitUpdate(int.Parse(hdfID.Value), txt_TitleU.Text, txt_DescriptionU.Text, DateTime.Parse(txt_EventDateU.Text), txt_ImageUrlU.Text, int.Parse(txt_EventTypeU.Text)), "Update");

                    _subRebind();
                    break;
                case "Delete":
                    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                    _strMessage(objEvent.commitDelete(_id), "delete");
                    _subRebind();
                    break;
                case "Cancel":
                    _subRebind();
                    break;
            }
        }



    } 
}
