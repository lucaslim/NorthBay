using System.Collections.Generic;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Web.UI.WebControls;
using NorthBay.Framework.Querying;

namespace NorthBay.Framework.Database
{
    public sealed class DbHelper
    {
        /// <summary>
        /// Create new instance of NorthBayDataContext
        /// </summary>
        /// <returns></returns>
        public NorthBayDataContext DataContext()
        {
            return new NorthBayDataContext(Properties.Settings.Default.northbayConnectionString);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="id"></param>
        /// <returns></returns>
        public TEntity Select<TEntity>(int id) where TEntity : class
        {
            using (NorthBayDataContext context = DataContext())
            {
                //Set parameter expression
                ParameterExpression paramExpression = ParameterExpressionHelper.GetExpression<TEntity>("x");

                //Set property expression
                var propExpression = PropertyExpressionHelper.GetExpression<TEntity>(string.Format("{0}Id", typeof(TEntity).Name), paramExpression);

                //Create binary expression
                var binaryExpression = Expression.Equal(propExpression, Expression.Constant(id));

                //Create lambda expression*
                var lambdaExpression = Expression.Lambda(binaryExpression, paramExpression);

                //convert Table to Queryable
                var queryable = context.GetTable<TEntity>().AsQueryable();

                //Specify parameters of the method
                var arrType = new[] { queryable.ElementType };

                //Execute Method
                var results = Query.Execute(queryable, arrType, lambdaExpression, "Where");

                return ((IQueryable<TEntity>)results).Single();
            }
        }

        /// <summary>
        /// This function allows user to sort based on expression and sort direction
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="sortExpression"></param>
        /// <param name="sortDirection"></param>
        /// <returns></returns>
        public List<TEntity> SortAll<TEntity>(string sortExpression, SortDirection sortDirection) where TEntity : class
        {
            using (NorthBayDataContext context = DataContext())
            {
                //Set parameter expression
                var paramExpression = ParameterExpressionHelper.GetExpression<TEntity>();

                //Set property expression
                var propExpression = PropertyExpressionHelper.GetExpression<TEntity>(sortExpression, paramExpression);

                //Create lambda expression
                var lambdaExpression = Expression.Lambda(propExpression, new[] { paramExpression });

                //convert Table to Queryable
                var queryable = context.GetTable<TEntity>().AsQueryable();

                //Specify parameters of the method
                var arrType = new[] { typeof(TEntity), typeof(TEntity).GetProperty(sortExpression).PropertyType };

                var results = Query.Execute(queryable, arrType, lambdaExpression,
                                                   SortHelper.GetDirection(sortDirection));

                //Return sorted list
                return ((IOrderedQueryable<TEntity>)results).ToList();
            }
        }

        /// <summary>
        /// This function returns a list based on the table selected
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <returns></returns>
        public List<TEntity> SelectAll<TEntity>() where TEntity : class
        {
            using (NorthBayDataContext context = DataContext())
            {
                return context.GetTable<TEntity>().ToList<TEntity>();
            }
        }

        /// <summary>
        /// This function allows user to delete object from the selected table
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete<TEntity>(int id) where TEntity : class
        {
            using (var context = DataContext())
            {
                //Set parameter expression
                var paramExpression = ParameterExpressionHelper.GetExpression<TEntity>("x");

                //Set Property Expression
                var propExpression = PropertyExpressionHelper.GetExpression<TEntity>(string.Format("{0}Id", typeof(TEntity).Name), paramExpression);

                //Create binary expression
                var binaryExpression = Expression.Equal(propExpression, Expression.Constant(id));

                //Create lambda expression*
                var lambdaExpression = Expression.Lambda(binaryExpression, paramExpression);

                //convert Table to Queryable
                var queryable = context.GetTable<TEntity>().AsQueryable();

                //Specify parameters of the method
                var arrType = new[] { queryable.ElementType };

                //Execute Method
                var results = Query.Execute(queryable, arrType, lambdaExpression, "Where");

                //Set delete
                TEntity t = ((IQueryable<TEntity>)results).SingleOrDefault();

                if (t == null)
                    return true;

                //Delete
                context.GetTable<TEntity>().DeleteOnSubmit(t);

                context.SubmitChanges();

                return true;
            }
        }

        /// <summary>
        /// This functions allows user to insert object to the selected table
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="t"></param>
        public bool Insert<TEntity>(TEntity t, out int id) where TEntity : class
        {
            using (var context = DataContext())
            {
                id = 0;
                
                context.GetTable<TEntity>().InsertOnSubmit(t);
                context.SubmitChanges();

                foreach (PropertyInfo propertyInfo in from propertyInfo 
                                                          in t.GetType().GetProperties() //get list of properties
                                                      where propertyInfo.Name.Contains("Id") //find properties containing Id
                                                      from attr 
                                                          in propertyInfo.GetCustomAttributes(false) //get list of attributes
                                                      where attr.GetType().GetProperty("IsPrimaryKey") != null //make sure IsPrimaryKey attribute Exist
                                                      where (attr.GetType().GetProperty("IsPrimaryKey").GetValue(attr, null)) is bool //make sure attribute is a boolean 
                                                      let isPrimaryKey = ((bool)attr.GetType().GetProperty("IsPrimaryKey").GetValue(attr, null)) //assign attribute to boolean variable if its true
                                                      where isPrimaryKey where (propertyInfo.GetValue(t, null)) is int //make sure property is an integer 
                                                      select propertyInfo) //select property
                {
                    //convert value to int and assign to id
                    id = (int)propertyInfo.GetValue(t, null); 
                    return true;
                }

                return true;
            }
        }

        /// <summary>
        /// This functions allows user to update object to the selected table
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="t"></param>
        public bool Update<TEntity>(TEntity t) where TEntity : class
        {
            using (var context = DataContext())
            {
                context.GetTable<TEntity>().Attach(t);
                context.Refresh(RefreshMode.KeepCurrentValues, t);
                context.SubmitChanges();

                return true;
            }
        }

        //public List<TEntity> Paging<TEntity>(int pageIndex) where TEntity : class
        //{
        //    using (var context = DataContext())
        //    {

        //    }
        //}
    }
}