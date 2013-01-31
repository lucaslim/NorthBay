using System;
using System.Web.UI;

namespace NorthBay.Web
{
    public partial class Error : Page
    {
        protected Exception ErrorData
        {
            get { return Server.GetLastError(); }
        }
    }
}