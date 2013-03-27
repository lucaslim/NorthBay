using System.Collections.Generic;
using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.User
{
    public class UserBillingAddressViewClass : BaseBo<UserBillingAddressView>
    {
        public List<UserBillingAddressView> SelectByUserId(int id)
        {
            using (var context = Db.DataContext())
            {
                return context.UserBillingAddressViews.Where(x => x.UserId == id).ToList();
            }
        }
    }
}
