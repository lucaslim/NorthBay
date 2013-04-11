using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Blood_donor
{
    public class blood_donorClass : BaseBo<blood_donor>
    {
        public IQueryable<blood_donor> getgroupbygroup(string _group)
        {
            NorthBayDataContext objgroupDC = new NorthBayDataContext();
            var allgroup = objgroupDC.blood_donors.Where(x=>x.blood_donor_blood_group == _group).Select(x=>x);
            return allgroup;
        }

        //public IQueryable<blood_donor> checkforemail(string _email)
        //{
        //    NorthBayDataContext objemailDC = new NorthBayDataContext();
        //    var allemail = objemailDC.blood_donors.Where(x => x.blood_donor_email == _email).Select(x => x);
        //    return allemail;
        //}

        public void AdditionalFunction(string input)
        {
            using (var context = Db.DataContext())
            {
                IQueryable objquery = context.blood_donors.Select(x => x.blood_donor_id == 1);
            }
        }
    }
}
