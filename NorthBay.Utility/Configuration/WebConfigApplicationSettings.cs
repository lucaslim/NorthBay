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

        public static decimal Tax
        {
            get
            {
                var objTax = TextHelper.ToDecimal(ConfigurationManager.AppSettings["Tax"]);

                if (objTax == null)
                    return 0;
                return (decimal)objTax;
            }
        }
    }
}