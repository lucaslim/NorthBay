using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Volunteer
{
    public class VolunteerClass : BaseBo<Framework.Database.Volunteer>
    {
        public void AdditionalFunction(string input)
        {
           //creating a new instance of Data Context using Db.DataContext()
            using(var context = Db.DataContext())
            {
               //Do your normal Linq stuff.
               IQueryable objQuery = context.Volunteers.Select(x => x.VolunteerId == 1);
            }
        }

    }
}