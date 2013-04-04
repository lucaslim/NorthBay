using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;
using NorthBay.Utility;

namespace NorthBay.Logic.Room
{
    public class RoomBilling : Framework.Database.RoomBilling
    {
        public decimal TotalPrice
        {
            get
            {
                var roomPrice = GetRoomPrice();
                var additionalEquipmentPrice = GetAdditionalEquipmentPrice();

                return roomPrice + additionalEquipmentPrice;
            }
        }

        private decimal GetRoomPrice()
        {
            var price = TextHelper.ToDecimal(Room.Price);

            return 0;
        }

        private decimal GetAdditionalEquipmentPrice()
        {
            decimal price = 0;
            foreach (var billingEquipment in base.RoomBillingEquipments)
            {
                if (billingEquipment.Quantity == 0)
                    continue;

                var equipmentPrice = GetEquipmentPrice(billingEquipment.Equipment);
                var quantity = GetEquipmentQuantity(billingEquipment.Quantity);

                price += quantity * equipmentPrice;
            }

            return price;
        }

        private decimal GetEquipmentQuantity(int? equipment)
        {
            var quantity = TextHelper.ToDecimal(equipment);

            return quantity == null ? 0 : (decimal)quantity;
        }

        private decimal GetEquipmentPrice(Equipment equipment)
        {
            var price = TextHelper.ToDecimal(equipment.Price);

            return price == null ? 0 : (decimal)price;
        }
    }
}
