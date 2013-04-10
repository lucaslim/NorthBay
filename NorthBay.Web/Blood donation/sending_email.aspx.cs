using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;

namespace NorthBay.Web.Blood_donation
{
    public partial class sending_email : Basepage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(Session["email"].ToString()))
            {
                Response.Redirect("~/Blood donation/bd_don.aspx");
            }
            else
            {
                string email = Session["email"].ToString();
                email_to.Text = email.ToString();      
            }
                        
         }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            try
            {
                SmtpClient smtpclient = new SmtpClient();
                MailMessage mailMessage = new MailMessage();

                //mailMessage.DeliveryNotificationOptions = (DeliveryNotificationOptions.OnFailure | DeliveryNotificationOptions.Delay | DeliveryNotificationOptions.OnSuccess);
                mailMessage.Priority = MailPriority.High;
                foreach (string recipient in email_to.Text.Split(';'))
                {
                    if (string.IsNullOrEmpty(recipient))
                    {

                    }
                    else
                    {

                        mailMessage.To.Add(recipient);
                    }
                }
                //mailMessage.From = new MailAddress(email_from.Text);
                mailMessage.Subject = "Blood Donation Department from NorthBay Regional Health Centre";
                mailMessage.Body = BodyTextBox.Text + "\n\n\n\n\n\n\n\n This messsage was sent by " + email_from.Text + " from northBay Hospital ( Blood Donation Department ).";
                smtpclient.Send(mailMessage);
                success.Text = "<br/>E-Mail sent successfully ! ";
                
                _clearfields();
            }
            catch (SmtpException ex)
            {
                success.Text = ex.Message;
            }
            catch (Exception ex)
            {
                success.Text = ex.Message;
            }
         }
        private void _clearfields()
        {
            BodyTextBox.Text = string.Empty;
            email_from.Text = string.Empty;
        }
        
    }
}