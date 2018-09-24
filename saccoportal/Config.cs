﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;

namespace SACCOPortal
{

    public class Config
    {

        public NAV ReturnNav()
        {

            NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
            {
                Credentials =
                    new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                        ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"])
            };
            return nav;
        }



            public static Portals ObjNav
        {
            get
            {
                var ws = new Portals();

                try
                {
                    var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                        ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
                    ws.Credentials = credentials;
                    ws.PreAuthenticate = true;

                }
                catch (Exception ex)
                {
                    ex.Data.Clear();
                }
                return ws;
            }
        }


    }
}