using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Volunteer
{
    public class VolunteerCategoryClass : BaseBo<VolunteerCategory>
    {
        public override List<VolunteerCategory> SelectAll()
        {
            using (var context = Db.DataContext())
            {
                var options = new DataLoadOptions();
                options.LoadWith<VolunteerCategory>(x => x.Volunteers);

                context.LoadOptions = options;

                return context.VolunteerCategories.Where(x => true).ToList();
            }
        }
    }
}
