using System.Web.UI.WebControls;

namespace NorthBay.Framework.Querying
{
    public class SortHelper
    {
        public static string GetDirection(SortDirection sortDirection)
        {
            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    return "OrderBy";
                case SortDirection.Descending:
                    return "OrderByDescending";
                default:
                    return null;
            }
        }
    }
}