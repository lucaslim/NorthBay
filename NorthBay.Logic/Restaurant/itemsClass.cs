using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Restaurant
{
    public class itemsClass : BaseBo<restaurant>
    {
        public IQueryable<restaurant> getallitems()
        {
            NorthBayDataContext objgroupDC = new NorthBayDataContext();
            var allitems = objgroupDC.restaurants.Select(x=>x);
            return allitems;
        }

        public IQueryable<restaurant> getitembyid(int _id)
        {
            NorthBayDataContext objItemDC = new NorthBayDataContext();
            var allitems = objItemDC.restaurants.Where(x=>x.itemID == _id).Select(x=>x);
            return allitems;
        }

        public bool Insert(string _name, decimal _price, string _desc)
        {
            NorthBayDataContext objItemDC = new NorthBayDataContext();
            using (objItemDC)
            {
                restaurant objnewitem = new restaurant();
                objnewitem.item_name = _name;
                objnewitem.item_price = _price;
                objnewitem.item_description = _desc;
                objItemDC.restaurants.InsertOnSubmit(objnewitem);
                objItemDC.SubmitChanges();
                return true;
            }

        }

        public bool Update(int _id, string _name, decimal _price, string _desc)
        {
            NorthBayDataContext objItemDC = new NorthBayDataContext();
            using(objItemDC)
            {
                var objupitem = objItemDC.restaurants.Single(x=>x.itemID == _id);
                objupitem.item_name = _name;
                objupitem.item_price = _price;
                objupitem.item_description = _desc;
                objItemDC.SubmitChanges();
                return true;

            }
        }

        public bool Delete(int _id)
        {
            NorthBayDataContext objItemDC = new NorthBayDataContext();
            using (objItemDC)
            {
                var objdelitem = objItemDC.restaurants.Single(x=>x.itemID == _id);
                objItemDC.restaurants.DeleteOnSubmit(objdelitem);
                objItemDC.SubmitChanges();
                return true;
            }
        }
    }
}
