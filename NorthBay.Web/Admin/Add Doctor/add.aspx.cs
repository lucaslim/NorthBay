using System;
using NorthBay.Framework.Database;
using NorthBay.Logic.Add_doctor;
using NorthBay.Utility;
using System.IO;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;

namespace NorthBay.Web.Admin.Add_Doctor
{
    public partial class add : System.Web.UI.Page
    {
        add_doctorClass objdoctor = new add_doctorClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subRebind();
            }
        }

        //Image uploading function
        protected void btn_submit(object sender, EventArgs e)
    {
        //set the path
        string savepath = "~/Images/profile/";
        
            //get the filename
        string filename = Path.GetFileName(upload_image.PostedFile.FileName);
        
            //if the file not uploaded, redirect it
            if (string.IsNullOrEmpty(filename.ToString()))
        {
            lbl_message1.Text = "Please check the Image !";
            Response.Redirect("~/Admin/Add Doctor/add.aspx");
        }

        //get the filename in lower case
        string filename_lower = filename.ToLower().ToString();

            //Split to store the extension
        string[] exts = filename_lower.Split('.');

        string dr_name = txt_dr_name.Text;
        string ext = exts[1].ToString();
        string newname = dr_name+"." + ext;
        int file_append = 0;
        // check if the name of that perticular file exist. And if exist then add _1,_2 till it is unique
        while (File.Exists(Server.MapPath(savepath + newname)))
        {
            file_append++;
            
               dr_name = dr_name + "_" + file_append.ToString();
               newname = dr_name + "." + ext;
        }

            //Insert query to store it in datasbase
        var Doctor_query = new Framework.Database.Doctor
        {
            DoctorName = txt_dr_name.Text,
            ContactNo = txt_contact.Text,
            EmailId = txt_email.Text,
            Designation = txt_designation.Text,
            Qualification = txt_qualification.Text,
            DepartmentId = txt_departmentID.Text,
            JoinDate = txt_date.Text,
            Biography = txt_biography.Text,
            ProfileImage = "~/Images/profile/" + newname
        };
        
        //check the extension variable for jpg . and if exist the add the image in separate folder and link into the database
        if (ext == "JPG" || ext == "jpg")
        {
            objdoctor.Insert(Doctor_query);
            upload_image.SaveAs(Path.Combine(Server.MapPath("~/Images/profile/"),newname));
            //upload_image.SaveAs(Server.MapPath("images/" + newname));
            lbl_message1.Text="Record Inserted Successfully !";
            _subRebind();
        }
        
            //if extension is different show the message
        else
        {
            lbl_message1.Text = "Record NOT inserted";
        }
        
    }

        //Update and delete 
        protected void subAdmin(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Update":
                    _showUpdate(int.Parse(e.CommandArgument.ToString()));
                    break;
                case "Delete":
                    _showDelete(int.Parse(e.CommandArgument.ToString()));
                    break;
            }
        }




        //Update textbox.....
        protected void subDel(object sender,RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Update":
                    TextBox txtname = (TextBox)e.Item.FindControl("txt_nameU");
                    TextBox txtcontact = (TextBox)e.Item.FindControl("txt_contactnoU");
                    TextBox txtemail = (TextBox)e.Item.FindControl("txt_emailU");
                    TextBox txtdesc = (TextBox)e.Item.FindControl("txt_designationU");
                    TextBox txtquali = (TextBox)e.Item.FindControl("txt_QualificationU");
                    TextBox txtjoin = (TextBox)e.Item.FindControl("txt_joindateU");
                    TextBox txtdept = (TextBox)e.Item.FindControl("txt_departmentidU");
                    TextBox txtbio = (TextBox)e.Item.FindControl("txt_biographyU");
                    TextBox txtprofile = (TextBox)e.Item.FindControl("txt_profileimageU");
                    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                    int drID = int.Parse(hdfID.Value.ToString());
                    _strMessage(objdoctor.commitUpdate(drID, txtname.Text, txtcontact.Text, txtemail.Text, txtdesc.Text, txtquali.Text, txtjoin.Text, txtdept.Text, txtbio.Text, txtprofile.Text), "update");
                    _subRebind();
                    break;
                case "Delete":
                    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                    _strMessage(objdoctor.commitDelete(_id),"delete");
                    _subRebind();
                    break;
                case "Cancel": _subRebind();
                    break;
            }
        }

        private void _showUpdate(int id)
        {
            _panelControl(pnl_update);
            add_doctorClass _linq = new add_doctorClass();
            rpt_update.DataSource = _linq.getDoctorById(id);
            rpt_update.DataBind();
        }

        private void _showDelete(int id)
        {
            _panelControl(pnl_delete);
            rpt_delete.DataSource = objdoctor.getDoctorById(id);
            rpt_delete.DataBind();
        }

        //panel control
        private void _panelControl(Panel pnl)
        {
            pnl_all.Visible = false;
            pnl_delete.Visible = false;
            pnl_update.Visible = false;
            pnl.Visible = true;
        }

        //binding data with repeater
        private void _subRebind()
        {
            txt_biography.Text = string.Empty;
            txt_contact.Text = string.Empty;
            txt_date.Text = string.Empty;
            txt_departmentID.Text = string.Empty;
            txt_designation.Text = string.Empty;
            txt_dr_name.Text = string.Empty;
            txt_email.Text = string.Empty;
            txt_qualification.Text = string.Empty;
            rpt_all.DataSource = objdoctor.getDoctors();
            rpt_all.DataBind();
            _panelControl(pnl_all);
        }

        //to display message
        private void _strMessage(bool flag, string str)
        {
            if (flag)
                lbl_message.Text = "<p  style='color:Green;'>Doctor " + str + " was successful</p>";
            else
                lbl_message.Text = "<p  style='color:Red;'>sorry " + str + " was not successful</p>";
        }


    }
}