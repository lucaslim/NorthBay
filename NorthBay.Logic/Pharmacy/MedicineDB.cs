using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Pharmacy
{
    public class MedicineDB
    {
        NorthBayDataContext dc = new NorthBayDataContext();

        public Framework.Database.Medicine GetMedById(int id)
        {
            Framework.Database.Medicine med = (from x in dc.Medicines
                                               where x.Id == id
                                               select x).FirstOrDefault();
            return med;
        }

        public void UpdateMedicine(Framework.Database.Medicine med)
        {
            Framework.Database.Medicine m = GetMedById(med.Id);
            m.Name = med.Name;
            m.Price = med.Price;
            m.Stock = med.Stock;
            m.CategoryId = med.CategoryId;
            m.Description = med.Description;
            dc.SubmitChanges();
        }


        public void DeleteMedById(int id)
        {
            Framework.Database.Medicine m = GetMedById(id);
            if (m != null)
            {
                dc.Medicines.DeleteOnSubmit(m);
                dc.SubmitChanges();
            }
        }
    }
}
