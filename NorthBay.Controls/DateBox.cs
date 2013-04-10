using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using NorthBay.Framework.Validation;
using NorthBay.Utility;
using NorthBay.Utility.Configuration;

namespace NorthBay.Controls
{
    [ToolboxData("<{0}:DateBox runat=server />")]
    public class DateBox : System.Web.UI.WebControls.TextBox
    {
        private CalendarExtender _calendarExtender;
        private Image _image;
        private RequiredFieldValidator _requiredFieldValidator;

        /// <summary>
        /// Set if field is mandatory
        /// </summary>
        public bool Required { private get; set; }

        /// <summary>
        /// Set title of this field
        /// </summary>
        public string Title { private get; set; }

        public override string Text
        {
            get { return base.Text; }
            set
            {
                base.Text = TextHelper.FormatDate(value);
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            _image = new Image
                         {
                             ID = base.ID + "_img",
                             ImageUrl =
                                 PageHelper.RelativePath(string.Format("{0}{1}", Config.IMAGE_PATH, "20x20_calendar.gif"))
                         };

            base.Controls.Add(_image);

            _calendarExtender = new CalendarExtender
                                    {
                                        PopupButtonID = _image.ID,
                                        TargetControlID = base.ID,
                                        Format = WebConfigApplicationSettings.DateFormat,
                                    };

            base.Controls.Add(_calendarExtender);

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

            /** TO BE FIXED LATER
            _compareValidator = new CompareValidator
                                    {
                                        ID = string.Format("{0}_rev", base.ID),
                                        ControlToValidate = base.ID,
                                        ErrorMessage =
                                            string.Format("Date is not in the right format. ({0})",
                                                          WebConfigApplicationSettings.DateFormat),
                                        Operator = ValidationCompareOperator.DataTypeCheck,
                                        Type = ValidationDataType.Date,
                                        Display = ValidatorDisplay.Dynamic,
                                        ValidationGroupPanel = base.ValidationGroupPanel,
                                        CultureInvariantValues = false
                                    };

            _compareValidator.Controls.Add(new Literal { Text = "&nbsp;" });
            //Add error image
            _compareValidator.Controls.Add(ValidationImageHelper.GetImage(_compareValidator,
                                                                          _compareValidator.ErrorMessage));

            //Add required field validator to control
            base.Controls.Add(_compareValidator);
             */
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);

            _image.RenderControl(writer);
            _calendarExtender.RenderControl(writer);
            _requiredFieldValidator.RenderControl(writer);
            //_compareValidator.RenderControl(writer);
        }
    }
}