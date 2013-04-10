using System;
using System.Web.UI.WebControls;
using System.IO;
using NorthBay.Logic.Career;

namespace NorthBay.Web.Career
{
    public partial class Career_Application : System.Web.UI.Page
    {
        ApplicantClass objApplicant = new ApplicantClass(); 

        protected void Page_Load(object sender, EventArgs e)
        {

            objApplicant.careerid = int.Parse(Request.QueryString["Careerid"]);
            objApplicant.fname = txt_fname.Text;
            objApplicant.lname = txt_lname.Text;
            objApplicant.unitno = txt_unitno.Text;
            objApplicant.streetno = txt_streetno.Text;
            objApplicant.streetname = txt_streetname.Text;
            objApplicant.streetname = txt_streetname.Text;
            objApplicant.city = txt_city.Text;
            objApplicant.province = ddl_province.SelectedValue;
            objApplicant.pcode = txt_pcode.Text;
            objApplicant.tpnumber = txt_tpnumber.Text;
            objApplicant.email = txt_email.Text;
            objApplicant.resumeurl = hdf_ResumeUrl.Value;
            // objApplicant.resumeurl = fupd_FileUpload.FileName;


        }
        //Access the class and print the applicant information

        protected void wds_2_Activate(object sender, System.EventArgs e)
        {
            lbl_print.Text = objApplicant.print();
            lbl_message.Text = "<h3>Please click on submit to process your request...!</h3>";
        }

        protected void wds_3_Activate(object sender, System.EventArgs e)
        {
            lbl_confirmation.Text = "We will contact you soon....!";


        }

        //File upload process
        protected void btn_Upload_Click(object sender, System.EventArgs e)
        {
            string uploadFolder = Request.PhysicalApplicationPath + "Career\\Resumes\\";
            if (fupd_FileUpload.HasFile)
            {
                // string extension = Path.GetExtension(fupd_FileUpload.PostedFile.FileName);
                if (IsValidFileType() == true)
                {

                    fupd_FileUpload.SaveAs(uploadFolder + fupd_FileUpload.FileName);
                    lbl_UploadStatus.Text = "File uploaded successfully: " + fupd_FileUpload.PostedFile.FileName;
                    hdf_ResumeUrl.Value = "~/Career/Resumes/" + fupd_FileUpload.PostedFile.FileName;
                    lbl_UploadStatus.ForeColor = System.Drawing.Color.SeaGreen;
                }
                else
                {
                    lbl_UploadStatus.Text = "This file extension is not permitted. ";
                    lbl_UploadStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lbl_UploadStatus.Text = "Please select your resume.";
            }
        }
        //Check the file tye is correct before uploading
        protected bool IsValidFileType()
        {
            string[] validFileTypes = {"docx","doc","pdf","rtf"};
            string extension = Path.GetExtension(fupd_FileUpload.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (extension == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
      
            return  isValidFile;
        }


        protected void subInsert(object sender, CommandEventArgs e)
        {

            _isInsertSuccess(objApplicant.commitInsert(objApplicant.careerid, objApplicant.fname, objApplicant.lname, objApplicant.unitno, objApplicant.streetno, objApplicant.streetname, objApplicant.city, objApplicant.province, objApplicant.pcode, objApplicant.tpnumber, objApplicant.email, objApplicant.resumeurl));
           
        }

        // Display message to show the insert successful or not
        private void _isInsertSuccess(bool flag)
        {
            if (flag)
            {
                SendEmailClass objSendEmail = new SendEmailClass();
                CareerClass objCareer = new CareerClass();
           
            
                //System.Net.Configuration.SmtpSection smtp = new System.Net.Configuration.SmtpSection();            
                objSendEmail.SendMessage("info@northbayhosp.com", objApplicant.email, "Northbay Career Application : " + objCareer.getCareerByID(objApplicant.careerid), objApplicant.emailbody());
                lbl_message.Text = "Your application has been successfully submitted";

            }
            else
            {
                lbl_message.Text = "Your application has NOT been submitted";
            }

        }

    }
}