using SACCOPortal.NavOData;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class LoanTypes : System.Web.UI.Page
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
                    Response.Redirect("~/Default.aspx");

                }
                else {
                    LoadBosaLoans();
                }
                
            }
        }

        protected void LoadBosaLoans()
        {

            var objBosaLoan = nav.LoansReg.ToList().Where(n => n.Client_Code == Session["username"].ToString() && n.Outstanding_Balance>0).ToList();

            ddRepaidBOSA.DataSource = objBosaLoan;
            ddRepaidBOSA.DataTextField = "Loan_Product_Type_Name";
            ddRepaidBOSA.DataValueField = "Loan_No";
            ddRepaidBOSA.DataBind();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            //var filename = Session["username"].ToString().Replace(@"/", @"");
            //try
            //{
            // WSConfig.ObjNav.FnLoanRepaymentShedule(ddRepaidBOSA.SelectedValue, String.Format("BOSA REPAYMENT SCHEDULE_{0}.pdf", filename));
            //    //CopyFile(ConfigurationManager.AppSettings["SRC_FILE"] + String.Format("PAYSLIP{0}.pdf", filename), ConfigurationManager.AppSettings["DEST_FILE"] + String.Format("PAYSLIP{0}.pdf", filename));
            //    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("BOSA REPAYMENT SCHEDULE_{0}.pdf", filename)));

            //}
            //catch (Exception exception)
            //{
            //    exception.Data.Clear();
            //}


            var filenameRs = Session["username"].ToString().Replace(@"/", @"");
            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnLoanRepaymentShedule(ddRepaidBOSA.SelectedValue, ref returnstring);
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("BOSA REPAYMENT SCHEDULE_{0}.pdf", filenameRs));
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                FileStream stream = new FileStream(path, FileMode.CreateNew);
                BinaryWriter writer = new BinaryWriter(stream);
                writer.Write(bytes, 0, bytes.Length);
                writer.Close();

                Response.ContentType = "application/pdf";
                if (path != null) Response.TransmitFile(path.ToString());
            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }
    }
}