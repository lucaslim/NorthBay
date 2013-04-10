using System;
using NorthBay.Logic.Room;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Room
{
    public partial class ViewBill : Basepage
    {

        private static int Id
        {
            get
            {
                var @id = TextHelper.ToInteger(QueryHelper.GetQueryString("id"));

                if (@id == null)
                    return -1;

                return (int)@id;
            }
        }

        private readonly RoomBillingInvoiceClass _objRoomBillingInvoice = new RoomBillingInvoiceClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            var roomBillingInvoice = _objRoomBillingInvoice.Select(Id);

            //Set billing address
            lit_address.Text = roomBillingInvoice.BillingAddress;

            //Set patient name
            lit_name.Text = roomBillingInvoice.Name;

            //Set patient number
            lit_number.Text = string.Format("{0:000000}", roomBillingInvoice.UserId);

            //Set Bill Date
            lit_billingdate.Text = FormatDate(roomBillingInvoice.BillingDate);

            //Set Content
            lit_content.Text = roomBillingInvoice.BillingContent;

            //Set Sub Total
            lit_subtotal.Text = string.Format("${0}", TextHelper.ToString(roomBillingInvoice.SubTotal));

            //Set Tax
            lit_tax.Text = roomBillingInvoice.Tax != null ? string.Format("{0}%", ((decimal)roomBillingInvoice.Tax * 100).ToString("0")) : "-";

            //Set Total
            lit_total.Text = string.Format("${0}", TextHelper.ToString(roomBillingInvoice.Total));
        }
    }
}