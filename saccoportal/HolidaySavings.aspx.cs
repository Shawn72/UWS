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
using SACCOPortal.NavOData;

namespace SACCOPortal
{
    public partial class HolidaySavings : System.Web.UI.Page
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
                    holdMultiview.SetActiveView(viewHoldStats);
                    loadHoldSave();
                }
            }



        }
        protected void loadHoldSave()
        {

            try
            {
                var holAcs = nav.MemberList.ToList().Where(n => n.No == Session["username"].ToString() && n.Holiday_Savings!=0)
                    .Select(r => new
                    {
                        AcNo = r.No,
                        AcName = r.Name,
                        AcHoliday_Savings=r.Holiday_Savings
                    });
                tblFosaAccs.AutoGenerateColumns = false;
                tblFosaAccs.DataSource = holAcs;
                tblFosaAccs.DataBind();

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        protected void tblFosaAccs_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["holAc_no"] = tblFosaAccs.SelectedRow.Cells[1].Text;

            var filenameHs = Session["holAc_no"].ToString().Replace(@"/", @"");

            var holAcno = Session["holAc_no"].ToString();

            //try
            //{

                
            //    holdMultiview.SetActiveView(viewStatement);

            //  //  WSConfig.ObjNav.FnHolidayStatement(HolACNO, String.Format("HOLIDAY_STATEMENT_{0}.pdf", filename));

            //    pdfR.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("HOLIDAY_STATEMENT_{0}.pdf", filename)));


            //}
            //catch (Exception ex)
            //{
            //    SACCOFactory.ShowAlert("Unknown error!");
            //    return;
            //}

            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnHolidayStatement(holAcno, ref returnstring);
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("HOLIDAY_STATEMENT_{0}.pdf", filenameHs));
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