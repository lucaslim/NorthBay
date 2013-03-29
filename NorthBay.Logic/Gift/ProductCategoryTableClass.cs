using System.Collections.Generic;
using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Gift
{
    public class ProductCategoryTableClass : BaseBo<ProductCategoryTable>
    {
        public List<ProductCategoryTable> SelectByProductId(int productId)
        {
            using(var context = Db.DataContext())
            {
                return context.ProductCategoryTables.Where(x => x.ProductId == productId).ToList();
            }
        }

        public bool DeleteByProductId(int id)
        {
            using(var context = Db.DataContext())
            {
                    var productCategoryTables = context.ProductCategoryTables.Where(x => x.ProductId == id);

                if (!productCategoryTables.Any())
                    return true;
                
                context.ProductCategoryTables.DeleteAllOnSubmit(productCategoryTables);
                context.SubmitChanges();

                return true;
            }
        }
    }
}
