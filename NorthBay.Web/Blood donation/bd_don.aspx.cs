using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Utility;
using NorthBay.Logic.Blood_donor;
using System.Collections;

namespace NorthBay.Web.Blood_donation
{
    public partial class bd_don : Basepage
    {
       
        blood_donorClass objdonor = new blood_donorClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }

            Session["email"] = string.Empty;
        }

        
        public string group;
        protected void getbyAp(object sender, EventArgs e)
        {
            this.group = "A+";
            _show(group);
        }
        protected void getbyAn(object sender, EventArgs e)
        {
            this.group = "A-";
            _show(group);
        }
        protected void getbyBp(object sender, EventArgs e)
        {
            this.group = "B+";
            _show(group);
        }
        protected void getbyBn(object sender, EventArgs e)
        {
            this.group = "B-";
            _show(group);
        }
        protected void getbyOp(object sender, EventArgs e)
        {
            this.group = "O+";
            _show(group);
        }
        protected void getbyOn(object sender, EventArgs e)
        {
            this.group = "O-";
            _show(group);
        }
        protected void getbyABp(object sender, EventArgs e)
        {
            this.group = "AB+";
            _show(group);
        }
        protected void getbyABn(object sender, EventArgs e)
        {
            this.group = "AB-";
            _show(group);
        }

        protected void idb_email( object sender, RepeaterItemEventArgs e)
        {
           CheckBox cb = (CheckBox)e.Item.FindControl("cb");
           Label email = (Label)e.Item.FindControl("email_to");
           //Button email_btn = (Button)e.Item.FindControl("email_btn");
           if(String.IsNullOrEmpty(email.Text))
           {
               cb.Visible = false;
               //email_btn.Visible = false;
           }
        }

       
        

        private void _show(string group)
        {
            txt_email.Text = string.Empty;
            txt_message.Text = string.Empty;
            txt_name.Text = string.Empty;
            txt_phone.Text = string.Empty;
            rpt_all.DataSource = objdonor.getgroupbygroup(group);
            rpt_all.DataBind();
        }

        protected void insertdonor(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txt_email.Text) && string.IsNullOrEmpty(txt_phone.Text))
            {
                
                lbloutput.Text = "Enter email or phone to Contact";
                return;
            }

            var add_donor = new Framework.Database.blood_donor
            {
                blood_donor_name = txt_name.Text,
                blood_donor_phone = txt_phone.Text,
                blood_donor_email = txt_email.Text,
                blood_donor_blood_group = ddl_blood.SelectedValue.ToString(),
                blood_donor_message = txt_message.Text

            };
            
            if (objdonor.Insert(add_donor))
            {
                lbloutput.Text = "Thanks for your participation for a good cause";
                _show(ddl_blood.SelectedValue.ToString());
            }
            else
            {
                lbloutput.Text = "Please check all the fileds!";
            }

        }

        protected void send_email(object sender, EventArgs e)
        {
            Session["email"] = "";
            
            foreach (RepeaterItem i in rpt_all.Items)
            {
                
                CheckBox cb = (CheckBox)i.FindControl("cb");
                if (cb.Checked)
                {
                    Session["email"] += ((Label)i.FindControl("email_to")).Text + ';';
                }
            }
            Response.Redirect("~/Blood donation/sending_email.aspx");
        }


        protected void unsubscribe(object sender, EventArgs e)
        {
            
        }
    }
}

