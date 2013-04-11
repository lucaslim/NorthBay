using System.Linq;
using NorthBay.Framework.Database;
using System.Web;
using System;
using System.Collections.Generic;

namespace NorthBay.Logic.Add_doctor
{
    public class add_doctorClass : BaseBo<Doctor>
    {
        public void AdditionalFunction(string input)
        {
            //creating a new instance of Data Context using Db.DataContext()
            using (var context = Db.DataContext())
            {
                //Do your normal Linq stuff.
                IQueryable objQuery = context.Doctors.Select(x => x.DoctorId == 1);
            }
        }

        public IQueryable<Doctor> getDoctors()
        {
            NorthBayDataContext objDC = new NorthBayDataContext();
            var allDoctors = objDC.Doctors.Select(x=>x);
            return allDoctors;
        }

        public IQueryable<Doctor> getDoctorById(int _id)
        {
            NorthBayDataContext objDC = new NorthBayDataContext();
            var allDoctors = objDC.Doctors.Where(x=>x.DoctorId == _id).Select(x=>x);
            return allDoctors;
        }

        public bool commitUpdate(int _id, string _name, string _contact, string _email, string _desi, string _quali,string _joindate,string _dept, string _bio, string _image)
        {
            NorthBayDataContext objDC = new NorthBayDataContext();
            using (objDC)
            {
                var objUpDoc = objDC.Doctors.Single(x =>x.DoctorId == _id);
                objUpDoc.DoctorName = _name;
                objUpDoc.ContactNo = _contact;
                objUpDoc.EmailId = _email;
                objUpDoc.Designation = _desi;
                objUpDoc.Qualification = _quali;
                objUpDoc.JoinDate = _joindate;
                objUpDoc.JoinDate = _dept;
                objUpDoc.Biography = _bio;
                objUpDoc.ProfileImage = _image;
                objDC.SubmitChanges();
                return true;
            }
        }

        public bool commitDelete(int _id)
        {
            NorthBayDataContext objDC = new NorthBayDataContext();
            using (objDC)
            {
                var objDelDoc = objDC.Doctors.Single(x=>x.DoctorId == _id);
                objDC.Doctors.DeleteOnSubmit(objDelDoc);
                objDC.SubmitChanges();
                return true;
            }
        }
    }
}