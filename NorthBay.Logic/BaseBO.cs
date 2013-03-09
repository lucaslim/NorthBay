using System.Collections.Generic;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;

namespace NorthBay.Logic
{
    public class BaseBo<TEntity> where TEntity : class
    {
        /// <summary>
        /// Helper Object
        /// </summary>
        internal readonly DbHelper Db = new DbHelper();

        /// <summary>
        /// Return single object by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TEntity Select(int id)
        {
            return Db.Select<TEntity>(id);
        }

        /// <summary>
        /// Return list of objects
        /// </summary>
        /// <returns></returns>
        public List<TEntity> SelectAll()
        {
            return Db.SelectAll<TEntity>();
        }

        /// <summary>
        /// Delete object by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            return Db.Delete<TEntity>(id);
        }

        /// <summary>
        /// Insert new object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public bool Insert(TEntity t)
        {
            int id;
            return Db.Insert(t, out id);
        }

        /// <summary>
        /// Insert new object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public bool Insert(TEntity t, out int id)
        {
            return Db.Insert(t, out id);
        }

        /// <summary>
        /// Update object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public bool Update(TEntity t)
        {
            return Db.Update(t);
        }

        public List<TEntity> SortAll(string sortExpression, SortDirection sortDirection)
        {
            return Db.SortAll<TEntity>(sortExpression, sortDirection);
        }

        public List<TEntity> Paging(int pageIndex)
        {
            return null;// Db.Paging<TEntity>(pageIndex);
        }
    }
}