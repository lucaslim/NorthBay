using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text;
using NorthBay.Logic.Event;

namespace NorthBay.Web.Event
{
    public partial class Event_Default : System.Web.UI.Page
    {
        //creating an instance of the LINQ class
        EventClass objEvent = new EventClass();
    
        public static ArrayList EventCollection;


        //Structure
        public struct CalendarEvent
        {

            public int eventid;
            public string title;
            public string description;
            public DateTime eventdate;
            public string imageurl;
            public int eventtype;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                EventCollection = Get_Event();
         
            }
        }
        public ArrayList Get_Event()
        {
       
            try
            {
                CalendarEvent temp;
                EventCollection = new ArrayList();
          
                foreach (Framework.Database.Event item in objEvent.getEvents())
                {
                    temp.eventid = item.EventId;
                    temp.title = item.Title;
                    temp.description = item.Description;
                    temp.eventdate = item.EventDate;
                    temp.imageurl = item.ImageUrl;
                    temp.eventtype = item.EventType;
                    EventCollection.Add(temp);
                
                }
            }
            catch
            { }
            finally
            {
            
            }
            return EventCollection;
        }
        public void Calendar1_DayRender(object o, DayRenderEventArgs e)
        {
            string FontColor;
            string compDate = "01/01/1900"; // Date to compare initially
            DateTime DayVal = Convert.ToDateTime(compDate);
            bool mItemDay = false;
            bool dayTextChanged = false;
            StringBuilder strTemp = new StringBuilder();
            foreach (CalendarEvent temp_dt in EventCollection)
            {
                if ("01/01/1900" != temp_dt.eventdate.ToShortDateString())
                {
                    if (dayTextChanged == true)
                    {
                        break;
                    }
                    mItemDay = false;
                    DayVal = temp_dt.eventdate;
                }
                else
                {
                    mItemDay = true;
                }
                if (e.Day.Date == Convert.ToDateTime(temp_dt.eventdate.ToString("d")))
                {
                    switch (temp_dt.eventtype)
                    {
                        case 1:
                            FontColor = "Blue";
                            break;
                        case 2:
                            FontColor = "Red";
                            break;
                        default:
                            FontColor = "Black";
                            break;
                    }
                    if (mItemDay == false)
                    {
                        strTemp = new StringBuilder();
                    }
                    else
                    {
                        strTemp.Append("<br>");
                    }
                    strTemp.Append("<span style='font-family:verdana;font-size:10px;font-weight:bold;color'");
                    strTemp.Append(FontColor);
                    strTemp.Append("'><br><a href='EventDetails.aspx?id=");
                    strTemp.Append(temp_dt.eventid.ToString());
                    strTemp.Append("'</a>");
                    strTemp.Append(temp_dt.title.ToString());
                    strTemp.Append("<br>");
                    strTemp.Append("</span>");
                    e.Cell.BackColor = System.Drawing.Color.Yellow;
                    dayTextChanged = true;
                }
            }
            if (dayTextChanged == true)
            {
                e.Cell.Controls.Add(new LiteralControl(strTemp.ToString()));
            }
        }
    }
}