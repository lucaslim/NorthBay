using System;
using NorthBay.Utility.Configuration;

namespace NorthBay.Utility
{
    public static class TextHelper
    {
        /// <summary>
        /// Convert object value to String, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string ToString(object obj)
        {
            return obj == null ? null : Convert.ToString(obj);
        }

        /// <summary>
        /// Convert object value to Integer, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int? ToInteger(object obj)
        {
            //check to see if object is null
            if (obj == null)
                return null;

            int @int;
            //check to see if string is an integer
            if (Int32.TryParse(Convert.ToString(obj), out @int))
                return @int;

            return null;
        }

        /// <summary>
        /// Convert object value to Double, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static double? ToDouble(object obj)
        {
            //check to see if object is null
            if (obj == null)
                return null;

            double @double;
            //check to see if string is a double
            if (Double.TryParse(Convert.ToString(obj), out @double))
                return @double;

            return null;
        }

        /// <summary>
        /// Convert object value to Decimal, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static decimal? ToDecimal(object obj)
        {
            //check to see if object is null
            if (obj == null)
                return null;

            decimal @decimal;
            //check to see if string is a double
            if (Decimal.TryParse(Convert.ToString(obj), out @decimal))
                return @decimal;

            return null;
        }

        /// <summary>
        /// Convert object value to Boolean, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static bool? ToBool(object obj)
        {
            //check to see if object is null
            if (obj == null)
                return null;

            bool @bool;
            //check to see if string is a boolean
            if (Boolean.TryParse(Convert.ToString(obj), out @bool))
                return @bool;

            return null;
        }

        /// <summary>
        /// Convert object value to DateTime, return null if fails.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static DateTime? ToDateTime(object obj)
        {
            //check to see if object is null
            if (obj == null)
                return null;

            DateTime @dateTime;
            //check to see if string is a valid date base on format
            if (DateTime.TryParse(ToString(obj), out @dateTime))
                return @dateTime;

            return null;
        }

        /// <summary>
        /// Format date to based on web.config dateformat
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string FormatDate(object obj)
        {
            DateTime? dateTime = null;

            if (obj is string)
                dateTime = ToDateTime(obj);
            else if (obj is DateTime)
                dateTime = (DateTime) obj;


            return dateTime == null
                       ? string.Empty
                       : ((DateTime) dateTime).ToString(WebConfigApplicationSettings.DateFormat);
        }
    }
}