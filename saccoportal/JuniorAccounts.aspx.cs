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
    public partial class Loans_FOSA : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
           new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
               ConfigurationManager.AppSettings["DOMAIN"])
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else
                {
                    FosaMultiview.SetActiveView(viewFosaStats);
                    LoadJunior();
                }
            }
        }

        protected void LoadJunior() {

            try
            {
                var juniorAcs = nav.juniors.ToList().Where(n => n.Parent_Membership_No == Session["username"].ToString() && n.Account_Category == "Junior")
                    .Select(r => new
                    {
                        junior_acc_No = r.No,
                        junior_acc_name = r.Name
                    });
                tblFosaAccs.AutoGenerateColumns = false;
                tblFosaAccs.DataSource = juniorAcs;
                tblFosaAccs.DataBind();

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        protected void tblFosaAccs_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["juniorAc_no"] = tblFosaAccs.SelectedRow.Cells[1].Text;

            var filenameJa = Session["juniorAc_no"].ToString().Replace(@"/", @"");
            var jAcno = Session["juniorAc_no"].ToString();

            //   try
            //   {

            //   var jAcno = Session["juniorAc_no"].ToString();
            //   FosaMultiview.SetActiveView(viewStatement);

            ////  WSConfig.ObjNav.FnMemberStatement(jACNO, String.Format("JUNIOR_STATEMENT_{0}.pdf", filename));

            //   pdfR.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("JUNIOR_STATEMENT_{0}.pdf", filenameJa)));


            //   }
            //   catch (Exception ex)
            //   {
            //       SACCOFactory.ShowAlert("Unknown error!");
            //       return;
            //   }



            try
            {

                string returnstring = "";
                WSConfig.ObjNav.FnMemberStatement(jAcno, ref returnstring);
                byte[] bytes = Convert.FromBase64String(returnstring);
                var path = HostingEnvironment.MapPath(@"~/Downloads/" + String.Format("JUNIOR_ STATEMENT_{0}.pdf", filenameJa));
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