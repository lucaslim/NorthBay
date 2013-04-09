using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.User
{
    public class UserBillingAddressClass : BaseBo<UserBillingAddress>
    {
        public override UserBillingAddress Select(int id)
        {
            using (var context = Db.DataContext())
            {
                DataLoadOptions options = new DataLoadOptions();
                options.LoadWith<UserBillingAddress>(x => x.Country);

                context.LoadOptions = options;

                return context.UserBillingAddresses.Single(x => x.UserBillingAddressId == id);
            }
        }
    }
}
