using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Room
{
    public class RoomBillingEquipmentClass : BaseBo<RoomBillingEquipment>
    {
        public bool DeleteByRoomBillingId(int roomBillingId)
        {
            using(var context = Db.DataContext())
            {
                var list = context.RoomBillingEquipments.Where(x => x.RoomBillingId == roomBillingId).ToList();

                context.RoomBillingEquipments.DeleteAllOnSubmit(list);

                context.SubmitChanges();

                return true;
            }
        }

        public bool InsertAll(EntitySet<RoomBillingEquipment> roomBillingEquipments)
        {
            foreach (var roomBillingEquipment in roomBillingEquipments)
            {
                Insert(roomBillingEquipment);
            }

            return true;
        }
    }
}