using System.Security.Cryptography;
using System.Text;

namespace NorthBay.Framework.Security
{
    /// <summary>
    /// Summary description for Security
    /// </summary>
    public class SecurityHelper
    {
        /// <summary>
        /// Return hash string of input value. Mainly use for password
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string Hash(string value)
        {
            //Create instance of MD5;
            MD5 md5 = MD5.Create();

            //convert to bytes array
            byte[] hash = md5.ComputeHash(Encoding.Default.GetBytes(string.Format("{0}:{1}", value, SecurityKeys.SALT)));

            var sb = new StringBuilder();

            foreach (byte bytes in hash)
            {
                sb.Append(bytes.ToString("x2"));
            }

            //return encoded hash value
            return sb.ToString().ToUpper();
        }
    }
}