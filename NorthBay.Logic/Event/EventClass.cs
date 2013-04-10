using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.Event
{
    /// <summary>
    /// Summary description for EventClass
    /// </summary>
    public class EventClass
    {
        // Private member variables

        private int _eventid;
        private string _title;
        private string _description;
        private DateTime _eventdate;
        private string _imageurl;
        private int _eventtype;

        // Get and set constructors...
        public static ArrayList EventCollection;

        public int eventid
        {
            get { return _eventid; }
            set { _eventid = value; }
        }

        public string title
        {
            get { return _title; }
            set { _title = value; }
        }

        public string description
        {
            get { return _description; }
            set { _description = value; }
        }

        public DateTime eventdate
        {
            get { return _eventdate; }
            set { _eventdate = value; }
        }

        public string imageurl
        {
            get { return _imageurl; }
            set { _imageurl = value; }
        }

        public int eventtype
        {
            get { return _eventtype; }
            set { _eventtype = value; }
        }


        public Array getEvents()
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objEventsDC = new NorthBayDataContext();

            //creating anonymous various with its value being the instance of our LINQ object
            var allEvents = objEventsDC.Events.Select(x => x); //method syntax

            // CalendarEvent item;
            Framework.Database.Event[] EventsArray = allEvents.ToArray();

            return EventsArray;
        }



        public IQueryable<Framework.Database.Event> getEventByID(int _eventid)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objEventsDC = new NorthBayDataContext();
            var eventById = objEventsDC.Events.Where(x => x.EventId == _eventid).Select(x => x);
            //SELECT * FROM events WHERE id = _id
            return eventById;
        }


        public bool commitInsert(string _title, string _description, DateTime _eventdate, string _imageurl, int _eventtype)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objEventsDC = new NorthBayDataContext();
            using (objEventsDC)
            {
                //create an instance of our table object
                Framework.Database.Event objNewEvent = new Framework.Database.Event();
                //set table columns to the new values that will be passed from the *.aspx page

                objNewEvent.Title = _title;
                objNewEvent.Description = _description;
                objNewEvent.EventDate = _eventdate;
                objNewEvent.ImageUrl = _imageurl;
                objNewEvent.EventType = _eventtype;

                //insert command
                objEventsDC.Events.InsertOnSubmit(objNewEvent);

                objEventsDC.SubmitChanges();
                return true;
            }
        }


        public bool commitUpdate(int _eventid, string _title, string _description, DateTime _eventdate, string _imageurl, int _eventtype)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objEventsDC = new NorthBayDataContext();
            using (objEventsDC)
            {
                var objUpdEvent = objEventsDC.Events.Single(x => x.EventId == _eventid);
                //set table columns to the new values that will be passed from the *.aspx page
                objUpdEvent.EventId = _eventid;
                objUpdEvent.Title = _title;
                objUpdEvent.Description = _description;
                objUpdEvent.EventDate = _eventdate;
                objUpdEvent.ImageUrl = _imageurl;
                objUpdEvent.EventType = _eventtype;
                objEventsDC.SubmitChanges();
                return true;
            }
        }

        public bool commitDelete(int _eventid)
        {
            //creating an instance of our LINQ object
            NorthBayDataContext objEventsDC = new NorthBayDataContext();
            using (objEventsDC)
            {
                var objDelLocation = objEventsDC.Events.Single(x => x.EventId == _eventid);
                //delete command
                objEventsDC.Events.DeleteOnSubmit(objDelLocation);
                //commit delete against database
                objEventsDC.SubmitChanges();
                return true;
            }

        }


        public object commitInsert(string p, string p_2, string p_3, string p_4, string p_5)
        {
            throw new NotImplementedException();
        }
    }
}
