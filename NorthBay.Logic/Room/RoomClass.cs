using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;

namespace NorthBay.Logic.Room
{
    public class RoomClass : BaseBo<Framework.Database.Room>
    {
        public override List<Framework.Database.Room> SelectAll()
        {
            using (var context = Db.DataContext())
            {
                //Add Load options for table relations
                DataLoadOptions options = new DataLoadOptions();
                options.LoadWith<Framework.Database.Room>(x => x.RoomStatus);
                context.LoadOptions = options;

                return context.Rooms.Where(x => true).ToList();
            }
        }
    }
}
