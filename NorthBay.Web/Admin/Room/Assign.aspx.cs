using System;
using System.Data.Linq;
using System.Linq;
using System.Transactions;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.Country;
using NorthBay.Logic.Room;
using NorthBay.Logic.User;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Room
{
    public partial class Assign : Basepage
    {
        private readonly RoomClass _objRoom = new RoomClass();
        private readonly EquipmentClass _objEquipment = new EquipmentClass();
        private readonly UserClass _objUser = new UserClass();
        private readonly UserBillingAddressClass _objUserBillingAddress = new UserBillingAddressClass();
        private readonly RoomBillingClass _objRoomBilling = new RoomBillingClass();
        private readonly RoomBillingEquipmentClass _objRoomBillingEquipment = new RoomBillingEquipmentClass();

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

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if id is valid
            if (Id <= 0 || Page.IsPostBack)
                return;

            SetPatientData();

            SetEquipmentData();

            //If room is occupied, fill data
            SetRoomData();
        }

        private void SetRoomData()
        {
            var room = _objRoom.Select(Id);

            lbl_room.Text = TextHelper.ToString(room.Number);
            lbl_building.Text = TextHelper.ToString(room.Building);
            lbl_level.Text = TextHelper.ToString(room.Level);

            RoomBilling roomBilling;

            //If is not occupied, return    
            if (_objRoomBilling.IsRoomVacant(Id, out roomBilling))
                return;

            btn_checkout.Visible = true;

            //Set Additional Equipments
            foreach (var roomBillingEquipment in roomBilling.RoomBillingEquipments)
            {
                //Set equipment Id
                var equipmentId = roomBillingEquipment.EquipmentId;

                //Search for matching equipment id and set the quantity;
                foreach (var item in rpt_equipments.Items.Cast<RepeaterItem>().Where(item => equipmentId == GetRepeaterItemId(item)))
                    SetRepeaterItemQuantity(item, roomBillingEquipment.Quantity);
            }

            //Set assigned user
            var userId = roomBilling.UserId;

            if (userId == null)
                return;

            //Find selected item by value
            var selectedItem = ddl_patients.Items.FindByValue(TextHelper.ToString(userId));

            if (selectedItem == null)
                return;

            //Set selected Item
            selectedItem.Selected = true;
        }

        private void SetRepeaterItemQuantity(RepeaterItem item, int? quantity)
        {
            if (quantity == null)
                return;

            var textbox = item.FindControl("txt_quantity") as TextBox;

            //return if textbox not found
            if (textbox == null)
                return;

            //Set quantity
            textbox.Text = quantity.ToString();
        }

        private void SetPatientData()
        {
            ddl_patients.DataSource = _objUser.SelectAllPatients();
            ddl_patients.DataTextField = "Name";
            ddl_patients.DataValueField = "UserId";
            ddl_patients.DataBind();
        }

        private void SetEquipmentData()
        {
            rpt_equipments.DataSource = _objEquipment.SelectAll();
            rpt_equipments.DataBind();
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            var button = sender as Button;

            if (button == null)
                return;

            var commandName = button.CommandName;

            if (string.IsNullOrEmpty(commandName))
                return;

            switch (commandName.ToLower())
            {
                case "update":
                    {
                        //Update data
                        var roomBilling = new RoomBilling
                        {
                            RoomId = Id,
                            UserId = TextHelper.ToInteger(ddl_patients.SelectedValue),
                            RoomBillingEquipments = GetRoomBillingEquipments(),
                        };

                        var isRoomVacant = _objRoomBilling.IsRoomVacant(Id);

                        if (!isRoomVacant)
                            roomBilling.RoomBillingId = _objRoomBilling.GetIdByRoomId(Id);

                        if (isRoomVacant ? _objRoomBilling.Insert(roomBilling) : UpdateRoom(roomBilling))
                        {
                            //Redirect
                            Redirect("~/Admin/Room/");
                        }
                    }
                    break;

                case "checkout":
                    {
                        var userId = TextHelper.ToInteger(ddl_patients.SelectedValue);

                        //Load user billing address
                        LoadUserAddresses(userId);

                        //Disable additional equipments
                        SetAdditionalEquipmentTextbox(false);

                        //Disable Checkout button
                        btn_checkout.Enabled = false;

                        //Disable Update Button
                        btn_update.Enabled = false;

                        //Disable dropdownlist
                        ddl_patients.Enabled = false;

                        pnl_address.Visible = true;

                        up_address.Update();
                    }
                    break;

                case "newbill":
                    {
                        using (var transactionScope = new TransactionScope())
                        {
                            var userId = TextHelper.ToInteger(ddl_patients.SelectedValue);

                            if (userId == null || userId <= 0)
                                return;

                            var userBillingAddress = new UserBillingAddress
                            {
                                FullName = txt_fullname.Text,
                                AddressLine1 = txt_address1.Text,
                                AddressLine2 = txt_address2.Text,
                                City = txt_city.Text,
                                State = txt_state.Text,
                                CountryId = TextHelper.ToInteger(ddl_country.SelectedValue),
                                PostalCode = txt_postalcode.Text,
                                PhoneNumber = txt_phone.Text,
                                UserId = (int)userId
                            };

                            int addressId;

                            if (!_objUserBillingAddress.Insert(userBillingAddress, out addressId))
                                return;

                            //Get room billing Id
                            var roomBillingId = _objRoomBilling.GetIdByRoomId(Id);

                            //return if room billing id does not exist
                            if (roomBillingId <= 0)
                                return;

                            int checkOutId;

                            if (!_objRoomBilling.CheckOutRoom(Id, addressId, out checkOutId))
                                return;

                            transactionScope.Complete();

                            Response.Redirect(string.Format("ViewBill.aspx?id={0}", checkOutId));
                        }

                    }
                    break;

                case "existingbill":
                    {
                        var addressId = TextHelper.ToInteger(button.CommandArgument);

                        if (addressId == null)
                            return;

                        int checkOutId;

                        if (!_objRoomBilling.CheckOutRoom(Id, (int)addressId, out checkOutId))
                            return;

                        Response.Redirect(string.Format("ViewBill.aspx?id={0}", checkOutId));
                    }
                    break;

                case "cancel":

                        //Disable additional equipments
                        SetAdditionalEquipmentTextbox(true);

                        //Disable Checkout button
                        btn_checkout.Enabled = true;

                        //Disable Update Button
                        btn_update.Enabled = true;

                        //Disable dropdownlist
                        ddl_patients.Enabled = true;

                        pnl_address.Visible = false;

                        up_address.Update();
                    break;
            }
        }

        private void SetAdditionalEquipmentTextbox(bool isEnabled)
        {
            foreach (var textbox in
                    (from RepeaterItem item in
                         rpt_equipments.Items
                     select item.FindControl("txt_quantity")).OfType<TextBox>())
            {
                textbox.Enabled = isEnabled;
            }
        }

        private void LoadUserAddresses(int? userId)
        {
            if (userId == null)
                return;

            //Fill Drop down list with country
            SetCountry();

            var list = new UserBillingAddressViewClass().SelectByUserId((int)userId);

            if (list.Count == 0)
            {
                lbl_output.Text = "There are currently no billing address attached to this user account.";
                vgp_address.Visible = true;
            }
            else
            {
                dl_address.DataSource = list;
                dl_address.DataBind();
            }
        }

        private bool UpdateRoom(RoomBilling roomBilling)
        {
            if (roomBilling.RoomBillingId <= 0)
                return false;

            using (var transactionScope = new TransactionScope())
            {
                //Delete all room billing equipment
                if (!_objRoomBillingEquipment.DeleteByRoomBillingId(roomBilling.RoomBillingId))
                    return false;

                //Delete Room Billing
                if (!_objRoomBilling.Delete(roomBilling.RoomBillingId))
                    return false;

                //Re-insert new updated data
                if (!_objRoomBilling.Insert(roomBilling))
                    return false;

                transactionScope.Complete();

                return true;
            }
        }


        private EntitySet<RoomBillingEquipment> GetRoomBillingEquipments()
        {
            var set = new EntitySet<RoomBillingEquipment>();

            foreach (RepeaterItem item in rpt_equipments.Items)
            {
                var quantity = GetRepeaterItemQuantity(item);
                //Do not add if quantity is 0 or empty
                if (quantity <= 0)
                    continue;

                var roomBillingEquipment = new RoomBillingEquipment
                                               {
                                                   Quantity = quantity,
                                                   EquipmentId = GetRepeaterItemId(item)
                                               };

                set.Add(roomBillingEquipment);
            }

            return set;
        }

        private int GetRepeaterItemId(RepeaterItem item)
        {
            var hiddenfield = item.FindControl("hf_id") as HiddenField;

            if (hiddenfield == null)
                return 0;

            var id = TextHelper.ToInteger(hiddenfield.Value);

            return id == null || id <= 0 ? 0 : (int)id;
        }

        private static int GetRepeaterItemQuantity(RepeaterItem item)
        {
            var textbox = item.FindControl("txt_quantity") as TextBox;

            if (textbox == null)
                return 0;

            var quantity = TextHelper.ToInteger(textbox.Text);

            return quantity == null || quantity <= 0 ? 0 : (int)quantity;
        }



        private void SetCountry()
        {
            ddl_country.DataSource = new CountryClass().SelectAll();
            ddl_country.DataTextField = "PrintableName";
            ddl_country.DataValueField = "CountryId";
            ddl_country.DataBind();
        }
    }
}