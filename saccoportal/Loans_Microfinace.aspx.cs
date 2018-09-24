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
    public partial class Loans_Microfinace : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
          new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
              ConfigurationManager.AppSettings["DOMAIN"])
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Default");

                }
                else
                {
                    loadMicroLoans();
                }
            }
        }

        protected void loadMicroLoans()
        {

            var objMicroLoan = nav.LoansR.ToList().Where(n => n.BOSA_No == Session["username"].ToString() && n.Source == "MICRO");

            ddRepaidMicrofinance.DataSource = objMicroLoan;
            ddRepaidMicrofinance.DataTextField = "Loan_No";
            ddRepaidMicrofinance.DataValueField = "Loan_No";
            ddRepaidMicrofinance.DataBind();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");
            try
            {
                WSConfig.ObjNav.FnLoanRepaymentShedule(ddRepaidMicrofinance.SelectedValue, String.Format("MF REPAYMENT SCHEDULE_{0}.pdf", filename));
                //CopyFile(ConfigurationManager.AppSettings["SRC_FILE"] + String.Format("PAYSLIP{0}.pdf", filename), ConfigurationManager.AppSettings["DEST_FILE"] + String.Format("PAYSLIP{0}.pdf", filename));
                pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("MF REPAYMENT SCHEDULE_{0}.pdf", filename)));

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }
    }
}