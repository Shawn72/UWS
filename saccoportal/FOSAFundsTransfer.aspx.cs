using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class TransferFunds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (session["username"] == null)
            //{
            //    response.redirect("default.aspx");
            //}
        }

        protected void ButtonFOSAFundsTransfer_Click(object sender, EventArgs e)
        {
            Response.Write("details submitted successfully");
        }
    }
}