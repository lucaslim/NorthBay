using System.Data.Linq;
using System.Linq;
using System.Transactions;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Room
{
    public class RoomBillingClass : BaseBo<RoomBilling>
    {
        public override bool Update(RoomBilling t)
        {
            using (var transactionScope = new TransactionScope())
            {
                using (var context = Db.DataContext())
                {
                    //Delete old data
                    var objRoomBillingEquipment = new RoomBillingEquipmentClass();

                    if (!objRoomBillingEquipment.DeleteByRoomBillingId(t.RoomBillingId))
                        return false;

                    context.RoomBillings.Attach(t);
                    context.Refresh(RefreshMode.KeepCurrentValues, t);

                    context.SubmitChanges();

                    var roomBillingEquipment = objRoomBillingEquipment.DetachAll(t.RoomBillingEquipments);

                    //Add new Data
                    if (!objRoomBillingEquipment.InsertAll(roomBillingEquipment))
                        return false;
                    
                    transactionScope.Complete();

                    return true;
                }
            }

        }

        public RoomBilling SelectByRoomId(int roomId)
        {
            using (var context = Db.DataContext())
            {
                DataLoadOptions options = new DataLoadOptions();
                options.LoadWith<RoomBilling>(x => x.RoomBillingEquipments);
                options.LoadWith<RoomBilling>(x => x.User);

                context.LoadOptions = options;

                return context.RoomBillings.SingleOrDefault(x => x.RoomId == roomId);
            }
        }

        public bool IsRoomVacant(int roomId)
        {
            RoomBilling roomBilling;

            return IsRoomVacant(roomId, out roomBilling);
        }

        public bool IsRoomVacant(int roomId, out RoomBilling roomBilling)
        {
            roomBilling = SelectByRoomId(roomId);

            return roomBilling == null;
        }

        public int GetIdByRoomId(int id)
        {
            using (var context = Db.DataContext())
            {
                var roomBilling = context.RoomBillings.Single(x => x.RoomId == id);

                return roomBilling.RoomBillingId;
            }
        }
    }
}
