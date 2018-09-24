using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Configuration;
using System.Net;

namespace SACCOPortal
{
    public partial class profile : System.Web.UI.Page
    {
        public NAV Nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
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
                GetMemberDetails();
                LoadKinsData(Nav);
                LoadBeneficiaryData(Nav);
            }

        }

        protected void GetMemberDetails()
        {
            string year17 = Convert.ToString(2017);

            var memberdetails = Nav.MemberList.Where(r => r.No == Session["username"].ToString()).FirstOrDefault();

            if (memberdetails != null)
            {
                memberName.InnerHtml = memberdetails.Name;
                accountCategory.InnerHtml = memberdetails.Account_Category;
                emailAddress.InnerHtml = memberdetails.E_Mail;

                currentsaving.InnerHtml = Convert.ToDecimal(memberdetails.Current_Savings).ToString("N2");
                if (currentsaving.InnerHtml.StartsWith("-"))
                {
                    currentsaving.InnerHtml = (-1 * Convert.ToDecimal(memberdetails.Current_Savings)).ToString("N2");
                }

                toutstandinginterest.InnerHtml = Convert.ToDecimal(memberdetails.Outstanding_Interest).ToString("N");
                if (toutstandinginterest.InnerHtml.StartsWith("-"))
                {
                    toutstandinginterest.InnerHtml = (-1 * Convert.ToDecimal(memberdetails.Total_Loans_Outstanding)).ToString("N");
                }
                totaldeposits.InnerHtml =
                    WSConfig.ObjNav.FnTotalDeposits(Session["username"].ToString(), year17).ToString("N2");

            }

        }
        protected void LoadKinsData(NAV navData)
        {
            var objKins = navData.KeensDetails.Where(r => r.Account_No == Session["username"].ToString() && r.Beneficiary == false).ToList();
            gvKins.DataSource = objKins;
            gvKins.AutoGenerateColumns = false;
            gvKins.DataBind();
        }
        protected void LoadBeneficiaryData(NAV navData)
        {
            var objBeneficiary = navData.KeensDetails.Where(r => r.Account_No == Session["username"].ToString() && r.Beneficiary == true).ToList();

            GvBeneficiary.DataSource = objBeneficiary;
            GvBeneficiary.AutoGenerateColumns = false;
            GvBeneficiary.DataBind();
        }
        
    }

}