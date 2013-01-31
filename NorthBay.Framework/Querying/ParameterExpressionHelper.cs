using System.Linq.Expressions;

namespace NorthBay.Framework.Querying
{
    public static class ParameterExpressionHelper
    {
        public static ParameterExpression GetExpression<TEntity>() where TEntity : class
        {
            return GetExpression<TEntity>("x");
        }

        /// <summary>
        /// Get Parameter Expression based on TEntity class
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="param"></param>
        /// <returns></returns>
        public static ParameterExpression GetExpression<TEntity>(string param) where TEntity : class
        {
            return Expression.Parameter(typeof (TEntity), param);
        }
    }
}