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
    public partial class MyLoansList : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            showLoans(nav);
        }
        protected void showLoans(NAV navData)
        {
            var objLoans = navData.LoansReg.Where(r => r.Client_Code == Session["username"].ToString()).ToList();
            GridViewmyLoansList.DataSource = objLoans;
            GridViewmyLoansList.AutoGenerateColumns = false;
            GridViewmyLoansList.AutoGenerateEditButton = false;
            GridViewmyLoansList.DataBind();
        }
    }
}