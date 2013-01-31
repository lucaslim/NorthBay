using System.Reflection;
using System.Web;

namespace NorthBay.Framework.Querying
{
    public static class PropertyInfoHelper
    {
        /// <summary>
        /// Using reflection to get the property info base on class TEntity
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="target"></param>
        /// <returns></returns>
        public static PropertyInfo GetInfo<TEntity>(string target) where TEntity : class
        {
            //Using reflection to get the property info
            PropertyInfo propertyInfo = typeof (TEntity).GetProperty(target);

            if (propertyInfo == null)
                throw new HttpUnhandledException("Property not found.");
            return propertyInfo;
        }
    }
}