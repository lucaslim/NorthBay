using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Utility;
using NorthBay.Utility.Configuration;

namespace NorthBay.Framework.Validation
{
    public static class ValidationImageHelper
    {
        public static Image GetImage(Control control, string errorMessage)
        {
            return new Image
                       {
                           ID = string.Format("img_{0}", control.ID),
                           ToolTip = errorMessage,
                           ImageUrl =
                               PageHelper.RelativePath(string.Format("{0}{1}", Config.IMAGE_PATH, "14x14_error.png"))
                       };
        }
    }
}