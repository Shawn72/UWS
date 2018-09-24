using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class NewLoanApplication : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };

        public int source = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null){
                Response.Redirect("Default.aspx");
            }
            if(IsPostBack){
            

            }
            //ddlLoanProduct.Visible = false;
            ddlLoanPurpose.SelectedIndex = 0;
            ddlLoanPurpose.Items.Clear();
            LoadLoanPurposes(nav, ddlLoanPurpose);
            

        }

        protected void ddlLoanType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            ddlLoanProduct.Visible = true;
            ddlLoanProduct.SelectedIndex = 0;
            ddlLoanProduct.Items.Clear();
            LoadLoanProducts(nav, ddlLoanProduct);

            string selLtype = ddlLoanType.SelectedItem.Text;

            if (selLtype.Equals("...select loan type...."))
            {
                SACCOFactory.ShowAlert("Invalid selection, select again");
            }
            else if(selLtype.Equals("FOSA Loan"))
            {
                source = 0;
            }
            else if (selLtype.Equals("BOSA Loan"))
            {
                source = 1;
            }
            else
            {
                source = 2;
            }

        }
        protected void LoadLoanProducts(NAV navData, DropDownList ddlProduct)
        {
            var objNav = navData.LoanSetup.Where(r =>r.Source == ddlLoanType.SelectedValue).ToList();
            ddlProduct.DataSource = objNav;
            ddlProduct.DataTextField = "Product_Description";
            ddlProduct.DataValueField = "Code";
            ddlProduct.DataBind();

           

            
        }
        protected void LoadLoanPurposes(NAV navData, DropDownList dlistLoanPurpose)
        {
            var lonPurposes = navData.LoansPurpose.ToList();
            dlistLoanPurpose.DataSource = lonPurposes;
            dlistLoanPurpose.DataTextField = "Code";
            dlistLoanPurpose.DataValueField = "Code";
            dlistLoanPurpose.DataBind();
        }

        protected void ddlLoanProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillLoanDetails(nav);
        }
        protected void FillLoanDetails(NAV navData)
        {
            var repaymentPeriod = navData.LoanSetup.Where(r => r.Code == ddlLoanProduct.SelectedValue).Select(r => r.No_of_Installment).SingleOrDefault();
            var MaxLoanAmnt = navData.LoanSetup.Where(r => r.Code == ddlLoanProduct.SelectedValue).Select(r => r.Max_Loan_Amount).SingleOrDefault();
            var repaymentMethod = navData.LoanSetup.Where(r => r.Code == ddlLoanProduct.SelectedValue).Select(r => r.Repayment_Method).SingleOrDefault();

            TxtBxMaxLoanAmnt.Text = MaxLoanAmnt.ToString();
            txtBxRepaymentPeriod.Text = repaymentPeriod.ToString();
            TxtBxRepaymntMthd.Text = repaymentMethod.ToString();


        }


        protected void TxtBxBasicSalo_TextChanged(object sender, EventArgs e)
        {
            FillMonthlyRepayments();
        }
        protected void FillMonthlyRepayments()
        {
            double LAmnt = Convert.ToDouble(TxtBxBasicSalo.Text);

            double monthlyPayment = 0.05 * LAmnt;

            TxtBoxMonthlyRepayment.Text = monthlyPayment.ToString();
        }

        protected void BtnLoanApplication_Click(object sender, EventArgs e)
        {
            SubmitLoan();
        }
        protected void SubmitLoan(){
            string memberNo = Session["username"].ToString();
            string lnProdType = ddlLoanProduct.SelectedValue;

            decimal lnAmnt = Convert.ToDecimal(txtBxLnAmnt.Text);
            string lnPurpose = ddlLoanPurpose.SelectedValue;
            int modOfDisbursmnt = Convert.ToInt32(ddlModeOfDisbursement.SelectedValue);
            int RepaymentFrq = Convert.ToInt32(ddlRepymntFreq.SelectedValue);
            decimal basicPay = Convert.ToDecimal(TxtBxBasicSalo.Text);
            decimal netPay = Convert.ToDecimal(txtBoxNetSalo.Text);
            decimal grossPay = Convert.ToDecimal(TxtBxGrossPay.Text);
            decimal hseAllwance = Convert.ToDecimal(TxtBxHouseAllowance.Text);
            decimal busFareAllwance = Convert.ToDecimal(TxtBxBusFareAllowance.Text);
            //decimal responsibilityAllwance = Convert.ToDecimal(TxtBxResponsibilityAllowances.Text);
            decimal otherIncome = Convert.ToDecimal(TxtBxOtherAllowances.Text);
            decimal NHIF =0;

            string response = WSConfig.ObjNav.FnLoanApplication(memberNo,lnProdType,lnAmnt,lnPurpose,modOfDisbursmnt, RepaymentFrq,basicPay, netPay, hseAllwance, grossPay,busFareAllwance, otherIncome, NHIF,source);
            if (response == "SUCCESS")
            {
                SACCOFactory.ShowAlert("Loan application successful");
                Response.Redirect("MyLoansList.aspx");
            }
        }

    }
}