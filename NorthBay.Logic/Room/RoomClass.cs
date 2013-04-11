using System;
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

        public Dictionary<string, int> SelectRoomsByBuilding()
        {
            var list = SelectAll();

            if (list.Count <= 0)
                return null;

            //Select list of buildings
            var buildings = list.Select(x => x.Building).Distinct();

            return buildings.ToDictionary(building => building, building => list.Count(x => x.Building == building));
        }

        public decimal GetAverageRoomPrice()
        {
            var list = SelectAll();

            if (list.Count <= 0)
                return 0;

            var averageRoomPrice = list.Average(x => x.Price);

            if (averageRoomPrice == null)
                return 0;

            return Math.Round((decimal)averageRoomPrice);
        }
    }
}
