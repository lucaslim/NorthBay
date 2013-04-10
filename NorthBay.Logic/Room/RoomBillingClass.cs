using System;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Transactions;
using NorthBay.Framework.Database;
using NorthBay.Logic.User;
using NorthBay.Utility;
using NorthBay.Utility.Configuration;

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
                options.LoadWith<RoomBillingEquipment>(x => x.Equipment);
                options.LoadWith<RoomBilling>(x => x.User);
                options.LoadWith<RoomBilling>(x => x.Room);

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

        public bool CheckOutRoom(int id, int addressId, out int checkOutId)
        {
            var roomBilling = SelectByRoomId(id);
            var billingAddress = new UserBillingAddressClass().Select(addressId);

            var billingId = roomBilling.RoomBillingId;

            var subTotal = CalculateSubTotal(roomBilling);

            //Set Room Billing Invoice
            var roomBillingInvoice = new RoomBillingInvoice
                                         {
                                             Name = roomBilling.User.Name,
                                             BillingAddress = GetFormattedBillingAddress(billingAddress),
                                             BillingContent = GetFormattedBillingContent(roomBilling),
                                             BillingDate = DateTime.Now,
                                             SubTotal = subTotal,
                                             Tax = WebConfigApplicationSettings.Tax,
                                             Total = subTotal + (subTotal * WebConfigApplicationSettings.Tax),
                                             UserId = roomBilling.UserId
                                         };


            //Remove entry from Room Billing Equipment
            new RoomBillingEquipmentClass().DeleteByRoomBillingId(billingId);

            //Remove entry from Room Billing
            Delete(billingId);

            return new RoomBillingInvoiceClass().Insert(roomBillingInvoice, out checkOutId);
        }

        private decimal? CalculateSubTotal(RoomBilling roomBilling)
        {
            var roomPrice = roomBilling.Room.Price;
            if (roomPrice == null)
                return 0;

            //Add Room Price
            decimal price = (decimal)roomPrice;

            //Add additional Equipment Price
            foreach (var billingEquipment in roomBilling.RoomBillingEquipments)
            {
                var equipmentPrice = billingEquipment.Equipment.Price;

                if (equipmentPrice != null)
                    price += (decimal)equipmentPrice;
            }

            return price;
        }

        private string GetFormattedBillingContent(RoomBilling roomBilling)
        {
            var stringBuilder = new StringBuilder();

            stringBuilder.Append("<tr>");
            stringBuilder.Append("<th>Description</th><th>Quantity</th><th>Price</th>");
            stringBuilder.Append("</tr>");
            foreach (RoomBillingEquipment equipment in roomBilling.RoomBillingEquipments)
            {
                stringBuilder.Append("<tr>");
                stringBuilder.Append("<td>" + equipment.Equipment.Description + "</td><td>" + equipment.Quantity + "</td><td>" + GetEquipmentPrice(equipment.Equipment.Price, equipment.Quantity) + "</td>");
                stringBuilder.Append("</tr>");
            }



            return stringBuilder.ToString();
        }

        private string GetEquipmentPrice(decimal? price, int? quantity)
        {
            if (price == null || quantity == null)
                return "-";

            return string.Format("${0}", (price * TextHelper.ToDecimal(quantity)));
        }

        private static string GetFormattedBillingAddress(UserBillingAddress billingAddress)
        {
            var stringBuilder = new StringBuilder(string.Format("{0}<br />", billingAddress.FullName));

            stringBuilder.AppendFormat("{0}<br />", billingAddress.AddressLine1);

            if (!string.IsNullOrEmpty(billingAddress.AddressLine2))
                stringBuilder.AppendFormat("{0}<br />", billingAddress.AddressLine2);

            stringBuilder.AppendFormat("{0}, {1} {2}<br/>", billingAddress.City, billingAddress.State, billingAddress.PostalCode);
            stringBuilder.AppendFormat("{0}", billingAddress.Country.Name);

            return stringBuilder.ToString();
        }
    }
}
