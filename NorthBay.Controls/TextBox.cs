using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Framework.Enum;
using NorthBay.Framework.Validation;

namespace NorthBay.Controls
{
    [ToolboxData("<{0}:TextBox runat=server />")]
    public class TextBox : System.Web.UI.WebControls.TextBox
    {
        private RegularExpressionValidator _regularExpressionValidator;
        private RequiredFieldValidator _requiredFieldValidator;

        /// <summary>
        /// Set if field is mandatory
        /// </summary>
        public bool Required { private get; set; }

        /// <summary>
        /// Set title of this field
        /// </summary>
        public string Title { private get; set; }

        /// <summary>
        /// Set ValidationHelper Type
        /// </summary>
        private ValidationType ValidType { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            _requiredFieldValidator = new RequiredFieldValidator
                                          {
                                              ID = string.Format("{0}_rfv", base.ID),
                                              ControlToValidate = base.ID,
                                              Enabled = Required,
                                              Visible = Required,
                                              ErrorMessage = string.Format("{0} must not be empty.", Title),
                                              Display = ValidatorDisplay.Dynamic,
                                              ValidationGroup = base.ValidationGroup
                                          };

            _requiredFieldValidator.Controls.Add(new Literal {Text = "&nbsp;"});
            //Add error image
            _requiredFieldValidator.Controls.Add(ValidationImageHelper.GetImage(_requiredFieldValidator,
                                                                                _requiredFieldValidator.ErrorMessage));

            //Add required field validator to control
            base.Controls.Add(_requiredFieldValidator);


            _regularExpressionValidator = new RegularExpressionValidator
                                              {
                                                  ID = string.Format("{0}_rev", base.ID),
                                                  ControlToValidate = base.ID,
                                                  Enabled = ValidType != ValidationType.None,
                                                  Visible = ValidType != ValidationType.None,
                                                  ErrorMessage = ValidationHelper.GetValidationErrorMessage(ValidType),
                                                  ValidationExpression =
                                                      ValidationHelper.GetValidationExpression(ValidType),
                                                  Display = ValidatorDisplay.Dynamic,
                                                  ValidationGroup = base.ValidationGroup
                                              };

            _regularExpressionValidator.Controls.Add(new Literal {Text = "&nbsp;"});
            //Add error image
            _regularExpressionValidator.Controls.Add(ValidationImageHelper.GetImage(_regularExpressionValidator,
                                                                                    _regularExpressionValidator.
                                                                                        ErrorMessage));

            //Add required field validator to control
            base.Controls.Add(_regularExpressionValidator);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);

            _requiredFieldValidator.RenderControl(writer);
            _regularExpressionValidator.RenderControl(writer);
        }
    }
}