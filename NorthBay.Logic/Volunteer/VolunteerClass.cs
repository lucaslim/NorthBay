using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;

namespace NorthBay.Logic.Volunteer
{
    public class VolunteerClass : BaseBo<Framework.Database.Volunteer>
    {
        public override System.Collections.Generic.List<Framework.Database.Volunteer> SelectAll()
        {
            using (var context = Db.DataContext())
            {
                var options = new DataLoadOptions();
                options.LoadWith<Framework.Database.Volunteer>(x => x.VolunteerCategoryId);

                context.LoadOptions = options;

                return context.Volunteers.Where(x => true).ToList();
            }
        }
    }
}