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
       //creating an object of the class
        blood_donorClass objdonor = new blood_donorClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }

            //making email empty on page load 
            Session["email"] = string.Empty;
        }

        //group variable decleration
        public string group;
        //if getbyAp button clicked set A+ to group and pass the argument in _show
        protected void getbyAp(object sender, EventArgs e)
        {
            this.group = "A+";
            _show(group);
        }

        //if getbyAp button clicked set A- to group and pass the argument in _show
        protected void getbyAn(object sender, EventArgs e)
        {
            this.group = "A-";
            _show(group);
        }

        //if getbyAp button clicked set B+ to group and pass the argument in _show
        protected void getbyBp(object sender, EventArgs e)
        {
            this.group = "B+";
            _show(group);
        }

        //if getbyAp button clicked set B- to group and pass the argument in _show
        protected void getbyBn(object sender, EventArgs e)
        {
            this.group = "B-";
            _show(group);
        }

        //if getbyAp button clicked set O+ to group and pass the argument in _show
        protected void getbyOp(object sender, EventArgs e)
        {
            this.group = "O+";
            _show(group);
        }

        //if getbyAp button clicked set O+ to group and pass the argument in _show
        protected void getbyOn(object sender, EventArgs e)
        {
            this.group = "O-";
            _show(group);
        }

        //if getbyAp button clicked set AB+ to group and pass the argument in _show
        protected void getbyABp(object sender, EventArgs e)
        {
            this.group = "AB+";
            _show(group);
        }

        //if getbyAp button clicked set AB- to group and pass the argument in _show
        protected void getbyABn(object sender, EventArgs e)
        {
            this.group = "AB-";
            _show(group);
        }


        //Checking if the email is present. If present then and only then sow the checkbox to send email
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

       
        
        //Show the information in repeater according to the group clicked
        private void _show(string group)
        {
            txt_email.Text = string.Empty;
            txt_message.Text = string.Empty;
            txt_name.Text = string.Empty;
            txt_phone.Text = string.Empty;
            rpt_all.DataSource = objdonor.getgroupbygroup(group);
            rpt_all.DataBind();
        }

        //inserrting new donor into the database
        protected void insertdonor(object sender, EventArgs e)
        {
            //I kept it optional for either phone no. or email. And if both are empty or null it will display
            //a message and return without further execution
            if(string.IsNullOrEmpty(txt_email.Text) && string.IsNullOrEmpty(txt_phone.Text))
            {
                
                lbloutput.Text = "Enter email or phone to Contact";
                return;
            }

            //inserting into database using the framework
            var add_donor = new Framework.Database.blood_donor
            {
                blood_donor_name = txt_name.Text,
                blood_donor_phone = txt_phone.Text,
                blood_donor_email = txt_email.Text,
                blood_donor_blood_group = ddl_blood.SelectedValue.ToString(),
                blood_donor_message = txt_message.Text

            };
            
            //display appropriate message on insert statement 
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


        //When checkbox is checked it will store the number of checked email id into session adding ; at the end to separate it from the other emails
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

        //working on this part - but it is extra.
        protected void unsubscribe(object sender, EventArgs e)
        {
            
        }
    }
}

