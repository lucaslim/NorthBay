using System;
using System.Web.UI.WebControls;
using NorthBay.Logic.Career;

namespace NorthBay.Web.Admin.Career
{
    public partial class Default : System.Web.UI.Page
    {
        ////creating an instance of the LINQ class
        CareerClass objCareer = new CareerClass();

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
            txt_CategoryI.Text = string.Empty;
            txt_PostDateI.Text = string.Empty;
            txt_EndDateI.Text = string.Empty;

            dtl_all.DataSource = objCareer.getCareers();
            dtl_all.DataBind();
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
            {

                lbl_message.Text = "Career " + str + " was successful";
                lbl_message.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lbl_message.Text = "Sorry, unable to " + str + " this career";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void subAdmin(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Insert":
                    Boolean StatusI = false;
                    if (rbl_StatusI.SelectedValue == "0")
                    {
                        StatusI = false;
                    }
                    else
                    {
                        StatusI = true;
                    }

                    _strMessage(objCareer.commitInsert(txt_TitleI.Text, txt_DescriptionI.Text, txt_CategoryI.Text, txt_PostDateI.Text, txt_EndDateI.Text, StatusI), "insert");
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


        private void _showUpdate(int CareerId)
        {
            _panelControl(pnl_update);
            CareerClass objCareer = new CareerClass();
            dtl_update.DataSource = objCareer.getCareersByID(CareerId);
            dtl_update.DataBind();
        }

        private void _showDelete(int CareerId)
        {
            _panelControl(pnl_delete);
            dtl_delete.DataSource = objCareer.getCareersByID(CareerId);
            dtl_delete.DataBind();
        }

        //Update,Delete subroutine
        protected void subUpDel(object sender, DataListCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "Update":
                    TextBox txt_TitleU = (TextBox)e.Item.FindControl("txt_TitleU");
                    TextBox txt_DescriptionU = (TextBox)e.Item.FindControl("txt_DescriptionU");
                    TextBox txt_CategoryU = (TextBox)e.Item.FindControl("txt_CategoryU");
                    TextBox txt_PostDateU = (TextBox)e.Item.FindControl("txt_PostDateU");
                    TextBox txt_EndDateU = (TextBox)e.Item.FindControl("txt_EndDateU");
                    CheckBox ckb_StatusU = (CheckBox)e.Item.FindControl("ckb_StatusU");
                    //TextBox txt_StatusU = (TextBox)e.Item.FindControl("txt_StatusU");
                    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_CareerId");
                    int CareerId = int.Parse(hdfID.Value.ToString());
                    Boolean StatusU = false;
                    if (ckb_StatusU.Checked)
                    {
                        StatusU = true;
                    }
                    else
                    {
                        StatusU = false;
                    }

                    _strMessage(objCareer.commitUpdate(int.Parse(hdfID.Value), txt_TitleU.Text, txt_DescriptionU.Text, txt_CategoryU.Text, DateTime.Parse(txt_PostDateU.Text), DateTime.Parse(txt_EndDateU.Text), StatusU), "Update");

                    _subRebind();
                    break;
                case "Delete":
                    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                    _strMessage(objCareer.commitDelete(_id), "delete");
                    _subRebind();
                    break;
                case "Cancel":
                    _subRebind();
                    break;
            }
        }



    }

}