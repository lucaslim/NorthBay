using System.IO;
using System.Web;

namespace NorthBay.Utility
{
    public class FileHelper
    {
        /// <summary>
        /// Check if file exists
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool IsFileExists(string file)
        {
            var fileInfo = new FileInfo(MapPath(file));

            return fileInfo.Exists;
        }

        /// <summary>
        /// Create Directory
        /// </summary>
        /// <param name="file"></param>
        public static void CreateDirectory(string file)
        {
            var fileInfo = new FileInfo(MapPath(file));

            if (fileInfo.DirectoryName != null) 
                Directory.CreateDirectory(fileInfo.DirectoryName);
        }

        /// <summary>
        /// Map to server path
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        private static string MapPath(string file)
        {
            return HttpContext.Current.Server.MapPath(file);
        }

    }
}
