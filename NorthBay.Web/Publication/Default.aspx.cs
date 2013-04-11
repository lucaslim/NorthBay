using System;
using NorthBay.Logic.Publication;
using NorthBay.Utility;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace NorthBay.Web.Publication
{
    
    public partial class Default : Basepage
    {
        private readonly PublicationClass objPublication = new PublicationClass();
        private readonly PublicationClass objTempPublication = new PublicationClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblPublicationDetail.Visible = false;
            if (!Page.IsPostBack)
            {
                gridView.DataSource = objPublication.SelectAll();
                gridView.DataBind();
            }
        }

        
        protected void linkButtonPub_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).CommandArgument.ToString());
            

            lblPublicationTitle.Text = "Title: "+objPublication.Select(id).Title;
            lblPublicationDetail.Visible = true;
            lblPublicationDescription.Text = "Article: " + objTempPublication.Select(id).Description;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            sendemail("info@northbayhosp.com", txtMailTo.Text.ToString(), "Mail from info@northbayhosp.com",txtMsg.Text.ToString(), true);
        }

        public Boolean sendemail(String strFrom, string strTo, string strSubject, string strBody, bool IsBodyHTML)
        {
            Array arrToArray;
            char[] splitter = { ';' };
            arrToArray = strTo.Split(splitter);
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(strFrom);
            mm.Subject = strSubject;
            mm.Body = strBody;
            mm.IsBodyHtml = IsBodyHTML;
           
            foreach (string s in arrToArray)
            {
                mm.To.Add(new MailAddress(s));
            }
            SmtpClient smtp = new SmtpClient();
            try
            {
                smtp.Host = "smtpout.secureserver.net";
                smtp.EnableSsl = false; 
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = "info@northbayhosp.com";
                NetworkCred.Password = "N0rthb@y";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 80;
                smtp.Send(mm);
                txtMailTo.Text = "";
                txtMsg.Text = "";
                return true;

            }
            catch
            {
                mm.Dispose();
                smtp = null;
                return false;
            }
            
        }

    }
}