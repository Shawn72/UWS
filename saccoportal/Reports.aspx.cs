using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Diagnostics;
using System.IO;
using System.Web.Hosting;

namespace SACCOPortal
{
    public partial class Reports : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
            new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                LoadLoans();
            }
            if (Request.QueryString["r"] == "ms")
            {
                PrintMemberStatement();
            }
            if (Request.QueryString["r"] == "ds")
            {
                PrintDepositsStatement();
            }
            //if (Request.QueryString["r"] == "ls")
            //{
            //    LoadLoans(nav, ddlLoanStatement);
            //}
            if (Request.QueryString["r"] == "lg")
            {
                PrintLoanGuranteedStatement();
            }
            if (Request.QueryString["r"] == "lo")
            {
                PrintLoanGurantortatement();
            }
           
        }


        public void PrintMemberStatement()
        {
            //var filename = Session["username"].ToString().Replace(@"/", @"");
            //try
            //{
            //    WSConfig.ObjNav.FnMemberStatement(Session["username"].ToString(),String.Format("MEMBER STATEMENT_{0}.pdf", filename));
            //    copycat();
            //    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("MEMBER STATEMENT_{0}.pdf", filename)));


            //}
            //catch (Exception exception)
            //{
            //    exception.Data.Clear();
            //}

            var filenameMs = Session["username"].ToString().Replace(@"/", @"");
            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnMemberStatement(Session["username"].ToString(), ref returnstring);
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("MEMBER STATEMENT_{0}.pdf", filenameMs));
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                FileStream stream = new FileStream(path, FileMode.CreateNew);
                BinaryWriter writer = new BinaryWriter(stream);
                writer.Write(bytes, 0, bytes.Length);
                writer.Close();

                Response.ContentType = "application/pdf";
                if (path != null)Response.TransmitFile(path.ToString());
            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        public void PrintLoansStatement(string loanNo)
        {
            //var filename = Session["username"].ToString().Replace(@"/", @"");
            //try
            //{
            //    WSConfig.ObjNav.FnGetLoanStatement(loanNo, String.Format("LOAN STATEMENT_{0}.pdf", filename), Session["username"].ToString());

            //}
            //catch (Exception exception)
            //{
            //    exception.Data.Clear();
            //}

            var filenameMs = Session["username"].ToString().Replace(@"/", @"");
            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnLoanStatement(loanNo, ref returnstring, Session["username"].ToString());
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("LOAN STATEMENT_{0}.pdf", filenameMs));
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
    
        public void PrintLoanGuranteedStatement()
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");
            try
            {
                WSConfig.ObjNav.FnLoanGuranteed(Session["username"].ToString(), String.Format("LOANS GUARANTEED_{0}.pdf", filename));
                copycat();
                pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOANS GUARANTEED_{0}.pdf", filename)));

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        public void PrintDepositsStatement() {
            //var filename = Session["username"].ToString().Replace(@"/", @"");
            //try
            //{
            //    WSConfig.ObjNav.FnDepositsStatement(Session["username"].ToString(), String.Format("DEPOSITS STATEMENT_{0}.pdf", filename));
            //    copycat();
            //    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("DEPOSITS STATEMENT_{0}.pdf", filename)));

            //}
            //catch (Exception exception)
            //{
            //    exception.Data.Clear();
            //}

            var filenameDs = Session["username"].ToString().Replace(@"/", @"");
            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnDepositsStatement(Session["username"].ToString(), ref returnstring);
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("DEPOSITS STATEMENT_{0}.pdf", filenameDs));
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

        public void PrintLoanGurantortatement()
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");
            try
            {
                WSConfig.ObjNav.FnLoanGurantorsReport(Session["username"].ToString(), String.Format("LOAN GUARANTORS_{0}.pdf", filename));
               pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN GUARANTORS_{0}.pdf", filename)));

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }
        
        protected void btnView_Click(object sender, EventArgs e)
        {
            var loansNumber = ddlLoanStatement.SelectedValue;
            if (ddlLoanStatement.SelectedIndex == 0)
            {
              SACCOFactory.ShowAlert("Please select a valid Loan");
              return;
            }
            var filename = Session["username"].ToString().Replace(@"/", @"");
            try
            {
              PrintLoansStatement(loansNumber);
              pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN STATEMENT_{0}.pdf", filename)));
                SACCOFactory.ShowAlert(loansNumber);
            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }

        }

       public void LoadLoans()
       {
            //Loan_Product_Type
            var objFosaAccount = nav.LoansReg
                .ToList().Where( n => n.Client_Code == Session["username"].ToString() && n.Outstanding_Balance>0);
            ddlLoanStatement.DataSource = objFosaAccount;
            ddlLoanStatement.DataTextField = "Loan_Product_Type_Name";
            ddlLoanStatement.DataValueField = "Loan_Product_Type";
            ddlLoanStatement.DataBind();
            ddlLoanStatement.Items.Insert(0, "--select loan--");
        }

        private void CopyFile(string fname)
        {
            try
            {

                var filename = fname;
                Process objProcess = new Process();
                objProcess.StartInfo.FileName = ConfigurationManager.AppSettings["SRC_FILE"];
                objProcess.StartInfo.Arguments = fname;
                objProcess.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                objProcess.Start();
                objProcess.WaitForExit();
                objProcess.Dispose();

            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
        }

        protected void copycat() {
            try
            {
                Process objProcess = new Process();
                objProcess.StartInfo.FileName = ConfigurationManager.AppSettings["SRC_FILE"];
                objProcess.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                objProcess.Start();
                objProcess.WaitForExit();
                objProcess.Dispose();

            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
        }
    }
}