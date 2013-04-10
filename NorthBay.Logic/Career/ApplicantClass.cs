using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Career
{
    public class ApplicantClass
    {
        // Private member variables

        private int _careerid;
        private string _fname;
        private string _lname;
        private string _unitno;
        private string _streetno;
        private string _streetname;
        private string _city;
        private string _province;
        private string _pcode;
        private string _tpnumber;
        private string _email;
        private string _resumeurl;




        // Get and set constructors...
        public int careerid
        {
            get { return _careerid; }
            set { _careerid = value; }
        }

        public string fname
        {
            get { return _fname; }
            set { _fname = value; }
        }

        public string lname
        {
            get { return _lname; }
            set { _lname = value; }
        }



        public string unitno
        {
            get { return _unitno; }
            set { _unitno = value; }
        }

        public string streetno
        {
            get { return _streetno; }
            set { _streetno = value; }
        }

        public string streetname
        {
            get { return _streetname; }
            set { _streetname = value; }
        }

        public string city
        {
            get { return _city; }
            set { _city = value; }
        }

        public string province
        {
            get { return _province; }
            set { _province = value; }
        }
        public string pcode
        {
            get { return _pcode; }
            set { _pcode = value; }
        }

        public string tpnumber
        {
            get { return _tpnumber; }
            set { _tpnumber = value; }
        }

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string resumeurl
        {
            get { return _resumeurl; }
            set { _resumeurl = value; }
        }

        public IQueryable<Applicant> getApplicants()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();

            //creating anonymous various with its value being the instance of our LINQ object
            var allApplicants = objCareersDC.Applicants.Select(x => x);//method syntax
            return allApplicants;
        }

        public IQueryable<Applicant> getApplicantByID(int _ApplicantId)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            var allApplicants = objCareersDC.Applicants.Where(x => x.ApplicantId == _ApplicantId).Select(x => x);
            //SELECT * FROM products WHERE id = _id
            return allApplicants;
        }

        public bool commitInsert(int _careerid, string _fname, string _lname, string _unitno, string _streetno, string _streetname, string _city, string _province, string _pcode, string _tnumber, string _email, string _resumeurl)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objCareersDC = new NorthBayDataContext();
            //to ensure all data will be disposed when finished
            using (objCareersDC)
            {
                //create an instance of our table object
                Applicant objnewApplicant = new Applicant();
                //set table columns to the new values that will be passed from the *.aspx page
                objnewApplicant.CareerId = _careerid;
                objnewApplicant.Fname = _fname;
                objnewApplicant.Lname = _lname;
                objnewApplicant.UnitNo = _unitno;
                objnewApplicant.StreetNo = _streetno;
                objnewApplicant.StreetName = _streetname;
                objnewApplicant.City = _city;
                objnewApplicant.Province = _province;
                objnewApplicant.Pcode = _pcode;
                objnewApplicant.Tnumber = _tnumber;
                objnewApplicant.Email = _email;
                objnewApplicant.ResumeUrl = _resumeurl;

                //insert command
                objCareersDC.Applicants.InsertOnSubmit(objnewApplicant);
                //commit insert against database
                objCareersDC.SubmitChanges();
                return true;

            }
        }


        public string print()
        {
            return
                "<br/>" +
                "<br/>Applicant Name: " + _fname + " " + _lname +
                "<br />Applicant address:" + _unitno + (",") + _streetno + (" ") + _streetname + (",") + _city + (",") + _province + (",") + _pcode +
                "<br/>Applicant telephone number:" + _tpnumber + "<br/>" +
                "<br />" + "We will send you an email to " + "  " + _email;

        }

        public string emailbody()
        {
            //create an instance of career class
            CareerClass objCareer = new CareerClass();
            return
                "Hi " + _fname + ", " +
                "<br/>" +
                "You have successfully applied to the " + objCareer.getCareerByID(_careerid) + " position on Northbay hospital web site. Best of luck with your candidacy!" +
                "<br/>" + "Thanks for using Northbay careers to help connect you with opportunities online." +
                "<br/>" + "Best regards," +
                "<br/>" + " The Human Resource Team" + "<br/>" + "<br/>" +
                "-----------------------------------------------------------------------------------------------------" +
                "<br/>Applicant Name: " + _fname + " " + _lname +
                "<br />Applicant address:" + _unitno + (",") + _streetno + (" ") + _streetname + (",") + _city + (",") + _province + (",") + _pcode +
                "<br/>Applicant telephone number:" + _tpnumber + "<br/>" +
                "-----------------------------------------------------------------------------------------------------";

        }


    }
}
