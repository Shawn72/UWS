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
    public partial class Deposits : System.Web.UI.Page
    {
        public static string action { get; set; }
       
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
            if(!IsPostBack){
                populateDeposists(nav,ddlDespositsAcc);
            }

        }
        protected void populateDeposists(NAV navData, DropDownList ddlist)
        {
            var srcAcc = navData.MemberList.Where(r => r.No == Session["username"].ToString()).ToList();
            ddlist.DataSource = srcAcc;
            ddlist.DataTextField="Name";
            ddlist.DataValueField="FOSA_Account_No";
            ddlist.DataBind();
           
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
            var initAmnt = navData.MemberList.Where(r => r.No == Session["username"].ToString()).Select(r => r.Monthly_Contribution).SingleOrDefault();

            string myTest = String.Format("{0:#,###,###.##}", initAmnt);
            txtBoxDpstAmnt.Text = myTest;
            txtBoxDpstAmnt.Enabled = false;
            
        }

        protected void stadingOrderbtn_Click(object sender, EventArgs e)
        {
            
            updateMonthlyContributions();
        }
        protected void updateMonthlyContributions( )
        {
            string MbrNo = Session["username"].ToString();
            string accNo = ddlDespositsAcc.SelectedValue;
            decimal amnt = Convert.ToDecimal(txBxNewDpstAmnt.Text);
            WSConfig.ObjNav.FnUpdateMonthlyContrib(MbrNo,amnt);
            SACCOFactory.ShowAlert("Monthly contributions successfully updated.");
        }
    }
}