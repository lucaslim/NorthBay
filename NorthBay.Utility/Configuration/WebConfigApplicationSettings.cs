using System.Configuration;

namespace NorthBay.Utility.Configuration
{
    public static class WebConfigApplicationSettings
    {
        /// <summary>
        /// Get Date Format from Web.config
        /// </summary>
        public static string DateFormat
        {
            get { return ConfigurationManager.AppSettings["DateFormat"]; }
        }

        /// <summary>
        /// Get Time Format from Web.config
        /// </summary>
        public static string TimeFormat
        {
            get { return ConfigurationManager.AppSettings["TimeFormat"]; }
        }
    }
}