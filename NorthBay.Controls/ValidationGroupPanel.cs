using System;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthBay.Controls
{
    /// <summary>
    /// Custom Validation Group Panel, this will set all controls with ValidationGroup Property with the same Validation Group Name
    /// </summary>
    [ToolboxData("<{0}:ValidationGroupPanel runat=server />")]
    public class ValidationGroupPanel : Panel
    {
        /// <summary>
        /// Set ValidationGroupName
        /// </summary>
        public string ValidationGroup { private get; set; }


        protected override void OnUnload(EventArgs e)
        {
            SetValidationGroup(this);

            base.OnUnload(e);
        }

        private void SetValidationGroup(Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                if (control.HasControls())
                    SetValidationGroup(control);

                PropertyInfo propertyInfo = control.GetType().GetProperty("ValidationGroup");

                //if control doesn't contain validation group, move on
                if (propertyInfo == null)
                    continue;

                //If validation group is set, ignore
                object propertyValue = propertyInfo.GetValue(control, null);

                if (propertyValue == null || string.IsNullOrEmpty(propertyValue.ToString()))
                    propertyInfo.SetValue(control, ValidationGroup, BindingFlags.SetProperty, null, null, null);
            }
        }
    }
}