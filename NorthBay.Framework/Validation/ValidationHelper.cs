using NorthBay.Framework.Enum;

namespace NorthBay.Framework.Validation
{
    /// <summary>
    /// Summary description for ValidationHelper
    /// </summary>
    public static class ValidationHelper
    {
        public static string GetValidationExpression(ValidationType validType)
        {
            string regularExpression, dummy;

            //Get regular Expression
            GetValidationDetails(validType, out regularExpression, out dummy);

            return regularExpression;
        }

        public static string GetValidationErrorMessage(ValidationType validType)
        {
            string errorMessage, dummy;

            //Get Error Message
            GetValidationDetails(validType, out dummy, out errorMessage);

            return errorMessage;
        }

        private static void GetValidationDetails(ValidationType validationType, out string regularExpression,
                                                 out string errorMessage)
        {
            //Set ValidationHelper Type
            switch (validationType)
            {
                case ValidationType.Name:
                    regularExpression = RegularExpression.NAME;
                    errorMessage = "Name is not valid";
                    break;
                case ValidationType.Email:
                    regularExpression = RegularExpression.EMAIL;
                    errorMessage = "Email is invalid";
                    break;
                case ValidationType.PostalCode:
                    regularExpression = RegularExpression.POSTAL_CODE;
                    errorMessage = "Postal Code is invalid";
                    break;
                default:
                    regularExpression = string.Empty;
                    errorMessage = string.Empty;
                    break;
            }
        }
    }
}