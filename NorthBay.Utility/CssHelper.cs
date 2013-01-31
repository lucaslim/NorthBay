using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using NorthBay.Utility.Configuration;

namespace NorthBay.Utility
{
    public class CssHelper
    {
        private readonly List<string> _arrCss;
        private readonly Page _page;

        public CssHelper(Page page)
        {
            _arrCss = new List<string>();
            _page = page;
        }

        /// <summary>
        /// Add array of javascript to array
        /// </summary>
        /// <param name="arrCss"></param>
        public void AddCss(IEnumerable<string> arrCss)
        {
            _arrCss.AddRange(arrCss);
        }

        /// <summary>
        /// Add javascript to array
        /// </summary>
        /// <param name="css"></param>
        public void AddCss(string css)
        {
            _arrCss.Add(css);
        }

        public bool LoadCss()
        {
            if (_page == null)
                return false;

            foreach (string css in _arrCss.Distinct())
            {
                var control = new HtmlLink();
                control.Attributes.Add("href", PageHelper.AbsolutePath(string.Format("{0}{1}", Config.CSS_PATH, css)));
                control.Attributes.Add("type", "text/css");
                control.Attributes.Add("rel", "stylesheet");
                _page.Header.Controls.Add(control);
            }

            return true;
        }
    }
}