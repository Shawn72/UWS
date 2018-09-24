using SACCOPortal.NavOData;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class Feedback : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
             new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void sendFeedBack() {
        //    try
        //    {
        //        string memberNo = Session["username"].ToString();
        //        var senderemail = nav.MemberList.ToList().Where(r => r.No == memberNo).Select(r => r.E_Mail).SingleOrDefault();
              

        //        var ComposedEmail = WSConfig.ObjNav.FnSendFeedback(memberNo, txtfeedback.Text.Trim(), senderemail);

        //        if (MailFunction(string.Format("<html><p>Dear Mafanikio Support,</p>\n<p>"+ txtfeedback.Text.Trim(),"</p></html>"), ComposedEmail,
        //            "Member "+memberNo+" Has send a feedback") && !String.IsNullOrEmpty(ComposedEmail))
        //        {
        //            SACCOFactory.ShowAlert(
        //                "Feedback Send successfully");
                   
        //        }
        //        else
        //        {
        //            SACCOFactory.ShowAlert(
        //               "An error occurred while sending feedback!");
                 
        //        }

        //    }
        //    catch (Exception exception)
        //    {
        //        SACCOFactory.ShowAlert(exception.Message);
        //    }


        //}
        //public static bool MailFunction(string body, string recepient, string subject)
        //{
        //    bool x = false;

        //    try
        //    {
        //        const string fromAddress = "mafanikiofeedbacks@gmail.com";
        //        string toAddress = recepient;//"info@mafanikiosacco.com";
        //        var mail = new MailMessage();
        //        mail.To.Add(toAddress);
        //        mail.Subject = subject;
        //        mail.From = new MailAddress(fromAddress);
        //        mail.Body = body;
        //        mail.IsBodyHtml = true;
        //        var client = new SmtpClient
        //        {
        //            UseDefaultCredentials = false,
        //            Credentials = new NetworkCredential("mafanikiofeedbacks@gmail.com", "dre1234*"),
        //            Port = 587,
        //            Host = "smtp.gmail.com",
        //            DeliveryMethod = SmtpDeliveryMethod.Network,
        //            EnableSsl = true
        //        };
        //        client.Send(mail);
        //        x = true;
        //    }
        //    catch (Exception ex2)
        //    {
        //        ex2.Data.Clear();
        //    }
        //    return x;
        //}

        protected void btnsendback_Click(object sender, EventArgs e)
        {
           // sendFeedBack();
        }
    }
}