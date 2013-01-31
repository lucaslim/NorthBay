using System.Linq.Expressions;
using System.Reflection;

namespace NorthBay.Framework.Querying
{
    public static class PropertyExpressionHelper
    {
        public static MemberExpression GetExpression<TEntity>(string target) where TEntity : class
        {
            return GetExpression<TEntity>(target, string.Empty);
        }

        public static MemberExpression GetExpression<TEntity>(string target, string param) where TEntity : class
        {
            ParameterExpression parameterExpression = string.IsNullOrEmpty(param)
                                                          ? ParameterExpressionHelper.GetExpression<TEntity>()
                                                          : ParameterExpressionHelper.GetExpression<TEntity>(param);

            return GetExpression<TEntity>(target, parameterExpression);
        }

        public static MemberExpression GetExpression<TEntity>(string target, ParameterExpression parameterExpression)
            where TEntity : class
        {
            PropertyInfo propertyInfo = PropertyInfoHelper.GetInfo<TEntity>(target);

            return Expression.Property(parameterExpression, propertyInfo);
        }
    }
}