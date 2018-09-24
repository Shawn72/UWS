using SACCOPortal.NavOData;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class PassChange : System.Web.UI.Page
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
        
        //protected void btnChange_Click(object sender, EventArgs e)
        //{
        //    string userName = Session["username"].ToString();
        //    string olPassword = txtolPass.Text.Trim().Replace("'", "");
        //    string nPasswdO = txtnewPass1.Text.Trim().Replace("'", "");
        //    string nPasswd = txtnewPass2.Text.Trim().Replace("'", "");
        //   // var psdC = nav.MemberList.Where(r => r.No == userName);
        //   // string pasDB = psdC.ToList().Select(r => r.Password).ToString();
        //    if (string.IsNullOrEmpty(olPassword))
        //    {
        //        lblError.Text = "Fill the old password!";
        //        return;
        //    }

        //    else
        //    {
        //        try
        //        {
        //            var CompEmail = WSConfig.ObjNav.FnChangePassword(userName, txtolPass.Text.Trim(), txtnewPass2.Text.Trim());
        //            if (WSConfig.MailFunction(string.Format("Dear Sacco Member,\n Your password was successfully reset to: {0}", nPasswd), CompEmail,
        //                "Successfull password change") && !String.IsNullOrEmpty(CompEmail))
        //            {
        //                SACCOFactory.ShowAlert(
        //                    "Your password was sent to your Personal mail. Kindly check");

        //            }
        //            else
        //            {
        //                SACCOFactory.ShowAlert(
        //                   "An error occurred. Kindly consult Sacco ICT for more details, or check your network connections");

        //            }
        //        }
        //        catch (Exception exception)
        //        {
        //            SACCOFactory.ShowAlert(exception.Message);
        //        }
        //    }
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard");
        }
    }
    }
