using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.ImageGallery;
using NorthBay.Framework.Database;
using NorthBay.Utility;

namespace NorthBay.Web.ImageGallery
{
    public partial class Default : Basepage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImageGalleryClass objImgGal = new ImageGalleryClass();
            GridView1.DataSource = objImgGal.getgallery();
            GridView1.DataBind();
        }
    }
}