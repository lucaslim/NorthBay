using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Framework.Validation;

namespace NorthBay.Controls
{
    /// <summary>
    /// Custom Drop down list box with validation in place. Set the first item value to "-1" if Required is True
    /// </summary>
    [ToolboxData("<{0}:DropDownList runat=server />")]
    public class DropDownList : System.Web.UI.WebControls.DropDownList
    {
        private RequiredFieldValidator _requiredFieldValidator;

        /// <summary>
        /// Set if field is mandatory
        /// </summary>
        public bool Required { private get; set; }

        /// <summary>
        /// Set title of this field
        /// </summary>
        public string Title { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            _requiredFieldValidator = new RequiredFieldValidator
                                          {
                                              ID = string.Format("{0}_rfv", base.ID),
                                              ControlToValidate = base.ID,
                                              Enabled = Required,
                                              Visible = Required,
                                              InitialValue = "-1",
                                              ErrorMessage = string.Format("Please select an item."),
                                              Display = ValidatorDisplay.Dynamic,
                                              ValidationGroup = base.ValidationGroup
                                          };

            _requiredFieldValidator.Controls.Add(new Literal {Text = "&nbsp;"});
            //Add error image
            _requiredFieldValidator.Controls.Add(ValidationImageHelper.GetImage(_requiredFieldValidator,
                                                                                _requiredFieldValidator.ErrorMessage));

            //Add required field validator to control
            base.Controls.Add(_requiredFieldValidator);
        }

        protected override ControlCollection CreateControlCollection()
        {
            return new ControlCollection(this);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);


            //Add default if no default was set
            if (!base.Items[0].Value.Equals("-1"))
                base.Items.Insert(0, new ListItem("- Select -", "-1"));
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            _requiredFieldValidator.RenderControl(writer);
        }
    }
}