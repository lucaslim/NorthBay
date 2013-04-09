using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;

namespace NorthBay.Logic.Menu
{
    public class MenuClass : BaseBo<Framework.Database.Menu>
    {
        public override List<Framework.Database.Menu> SelectAll()
        {
            using (var context = Db.DataContext())
            {
                var option = new DataLoadOptions();
                option.LoadWith<Framework.Database.Menu>(x => x.ParentMenuItemId);

                context.LoadOptions = option;

                return context.Menus.Where(x => true).ToList();
            }
        }
    }
}
