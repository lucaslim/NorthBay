using System.Collections.Generic;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Gift
{
    public class CartProduct : Product
    {
        public int Quantity { get; set; }
    }

    public class Cart : List<CartProduct> { }
}
