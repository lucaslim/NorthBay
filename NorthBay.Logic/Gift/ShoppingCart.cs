using System.Linq;
using NorthBay.Utility.Configuration;

namespace NorthBay.Logic.Gift
{
    public class ShoppingCart
    {
        /// <summary>
        /// Shopping Cart Property
        /// </summary>
        public Cart Cart { get; set; }

        private static decimal Tax { get { return WebConfigApplicationSettings.Tax; } }

        /// <summary>
        /// Get the total price
        /// </summary>
        /// <returns></returns>
        private decimal GetTotalPrice()
        {
            return Cart.Sum(cartProduct => (cartProduct.Price * cartProduct.Quantity));
        }

        /// <summary>
        /// Get the total price in string
        /// </summary>
        /// <returns></returns>
        public string GetStringTotalPrice()
        {
            return GetTotalPrice().ToString("0.00");
        }

        /// <summary>
        /// Get Price with Tax Included
        /// </summary>
        /// <returns></returns>
        private decimal GetTotalPriceWithTax()
        {
            return (GetTotalPrice() * (1 + Tax));
        }

        /// <summary>
        /// Get Price with Tax Included in string
        /// </summary>
        /// <returns></returns>
        public string GetStringTotalPriceWithTax()
        {
            return GetTotalPriceWithTax().ToString("0.00");
        }

        /// <summary>
        /// Return Tax in Percentage
        /// </summary>
        /// <returns></returns>
        public string GetStringTax()
        {
            return (Tax * 100).ToString("0") + "%";
        }

        /// <summary>
        /// Get total quantity
        /// </summary>
        /// <returns></returns>
        public int GetTotalQuantity()
        {
            return Cart.Sum(cartProduct => cartProduct.Quantity);
        }

        /// <summary>
        /// Update product quantity by Id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="quantity"></param>
        public bool UpdateProductById(int id, int quantity)
        {
            foreach (var product in Cart.Where(product => product.ProductId == id))
            {
                product.Quantity = quantity;
                return true;
            }

            return false;
        }
    }
}
