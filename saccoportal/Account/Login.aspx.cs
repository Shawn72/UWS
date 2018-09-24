using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SACCOPortal.Models;

namespace SACCOPortal.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
        public string strSQLConn = @"Server=" + ConfigurationManager.AppSettings["DB_INSTANCE"] + ";Database=" +
                                 ConfigurationManager.AppSettings["DB_NAME"] + "; User ID=" +
                                 ConfigurationManager.AppSettings["DB_USER"] + "; Password=" +
                                 ConfigurationManager.AppSettings["DB_PWD"] + "; MultipleActiveResultSets=true";

        protected void btnLogMeIn_OnClick(object sender, EventArgs e)
        {
            string userName = userNo.Text.Trim().Replace("'", "");
            string userPassword = Password.Text.Trim().Replace("'", "");

            try
            {
                if (string.IsNullOrWhiteSpace(userPassword))
                {
                    lblError.Text = "Password Empty!";
                    SACCOFactory.ShowAlert("Password Empty!");
                    return;
                }

                if (MyValidationFunction(userName, userPassword))
                {
                    Session["username"] = userName;
                    Session["pwd"] = userPassword;
                    Response.Redirect("Dashboard");
                    FormsAuthentication.RedirectFromLoginPage
                    (userNo.Text, RememberMe.Checked);
                }
                else
                {
                    lblError.Text = "Authentication failed!";
                    SACCOFactory.ShowAlert("Authentication failed!, Try Again");
                }
            }
            catch (Exception exception)
            {
                lblError.Text = exception.Message;
                return;
            }
        }
        private bool MyValidationFunction(string myusername, string mypassword)
        {
            bool boolReturnValue = false;
            string SQLRQST = @"SELECT No_, Password from [United Women Sacco Ltd$Members Register]";
            SqlConnection con = new SqlConnection(strSQLConn);
            SqlCommand command = new SqlCommand(SQLRQST, con);
            SqlDataReader Dr;
            try
            {
                con.Open();
                Dr = command.ExecuteReader();
                while (Dr.Read())
                {
                    if ((myusername == Dr["No_"].ToString()) && (mypassword == Dr["Password"].ToString()))
                    {
                        boolReturnValue = true;
                        break;
                    }
                    if (string.IsNullOrWhiteSpace(Dr["Password"].ToString()))
                    {
                        boolReturnValue = false;
                    }
                }
                Dr.Close();
            }
            catch (SqlException ex)
            {
                SACCOFactory.ShowAlert("Authentication failed!" + ex.Message);

            }
            return boolReturnValue;
        }


    }
}