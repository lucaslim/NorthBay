using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Location
{
    /// <summary>
    /// Summary description for LocationClass
    /// </summary>
    public class LocationClass
    {
        public IQueryable<Framework.Database.Location> getLocations()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();

            //creating anonymous various with its value being the instance of our LINQ object
            var allLocations = objLocationsDC.Locations.Select(x => x);//method syntax
            return allLocations;
        }


        public IQueryable<object> getLocationAddresses()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();

            var locationAddresses = from x in objLocationsDC.Locations
                                    select new
                                    {
                                        LocationId = x.LocationId,
                                        Address = "North Bay Regional Health Centre, " + x.StreetNo + " " + x.StreetName + ", " + x.City
                                    };
            return locationAddresses;
        }


        public IQueryable<object> allLocations()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();

            var allLocations = from x in objLocationsDC.Locations
                               select new
                               {
                                   LocationId = x.LocationId,
                                   Name = "North Bay Regional Health Centre",
                                   Address = x.StreetNo + " " + x.StreetName,
                                   City = x.City,
                                   Province = x.Province,
                                   Pcode = x.Pcode,
                                   Tnumber = x.Tnumber,
                                   Email = x.Email,
                                   ImageUrl = x.ImageUrl,
                               };
            return allLocations;
        }

        public IQueryable<Framework.Database.Location> getLocationById(int _LocationId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();
            var locationById = objLocationsDC.Locations.Where(x => x.LocationId == _LocationId).Select(x => x);
            return locationById;
        }

        public bool commitInsert(string _unitno, string _streetno, string _streetname, string _city, string _province, string _pcode, string _tnumber, string _email, decimal _latitude, decimal _longitude, string _imageurl)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();
            //to ensure all data will be disposed when finished
            using (objLocationsDC)
            {
                //create an instance of our table object
                Framework.Database.Location objnewLocation = new Framework.Database.Location();

                //set table columns to the new values that will be passed from the *.aspx page
                objnewLocation.UnitNo = _unitno;
                objnewLocation.StreetNo = _streetno;
                objnewLocation.StreetName = _streetname;
                objnewLocation.City = _city;
                objnewLocation.Province = _province;
                objnewLocation.Pcode = _pcode;
                objnewLocation.Tnumber = _tnumber;
                objnewLocation.Email = _email;
                objnewLocation.Latitude = _latitude;
                objnewLocation.Longitude = _longitude;
                objnewLocation.ImageUrl = _imageurl;

                //insert command
                objLocationsDC.Locations.InsertOnSubmit(objnewLocation);

                //commit insert against database
                objLocationsDC.SubmitChanges();

                return true;
            }
        }

        public bool commitUpdate(int _locationId, string _unitno, string _streetno, string _streetname, string _city, string _province, string _pcode, string _tnumber, string _email, decimal _latitude, decimal _longitude, string _imageurl)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();
            using (objLocationsDC)
            {
                var objUpdLocation = objLocationsDC.Locations.Single(x => x.LocationId == _locationId);
                //set table columns to the new values that will be passed from the *.aspx page
                objUpdLocation.UnitNo = _unitno;
                objUpdLocation.StreetNo = _streetno;
                objUpdLocation.StreetName = _streetname;
                objUpdLocation.City = _city;
                objUpdLocation.Province = _province;
                objUpdLocation.Pcode = _pcode;
                objUpdLocation.Tnumber = _tnumber;
                objUpdLocation.Email = _email;
                objUpdLocation.Latitude = _latitude;
                objUpdLocation.Longitude = _longitude;
                objUpdLocation.ImageUrl = _imageurl;
                objLocationsDC.SubmitChanges();
                return true;
            }
        }

        public bool commitDelete(int _locationId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objLocationsDC = new NorthBayDataContext();
            using (objLocationsDC)
            {
                var objDelLocation = objLocationsDC.Locations.Single(x => x.LocationId == _locationId);
                //delete command
                objLocationsDC.Locations.DeleteOnSubmit(objDelLocation);
                //commit delete against database
                objLocationsDC.SubmitChanges();
                return true;
            }

        }

    }
}
