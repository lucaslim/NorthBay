namespace NorthBay.Framework.Validation
{
    public static class RegularExpression
    {
        public const string NUMBERS = @"^[0-9 ]+$";
        public const string ALPHANUMERIC = @"^[a-zA-Z0-9 ]+$";
        public const string CHARACTERS = @"^[A-Za-z ]+$";
        public const string DECIMAL = @"^\d+\.?\d*$";
        public const string NAME = @"^[A-Za-z ]+$";
        public const string EMAIL = @"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
        public const string POSTAL_CODE = @"^[A-Z][0-9][A-Z]*\s?[0-9][A-Z][0-9]$";
    }
}