using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;
using Microsoft.VisualBasic;
using SACCOPortal;

namespace SACCOPortal
{
    public partial class _Default : Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
               new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                   ConfigurationManager.AppSettings["DOMAIN"])
        };
        public string strSQLConn = @"Server=" + ConfigurationManager.AppSettings["DB_INSTANCE"] + ";Database=" +
                                  ConfigurationManager.AppSettings["DB_NAME"] + "; User ID=" +
                                  ConfigurationManager.AppSettings["DB_USER"] + "; Password=" +
                                  ConfigurationManager.AppSettings["DB_PWD"] + "; MultipleActiveResultSets=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
            btnBack.Visible = false;
            btnSubmit.Visible = false;
            if (!IsPostBack)
            {
                this.loanProduct.Items.Clear();
                NAV nav = new Config().ReturnNav();
                var loans = nav.LoansProductSetUp.Where(ln=>ln.Code!= "SASSET" &&ln.Code!= "SCAR");
                loanProduct.DataSource = loans;
                loanProduct.DataTextField = "Product_Description";
                loanProduct.DataValueField = "Code";
                loanProduct.DataBind();
                loanProduct.SelectedIndex = 1;
                ChangeInstallment(loanProduct.SelectedValue);
                UpdateDetails(loanProduct.SelectedValue);
            }
        }
        private int count = 0;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            cptCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());
            if (cptCaptcha.UserValidated)
            {
                string userName = txtStaffNo.Text.Trim().Replace("'", "");
                string userPassword = txtPassword.Text.Trim().Replace("'", "");

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
            else
            {
                lblError.Text = "Invalid Captcha.Try again!!";
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
            catch(SqlException ex)
            {
                SACCOFactory.ShowAlert("Authentication failed!" +ex.Message);
                
            }
            return boolReturnValue;
        }



        protected void btnPassword_Click(object sender, EventArgs e)
        {
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiView1.SetActiveView(View2);
           
            btnSubmit.Visible = true;
            btnBack.Visible = true;
            lblError.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            btnSubmit.Visible = false;
            btnBack.Visible = false;
           
            MultiView1.SetActiveView(View1);
            //btnSignup.Visible = true;
            btnLogin.Visible = true;
            lblError.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = txtEmployeeNo.Text.Trim().Replace("'", "");
                string userPassword = idNo.Text.Trim().Replace("'", "");

                var idcheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.ID_No).FirstOrDefault();
                var emalcheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.E_Mail).FirstOrDefault();
                var phonecheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.Phone_No).FirstOrDefault();

                if (string.IsNullOrWhiteSpace(userName))
                {
                    lblError.Text = "Please enter your Member Number!";
                    btnSubmit.Visible = true;
                    btnBack.Visible = true;
                    //btnSignup.Visible = false;
                    btnLogin.Visible = false;
                    MultiView1.SetActiveView(View2);
                    SACCOFactory.ShowAlert("Please enter your Member Number");
                    return;

                }
                if (string.IsNullOrWhiteSpace(userPassword))
                {
                    lblError.Text = "Please enter your ID number!";
                    btnSubmit.Visible = true;
                    btnBack.Visible = true;
                    //btnSignup.Visible = false;
                    btnLogin.Visible = false;
                    MultiView1.SetActiveView(View2);
                    SACCOFactory.ShowAlert("Please enter your ID number");
                    return;
                }
                var nPassword = NewPassword();
                var CompEmail = WSConfig.ObjNav.FnUpdatePassword(txtEmployeeNo.Text.Trim(), nPassword, idNo.Text.Trim());
                if (WSConfig.MailFunction(string.Format("Dear Sacco Member,\n Your New password is: {0}", nPassword),
                    CompEmail,
                    "Portal password reset successful") && !String.IsNullOrEmpty(CompEmail))
                {
                    SACCOFactory.ShowAlert(
                        "A New Password has been generated and sent to your Personal mail.Kindly use to it to login to your Member portal");
                    btnSubmit.Visible = true;
                    btnBack.Visible = true;
                    //btnSignup.Visible = false;
                    btnLogin.Visible = false;
                    MultiView1.SetActiveView(View2);
                    lblError.Text = "";
                }
                else if (idcheck != userPassword)
                {
                    SACCOFactory.ShowAlert(
                        "Your Password could not be reset. Member number does not match your ID number!");
                    //btnSubmit.Visible = true;
                    //btnBack.Visible = true;
                    //btnSignup.Visible = false;
                    //btnLogin.Visible = false;
                    //MultiView1.SetActiveView(View2);
                    lblError.Text = "Your Password could not be reset. Member number does not match your ID number!";
                }
                else if (string.IsNullOrEmpty(emalcheck) && phonecheck != null)
                {
                    SACCOFactory.ShowAlert(
                        "Your Password was send to your Phone Number");
                    //btnSubmit.Visible = false;
                    //txtEmployeeNo.Enabled = false;
                    //idNo.Enabled = false;
                    //btnBack.Visible = false;
                    //MultiView1.SetActiveView(View1);
                    //btnSignup.Visible = true;
                    //btnLogin.Visible = true;
                    lblError.Text = "Your Password was send to your Phone Number";
                }

            }
            catch (Exception er)
            {
                SACCOFactory.ShowAlert("Fill all the fields required!!");
            }
            btnSubmit.Visible = true;
            btnBack.Visible = true;
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiView1.SetActiveView(View2);

        }


        protected string NewPassword()
        {
            var nPwd = "";
            var rdmNumber = new Random();
            nPwd = rdmNumber.Next(1000, 1999).ToString();
            return nPwd;
        }
        
        protected void loanProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

            ChangeInstallment(loanProduct.SelectedValue);
            UpdateDetails(loanProduct.SelectedValue);
        }

        public void ChangeInstallment(String mycode)
        {
            NAV nav = new Config().ReturnNav();
            var maxPeriod = nav.LoansProductSetUp.Where(r => r.Code == mycode);
            this.installments.Items.Clear();
            foreach (var period in maxPeriod)
            {
                var seq = Enumerable.Range(1, Convert.ToInt32(period.No_of_Installment)).Reverse();
                installments.DataSource = seq;
                installments.DataBind();
            }

        }

        public void UpdateDetails(String loan)
        {
            try
            {
                NAV nav = new Config().ReturnNav();
                var loanDetails = nav.LoansProductSetUp.Where(r => r.Code == loan);
                foreach (var loandetail in loanDetails)
                {
                    String loanLimit = String.Format("{0:n}", Convert.ToDouble(loandetail.Max_Loan_Amount));
                    details.InnerHtml = "<tr><td>Loan Product</td><td>" + loandetail.Product_Description + "</td></tr>" +
                                        "<tr><td>Interest Rate</td><td>" + (loandetail.Interest_rate) / 12 + " % </td></tr>" +
                                        "<tr><td>Minimum Loan Amount</td><td>" + loandetail.Min_Loan_Amount +
                                        "</td></tr>" +
                                        "<tr><td>Maximum Installments</td><td>" + loandetail.No_of_Installment +
                                        "</td></tr>" +
                                        "<tr><td>Maximum Loan Amount</td><td>" + loanLimit + "</td></tr>" +
                                        "<tr><td>Repayment Method</td><td>" + loandetail.Repayment_Method + "</td></tr>" +
                                        "<tr><td>Repayment Frequency</td><td>" + loandetail.Repayment_Frequency +
                                        "</td></tr>";
                    
                }
            }
            catch (Exception ex)
            {
                SACCOFactory.ShowAlert("Connection Error! Try again later!");
            }
            
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {

            Double minimumAmount = 0, maximumAmount = 0, intrestRate = 0, myInstallments = 0;
            String repaymentMethod = "";
            String myLoanProduct = loanProduct.SelectedValue;
            NAV nav = new Config().ReturnNav();
            var loanDetails = nav.LoansProductSetUp.Where(r => r.Code == myLoanProduct);
            foreach (var loandetail in loanDetails)
            {
                minimumAmount = Convert.ToDouble(loandetail.Min_Loan_Amount);
                maximumAmount = Convert.ToDouble(loandetail.Max_Loan_Amount);
                intrestRate = Convert.ToDouble(loandetail.Interest_rate);
                repaymentMethod = loandetail.Repayment_Method;
            }
            myInstallments = Convert.ToDouble(installments.SelectedValue);
            Double myLoanAmount = Convert.ToDouble(loanAmount.Text.Trim());
            //lblError.InnerHtml = "";
            calculations.InnerHtml = "";
            if (minimumAmount < 1 && maximumAmount < 1)//no validation required
            {
                Calculate(repaymentMethod, myLoanAmount, intrestRate, myInstallments);
            }
            else if (myLoanAmount < minimumAmount)
            {
                //lblError.InnerHtml = "<div class='alert alert-danger'>The amount you entered is less than the minimum Amount<button class='close' data-dismiss='alert' type='button'>&times;</button></div>";
            }
            else if (myLoanAmount > maximumAmount)
            {
                //lblError.InnerHtml = "<div class='alert alert-danger'>The amount you entered is more than the maximum Amount<button class='close' data-dismiss='alert' type='button'>&times;</button></div>";
            }
            else
            {
                Calculate(repaymentMethod, myLoanAmount, intrestRate, myInstallments);
            }

        }



        public void Calculate(String newRepaymentMethod, Double newLoanAmount, Double newIntrestRate, Double newInstallments)
        {
            int count = 1;
            Double pmt = 0;
            DateTime date = DateTime.Now;
            date = date.AddMonths(1);
            Double interest = newIntrestRate / 100;
            Double intrest2 = 0;
            Double totalIntrest = 0;
            Double loanRepayment = 0, loanBalance = 0;

            String html = " <table class='table table-responsive table-striped table-bordered table-condensed'><tr><th>Period</th><th>Month-Year</th><th>Principle</th><th>Loan Repayment</th><th>Intrest</th><th>Total deduction</th><th>Loan Balance</th></tr>";
            if (newRepaymentMethod == "Amortised")
            {

                //  pmt = Financial.Pmt(interest, newInstallments, -newLoanAmount, 0, DueDate.EndOfPeriod);

                for (int p = 0; p < newInstallments; p++)
                {
                    intrest2 = pmt * interest;
                    totalIntrest += intrest2;
                    loanRepayment = pmt - (interest * newLoanAmount);
                    loanBalance = newLoanAmount - loanRepayment;

                    if (loanBalance < 1)
                    {
                        loanBalance = 0;
                    }
                    html += "<tr><td>" + count++ + "</td><td>" +
                            String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
                                date.Year) +
                            "</td><td>" + String.Format("{0:n}", newLoanAmount) + "</td><td>" + String.Format("{0:n}", loanRepayment) + "</td><td>" + String.Format("{0:n}", (interest * newLoanAmount)) + "</td><td>" + String.Format("{0:n}", (loanRepayment + (interest * newLoanAmount))) + "</td><td>" + String.Format("{0:n}", loanBalance) + "</td></tr>";
                    date = date.AddMonths(1);
                    newLoanAmount -= loanRepayment;

                }
            }
            else
            {
                pmt = newLoanAmount / newInstallments;
                intrest2 = pmt * interest;
                totalIntrest += intrest2;
                for (int p = 0; p < newInstallments; p++)
                {
                    intrest2 = pmt * interest;
                    totalIntrest += intrest2;
                    loanRepayment = pmt + intrest2;
                    loanBalance = newLoanAmount - pmt;

                    if (loanBalance < 1)
                    {
                        loanBalance = 0;
                    }

                    html += "<tr><td>" + count++ + "</td><td>" +
                            String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
                                date.Year) +
                            "</td><td>" + String.Format("{0:n}", newLoanAmount) + "</td><td>" + String.Format("{0:n}", loanRepayment) + "</td><td>" + String.Format("{0:n}", (interest * newLoanAmount)) + "</td><td>" + String.Format("{0:n}", (loanRepayment + (interest * newLoanAmount))) + "</td><td>" + String.Format("{0:n}", loanBalance) + "</td></tr>";


                    date = date.AddMonths(1);
                    newLoanAmount -= pmt;

                }

            }

            html = html + "</table>";
            calculations.InnerHtml = html;

        }
    }
}