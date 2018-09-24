using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Drawing;
using SACCOPortal.NAVWS;

namespace SACCOPortal
{
    public partial class FosaStatement : System.Web.UI.Page
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
                Response.Redirect("~/Default");
            }

            if (!IsPostBack)
            {
                FosaMultiview.SetActiveView(viewFosaStats);
                LoadFosaAccounts();

            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            //Session["account"] = ddFosaAccount.SelectedValue;
            //Response.Redirect("Reports?r=fs");
        }

        protected void LoadFosaAccounts()
        {
            //var objFosaAccount = navData.FosaAccounts.Where(r => r.BOSA_Account_No == Session["username"].ToString()).ToList();

            //ddFosaAccount.DataSource = objFosaAccount;
            //ddFosaAccount.DataTextField = "No";
            //ddFosaAccount.DataValueField = "No";
            //ddFosaAccount.DataBind();

            try
            {
                var fosaAcs = nav.FosaAccounts.ToList().Where(r => r.BOSA_Account_No == Session["username"].ToString())
                    .Select(r => new
                    {
                        Fosa_acc_No = r.No,
                        Fosa_acc_name = r.Name
                    });
                tblFosaAccs.AutoGenerateColumns = false;
                tblFosaAccs.DataSource = fosaAcs;
                tblFosaAccs.DataBind();

            }
            catch (Exception exception)
            {
              //  exception.Data.Clear();
            }




        }

        protected void tblFosaAccs_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Fosa_no"] = tblFosaAccs.SelectedRow.Cells[1].Text;
        }

        protected void btnCal_Click(object sender, EventArgs e)
        {
            viewStartDate.Visible = true;
        }

        protected void btnCal2_Click(object sender, EventArgs e)
        {
            viewEndDate.Visible = true;
        }

        protected void lnkViewStats_Click(object sender, EventArgs e)
        {

            try {
                var fosaNO = Session["Fosa_no"].ToString();
                FosaMultiview.SetActiveView(viewStatement);
                lblFosaAc.Text = fosaNO;
            }
            catch (Exception ex) {
                SACCOFactory.ShowAlert("Nothing selected!");
                return;
            }

        }

        protected void viewStartDate_DayRender(object sender, DayRenderEventArgs e)
        {

            if (e.Day.IsToday)
            {
                e.Cell.BackColor = Color.Green;
                e.Cell.BorderStyle = BorderStyle.Groove;
            }
            else if (e.Day.IsWeekend)
            {
                e.Cell.BackColor = Color.LightBlue;
            }
            else if (e.Day.IsSelected)
            {
                e.Cell.BackColor = Color.Blue;
            }
        }

        protected void viewEndDate_DayRender(object sender, DayRenderEventArgs e)
        {

        }

        protected void viewStartDate_SelectionChanged(object sender, EventArgs e)
        {
            txtSelStartDT.Text = viewStartDate.SelectedDate.ToString("MM/dd/yy");
            DateTime dTe = Convert.ToDateTime(txtSelStartDT.Text);
            viewStartDate.Visible = false;
        }

        protected void viewEndDate_SelectionChanged(object sender, EventArgs e)
        {

            DateTime dTOne = Convert.ToDateTime(txtSelStartDT.Text);

            txtSelEndDT.Text = viewEndDate.SelectedDate.ToString("MM/dd/yy");
            DateTime dTe = Convert.ToDateTime(txtSelEndDT.Text);
            viewEndDate.Visible = false;

            if (dTe<dTOne) {
                SACCOFactory.ShowAlert("Select a date GREATER than start date");
                txtSelEndDT.Text = "";
                return;

            }
            //else if (!string.IsNullOrEmpty(txtSelEndDT.Text))
            //{


            //}
            //else {
            //    SACCOFactory.ShowAlert("Wrong!");
            //}

        }

        protected void btnViewFState_Click(object sender, EventArgs e)
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");

            string dt1dt2 = txtSelStartDT.Text.ToString() + ".." + txtSelEndDT.Text.ToString();
            
            WSConfig.ObjNav.FnFosaStatement(lblFosaAc.Text, String.Format("FOSA STATEMENT_{0}.pdf", filename), dt1dt2);

            pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("FOSA STATEMENT_{0}.pdf", filename, dt1dt2)));

        }
    }
}