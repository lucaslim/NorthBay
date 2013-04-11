using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Pharmacy;
using NorthBay.Utility;

namespace NorthBay.Web.Pharmacy
{
    public partial class Default : Basepage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Medicine objMedicine = new Medicine();
            dtlView.DataSource = objMedicine.SelectAll();
            dtlView.DataBind();
        }
    }
}