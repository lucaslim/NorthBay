using System.Web;

namespace NorthBay.Utility
{
    public static class PageHelper
    {
        /// <summary>
        /// Returns absolute path
        /// </summary>
        /// <example>AbsolutePath("~/Default.aspx")</example>
        /// <param name="url"></param>
        /// <returns>/Test/Default.aspx</returns>
        public static string AbsolutePath(string url)
        {
            return VirtualPathUtility.ToAbsolute(url);
        }

        /// <summary>
        /// Returns relative path
        /// </summary>
        /// <example>AbsolutePath("~/Default.aspx")</example>
        /// <param name="url"></param>
        /// <returns>~/Test/Default.aspx</returns>
        public static string RelativePath(string url)
        {
            return VirtualPathUtility.ToAppRelative(url);
        }

        /// <summary>
        /// Returns url to server path
        /// </summary>
        /// <example>MapPath("~/Default.aspx")</example>
        /// <param name="url"></param>
        /// <returns>C:\inetpub\wwwroot\NorthBay\Test\Default.aspx</returns>
        public static string MapPath(string url)
        {
            return HttpContext.Current.Request.MapPath(url);
        }

        /// <summary>
        /// Redirect to page
        /// </summary>
        /// <param name="url"></param>
        public static void Redirect(string url)
        {
            HttpContext.Current.Response.Redirect(url);
        }
    }
}