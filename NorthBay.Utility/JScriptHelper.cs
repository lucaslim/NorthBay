using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using NorthBay.Utility.Configuration;

namespace NorthBay.Utility
{
    public class JScriptHelper
    {
        private readonly List<string> _arrJScript;
        private readonly Page _page;

        public JScriptHelper(Page page)
        {
            _arrJScript = new List<string>();
            _page = page;
        }

        /// <summary>
        /// Add array of javascript to array
        /// </summary>
        /// <param name="arrScripts"></param>
        public void AddScript(IEnumerable<string> arrScripts)
        {
            _arrJScript.AddRange(arrScripts);
        }

        /// <summary>
        /// Add javascript to array
        /// </summary>
        /// <param name="script"></param>
        public void AddScript(string script)
        {
            _arrJScript.Add(script);
        }

        public bool LoadScript()
        {
            if (_page == null)
                return false;

            foreach (string script in _arrJScript.Distinct())
            {
                var control = new HtmlGenericControl("script");
                control.Attributes.Add("type", "text/javascript");
                control.Attributes.Add("src",
                                       PageHelper.AbsolutePath(string.Format("{0}{1}", Config.JS_SCRIPT_PATH, script)));
                _page.Header.Controls.Add(control);
            }

            return true;
        }
    }
}