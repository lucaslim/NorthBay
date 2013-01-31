using System;
using System.Linq;
using System.Linq.Expressions;

namespace NorthBay.Framework.Querying
{
    public static class Query
    {
        /// <summary>
        /// this function executes the dynamic linq query
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="queryable"></param>
        /// <param name="arrType"></param>
        /// <param name="lambdaExpression"></param>
        /// <param name="methodName"></param>
        /// <returns>IQueryable</returns>
        public static IQueryable Execute<TEntity>(IQueryable<TEntity> queryable, Type[] arrType,
                                                  LambdaExpression lambdaExpression, string methodName)
            where TEntity : class
        {
            //Create method to be called by Query
            MethodCallExpression method = Expression.Call(typeof (Queryable), methodName, arrType, queryable.Expression,
                                                          lambdaExpression);

            //Execute Method
            return queryable.Provider.CreateQuery(method);
        }
    }
}