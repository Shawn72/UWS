using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using SACCOPortal.NavOData;
namespace SACCOPortal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        //decimal subTotal = 0;
        //decimal total = 0;
        //int subTotalRowIndex = 0;

        public NAV Nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
             new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
          if(!IsPostBack){ 
            if (Session["username"] == null)
            {
                Response.Redirect("~/Default.aspx");

            } 
             
            GetMemberDetails();
           //LoadMinistatement();

            NoOfGuanteedLoans();
            Loans();

            //loanDetails(nav);
            //FreeShares();

          }
        }
        protected void GetMemberDetails()
        {
            string year17 = Convert.ToString(2017);
            
            var memberdetails = Nav.MemberList.Where(r => r.No == Session["username"].ToString()).FirstOrDefault();
             
            if (memberdetails != null)
            {
                    memberNo.InnerHtml = memberdetails.No;
                    memberName.InnerHtml = memberdetails.Name;
                    accountCategory.InnerHtml = memberdetails.Account_Category;
                    emailAddress.InnerHtml = memberdetails.E_Mail;
                
                    currentsaving.InnerHtml = Convert.ToDecimal(memberdetails.Current_Savings).ToString("N2");
                    if (currentsaving.InnerHtml.StartsWith("-"))
                    {
                        currentsaving.InnerHtml = (-1 * Convert.ToDecimal(memberdetails.Current_Savings)).ToString("N2");
                    }

                    toutstandingloans.InnerHtml = Convert.ToDecimal(memberdetails.Total_Loans_Outstanding).ToString("N");
                    if (toutstandingloans.InnerHtml.StartsWith("-"))
                    {
                        toutstandingloans.InnerHtml = (-1 * Convert.ToDecimal(memberdetails.Total_Loans_Outstanding)).ToString("N");
                    }
                    totaldeposits.InnerHtml =
                        WSConfig.ObjNav.FnTotalDeposits(Session["username"].ToString(), year17).ToString("N2");

            }
           
        }

        protected void FreeShares()
        {
            //var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
            //Portals fShares = new Portals();
            //fShares.Credentials = credentials;
            //fShares.PreAuthenticate = true;
            //fShares.FnFreeShares(Session["username"].ToString());
            //Session["Shares"] = fShares.FnFreeShares(Session["username"].ToString());
            //lblfreeShares.Text = Session["Shares"].ToString();
        }

        protected void NoOfGuanteedLoans() {
            //var countGuarantors = nav.numberofgurantors.ToList().Where(r => r.Member_No == Session["username"].ToString()).ToList()
            //    .GroupBy(r => r.Member_No).Select(r => r.Key);          
            //    gLns.Text= countGuarantors.ToList().Count().ToString();
           
        }
        //protected void loanDetails( NAV nav) {
        //    var objLoans = nav.LoansR.ToList().Where(l => l.Client_Code == Session["username"].ToString());

        //    dispLoans.DataSource= objLoans.ToList().Select(r => new {LoanNumber=r.Loan_No, LoanType = r.Loan_Product_Type, OutstandingBal = r.Outstanding_Balance });
        //    dispLoans.AutoGenerateColumns = false;
        //    dispLoans.DataBind();

        //}

        protected void LoadMinistatement()
        {
            var finalList = new List<Statement>();
            foreach (var item in MiniStatement())
            {
                string[] ministmtArray = item.Split(new string[] { ":::" }, StringSplitOptions.None);
                finalList.Add(new Statement { Date = ministmtArray[0], Description = ministmtArray[1], Amount = ministmtArray[2] });
            }
            //gvMinistatement.DataSource = finalList;
            //gvMinistatement.AutoGenerateColumns = true;
            //gvMinistatement.DataBind();
        }

        public List<string> MiniStatement()
        {
            var ministmtList = new List<string>();
            try
            {
                string ministmt = WSConfig.ObjNav.MiniStatement(Session["username"].ToString());
                string[] ministmtArray = ministmt.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                ministmtList = ministmtArray.ToList();
                
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return ministmtList;
        }


        protected void Loans()
        {
            var gvLoans = Nav.LoansReg.Where(r => r.Client_Code == Session["username"].ToString() && r.Outstanding_Balance>0).ToList();
            ViewmyLoansList.DataSource = gvLoans;
            ViewmyLoansList.AutoGenerateColumns = false;
            ViewmyLoansList.AutoGenerateEditButton = false;
            ViewmyLoansList.DataBind();

        }
        //protected void dispLoans_DataBound(object sender, EventArgs e)
        //{
        //    for (int i = subTotalRowIndex; i < dispLoans.Rows.Count; i++)
        //    {
        //        total += Convert.ToDecimal(dispLoans.Rows[i].Cells[2].Text);
        //    }
        // this.AddTotalRow("Sub Total", subTotal.ToString("N2"));
        //    this.AddTotalRow("<h4><font color=black>Total Outstanding Balance:</font></h4>", total.ToString("N2"));
        //}

        //private void AddTotalRow(string labelText, string value)
        //{
        //    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal);
        //    row.BackColor = ColorTranslator.FromHtml("#F9F9F9");
        //    row.Cells.AddRange(new TableCell[3] { new TableCell (), //Empty Cell
        //                       new TableCell { Text = labelText, HorizontalAlign = HorizontalAlign.Right},
        //                       new TableCell { Text = value, HorizontalAlign = HorizontalAlign.Right } });
        //    dispLoans.Controls[0].Controls.Add(row);
        //}

        protected void changePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings");
        }
    }
    //protected void LoansList(NAV nav)
    //{
    //var objLoans = nav.LoansReg.Where(r => r.Client_Code == Session["username"].ToString()).ToList();
    //ViewmyLoansList.DataSource = objLoans;
    //GridViewmyLoansList.AutoGenerateColumns = false;
    //GridViewmyLoansList.AutoGenerateEditButton = false;
    //GridViewmyLoansList.DataBind();
    
   // }

    class Statement
    {
        public string Date { get; set; }
        public string Description { get; set; }
        public string Amount { get; set; }
        //public string currentShares { get; set; }
    }
}