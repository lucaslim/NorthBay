using System.Web;

namespace NorthBay.Utility
{
    public static class QueryHelper
    {
        public static string GetQueryString(string query)
        {
            return HttpContext.Current.Request.QueryString[query];
        }
    }
}
