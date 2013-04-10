using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Add_doctor;

namespace NorthBay.Web.Doctor
{
    public partial class profile : Basepage
    {
        add_doctorClass obj = new add_doctorClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            grd_all.DataSource = obj.getDoctors();
            grd_all.DataBind();
        }
    }
}