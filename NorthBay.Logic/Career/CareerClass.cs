using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Career
{
    public class CareerClass
    {
        public IQueryable<Framework.Database.Career> getCareers()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();

            //creating anonymous various with its value being the instance of our LINQ object
            var allCareers = objCareersDC.Careers.Select(x => x);//method syntax
            return allCareers;
        }

        public IQueryable<String> getCareerCategories()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();

            //creating anonymous various with its value being the instance of our LINQ object
            var distinctCategories = objCareersDC.Careers.Select(x => x.Category).Distinct();
            return distinctCategories;
        }

        public IQueryable<Framework.Database.Career> getCareersByID(int _CareerId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            var allCareers = objCareersDC.Careers.Where(x => x.CareerId == _CareerId).Select(x => x);
            //SELECT * FROM products WHERE id = _id
            return allCareers;
        }


        public string getCareerByID(int _CareerId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            var title = objCareersDC.Careers.Where(x => x.CareerId == _CareerId).Select(x => x.Title).SingleOrDefault();
            //SELECT * FROM products WHERE id = _id
            return title;
        }

        public IQueryable<Framework.Database.Career> getCareersByCategory(string _Category)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            var careersByCategory = objCareersDC.Careers.Where(x => x.Category == _Category).Select(x => x);
            //SELECT * FROM products WHERE id = _id
            return careersByCategory;
        }



        public bool commitInsert(string _title, string _description, string _category, string _postdate, string _enddate, Boolean _active)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            //to ensure all data will be disposed when finished
            using (objCareersDC)
            {
                //create an instance of our table object
                Framework.Database.Career objnewCareer = new Framework.Database.Career();
                //set table columns to the new values that will be passed from the *.aspx page
                objnewCareer.Title = _title;
                objnewCareer.Description = _description;
                objnewCareer.Category = _category;
                objnewCareer.PostDate = DateTime.Parse(_postdate);
                objnewCareer.EndDate = DateTime.Parse(_enddate);
                objnewCareer.Active = _active;
                //insert command
                objCareersDC.Careers.InsertOnSubmit(objnewCareer);
                //commit insert against database
                objCareersDC.SubmitChanges();
                return true;

            }
        }

        public bool commitUpdate(int _CareerId, string _title, string _description, string _category, DateTime _postdate, DateTime _enddate, Boolean _active)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            using (objCareersDC)
            {
                var objUpdCareer = objCareersDC.Careers.Single(x => x.CareerId == _CareerId);
                objUpdCareer.Title = _title;
                objUpdCareer.Description = _description;
                objUpdCareer.Category = _category;
                objUpdCareer.PostDate = _postdate;
                objUpdCareer.EndDate = _enddate;
                objUpdCareer.Active = _active;
                objCareersDC.SubmitChanges();
                return true;
            }
        }

        public bool commitDelete(int _CareerId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            using (objCareersDC)
            {
                try
                {
                    var objDelPro = objCareersDC.Careers.Single(x => x.CareerId == _CareerId);
                    //delete command
                    objCareersDC.Careers.DeleteOnSubmit(objDelPro);

                    //commit delete against database
                    objCareersDC.SubmitChanges();
                    return true;
                }
                catch (SqlException sqlEx)
                {
                    if (sqlEx.ErrorCode == 547)
                        throw;
                }
                catch (Exception ex)
                {
                    throw (ex); //General error logic
                }

                return false;

            }

        }
    }
}
