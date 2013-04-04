using System.Collections.Generic;
using System.Data.Linq;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;

namespace NorthBay.Logic
{
    public class BaseBo<TEntity> where TEntity : class, new()
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
        public virtual TEntity Select(int id)
        {
            return Db.Select<TEntity>(id);
        }

        /// <summary>
        /// Return list of objects
        /// </summary>
        /// <returns></returns>
        public virtual List<TEntity> SelectAll()
        {
            return Db.SelectAll<TEntity>();
        }

        /// <summary>
        /// Delete object by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual bool Delete(int id)
        {
            return Db.Delete<TEntity>(id);
        }

        /// <summary>
        /// Insert new object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public virtual bool Insert(TEntity t)
        {
            int id;
            return Db.Insert(t, out id);
        }

        /// <summary>
        /// Insert new object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public virtual bool Insert(TEntity t, out int id)
        {
            return Db.Insert(t, out id);
        }

        /// <summary>
        /// Update object
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public virtual bool Update(TEntity t)
        {
            return Db.Update(t);
        }

        /// <summary>
        /// Sort object
        /// </summary>
        /// <param name="sortExpression"></param>
        /// <param name="sortDirection"></param>
        /// <returns></returns>
        public virtual List<TEntity> SortAll(string sortExpression, SortDirection sortDirection)
        {
            return Db.SortAll<TEntity>(sortExpression, sortDirection);
        }

        public virtual TEntity Detach(TEntity t)
        {
            return Db.Detach(t);
        }

        public virtual EntitySet<TEntity> DetachAll(IEnumerable<TEntity> tSet)
        {
            var set = new EntitySet<TEntity>();

            foreach (var entity in tSet)
            {
                set.Add(Detach(entity));
            }

            return set;
        }
    }
}