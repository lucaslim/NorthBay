namespace NorthBay.Framework.Validation
{
    public static class RegularExpression
    {
        public const string NAME = @"/^[A-Za-z ]+$/";
        public const string EMAIL = @"/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/";
        public const string POSTAL_CODE = @"/^\s*[a-ceghj-npr-tvxy]\d[a-z](\s)?\d[a-z]\d\s*$/i";
    }
}