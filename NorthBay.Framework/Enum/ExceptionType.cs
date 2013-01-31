namespace NorthBay.Framework.Enum
{
    public enum ExceptionType
    {
        NoException = 0,
        EmptyTableName,
        EmptySetParameters,
        InsertException,
        SelectException,
        UpdateException,
        DeleteException,
        EmptyWhereClause,
        LoginFailed,
        PropertyNotFound
    }
}