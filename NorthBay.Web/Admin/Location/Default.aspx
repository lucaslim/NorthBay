<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" MaintainScrollPositionOnPostback="true"
    AutoEventWireup="true" Inherits="Admin_Location_Default" Codebehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lbl_message" runat="server" />
     <asp:Panel ID="panel_insert" runat="server">
        <%-- Insert a new location --%>
        <br />
        <asp:Label ID="lbl_insert" runat="server" Text="Insert a new location" Font-Bold="true" />
        <br />
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_unitI" runat="server" Text="Unit No" AssociatedControlID="txt_unitI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_unitI" runat="server" />
                    <asp:RegularExpressionValidator ID="rev_unit_no" runat="server" ControlToValidate="txt_unitI" Text="*"
                         Display="Dynamic" ErrorMessage="Unit number must be a numeric value" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"
                        ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_street_noI" runat="server" Text="Street No" AssociatedControlID="txt_street_noI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_street_noI" runat="server" />
                    <!-- check whether the street number is not blank-->
                    <asp:RequiredFieldValidator ID="rfv_street_noI" runat="server" Text="*" ValidationGroup="insert"
                        ErrorMessage="Street cannot be blank" ControlToValidate="txt_street_noI" />
                    <asp:RegularExpressionValidator ID="rev_street_no" runat="server" ControlToValidate="txt_street_noI" Text="*"
                         Display="Dynamic" ErrorMessage="Street number must be a numeric value" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"
                        ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_street_nameI" runat="server" Text="Street Name" AssociatedControlID="txt_street_nameI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_street_nameI" runat="server" />
                    <!-- check whether the street name is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_street_name" runat="server" Text="*"
                        ValidationGroup="insert" ErrorMessage="Street name  cannot be blank" ControlToValidate="txt_street_nameI" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_cityI" runat="server" Text="City" AssociatedControlID="txt_cityI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_cityI" runat="server" />
                    <!-- check whether the city is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*" ErrorMessage="City cannot be blank"
                        ControlToValidate="txt_cityI" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_provinceI" runat="server" Text="Province" AssociatedControlID="ddl_provinceI" />
                </td>
                <%-- Drop down list for selecting the Province--%>
                <td colspan="2">
                    <asp:DropDownList ID="ddl_provinceI" runat="server">
                        <asp:ListItem Value="AB">Alberta</asp:ListItem>
                        <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                        <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                        <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                        <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                        <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                        <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                        <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                        <asp:ListItem Selected="True" Value="ON">Ontario</asp:ListItem>
                        <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                        <asp:ListItem Value="QC">Quebec</asp:ListItem>
                        <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                        <asp:ListItem Value="YT">Yukon</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_pcodeI" runat="server" Text="Postal Code" AssociatedControlID="txt_pcodeI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_pcodeI" runat="server" />
                    <!-- check whether the postal code is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_pcode" runat="server" Text="*" ErrorMessage="Postal code cannot be blank"
                        ControlToValidate="txt_pcodeI" ValidationGroup="insert" />
                    <%--Checking if postal code is in valid format--%>
                    <asp:RegularExpressionValidator ID="rev_pcode" ControlToValidate="txt_pcodeI" Text="*" Display="Dynamic"
                        ValidationExpression="^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}(\-| |){1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$"
                        ErrorMessage="Please use following postal code formats :X9X-9X9 or X9X 9X9" runat="server"
                        ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_tnumberI" runat="server" Text="Telephone Number" AssociatedControlID="txt_tnumberI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_tnumberI" runat="server" />
                    <!-- check whether the telephone  number is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_tnumber" runat="server" Text="*" ErrorMessage="Telephone number cannot be blank"
                        ControlToValidate="txt_tnumberI" ValidationGroup="insert" />
                    <%--Checking if the telephone number is in valid fromat--%>
                    <asp:RegularExpressionValidator ID="rev_tpnumber" Text="*"  ControlToValidate="txt_tnumberI"
                        ValidationExpression="\(?(\d{3})\)?-?(\d{3})-(\d{4})" Display="Dynamic" SetFocusOnError="true"
                        ErrorMessage="Please use following telepone format :(999)999-9999" runat="server"
                        ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_emailI" runat="server" Text="Email" AssociatedControlID="txt_emailI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailI" runat="server" />
                    <!-- check whether the email is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*" ErrorMessage="Email cannot be blank"
                        ControlToValidate="txt_emailI" ValidationGroup="insert" />
                    <%--Checking if the email address is in valid fromat--%>
                    <asp:RegularExpressionValidator ID="rev_email" Text="*" ControlToValidate="txt_emailI"
                        ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" Display="Dynamic" SetFocusOnError="true"
                        ErrorMessage="Please enter valid email address" runat="server" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_latitudeI" runat="server" Text="Latitude" AssociatedControlID="txt_latitudeI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_latitudeI" runat="server" />
                    <!-- check whether the latitude is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_latitude" runat="server" ValidationGroup="insert"
                        Text="*" ErrorMessage="Latitude cannot be blank" ControlToValidate="txt_latitudeI" />
                    <%--Checking if the latitude is in valid fromat--%>
                    <asp:RegularExpressionValidator ID="rev_latitude" Text="*" ValidationGroup="insert"
                        ControlToValidate="txt_latitudeI" ValidationExpression="^(\+|-)?(\d\.\d{1,6}|[1-8]\d\.\d{1,6}|90\.0{1,6})$"
                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Latitude format shoud be 99.999999 -99.999999 "
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_longitudeI" runat="server" Text="Longitude" AssociatedControlID="txt_longitudeI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_longitudeI" runat="server" />
                    <!-- check whether the longitude is not balnk-->
                    <asp:RequiredFieldValidator ID="rfv_longitude" runat="server" ValidationGroup="insert"
                        Text="*" ErrorMessage="Longitude cannot be blank" ControlToValidate="txt_longitudeI" />
                    <%--Checking if the longitude is in valid fromat--%>
                    <asp:RegularExpressionValidator ID="rev_longitude" Text="*" ValidationGroup="insert"
                        ControlToValidate="txt_longitudeI" ValidationExpression="^(\+|-)?(\d\.\d{1,6}|[1-8]\d\.\d{1,6}|90\.0{1,6})$"
                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Longitude format shoud be 99.999999 -99.999999 "
                        runat="server" />
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="hpllnk_latlon" Target="_blank" NavigateUrl="http://itouchmap.com/latlong.html" Text="Click here to get Latitude/Longitude" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_imageurlI" runat="server" Text="Image Link" AssociatedControlID="txt_imageurlI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_imageurlI" runat="server" />
                </td>
            </tr>
        </table>
        <asp:Button ID="btn_insert" runat="server" ValidationGroup="insert" Text="Insert"
            OnClick="subInsert" />
            &nbsp;<asp:Button ID="btn_display_update" runat="server" Text="Display Update/Delete" onclick="btn_display_update_Click"
             />
        <br />
        <br />
        <asp:ValidationSummary ID="vds_location_insert" CssClass="validationsummary" ValidationGroup="insert"
            runat="server" HeaderText="Error Summary" ShowSummary="true" />
    </asp:Panel>
    <asp:Panel ID="panel_update" runat="server">
        <!-- Dropdown list for selecting an address-->
        <br />
        <br />
        Filter location by address :
        <asp:DropDownList ID="ddl_location_addresses" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="subChange" />
        <br />
        <br />
        <asp:ListView ID="ltv_locations" runat="server" OnItemCommand="subAdmin">
            <%-- Update an existing  location --%>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("LocationId") %>' />
                            <asp:Label ID="lbl_unitE" runat="server" Text="Unit No" AssociatedControlID="txt_unitE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_unitE" Text='<%#Bind("UnitNo")%>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_street_noE" runat="server" Text="Street No" AssociatedControlID="txt_street_noE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_street_noE" Text='<%#Bind("StreetNo")%>' runat="server" />
                            <!-- check whether the street number is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_street_noE" runat="server" Text="*" ErrorMessage="Street number cannot be blank"
                                ControlToValidate="txt_street_noE" />
                                <asp:RegularExpressionValidator ID="rev_street_no" runat="server" ControlToValidate="txt_street_noE" Text="*"
                         Display="Dynamic" ErrorMessage="Street number must be a numeric value" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"
                        ValidationGroup="insert" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_street_nameE" runat="server" Text="Street Name" AssociatedControlID="txt_street_nameE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_street_nameE" Text='<%#Bind("StreetName")%>' runat="server" />
                            <!-- check whether the street name is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_street_name" runat="server" Text="*"
                                ErrorMessage="Street name cannot be blank" ControlToValidate="txt_street_nameE" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_cityE" runat="server" Text="City" AssociatedControlID="txt_cityE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_cityE" Text='<%#Bind("City")%>' runat="server" />
                            <!-- check whether the city is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*" ErrorMessage="City cannot be blank"
                                ControlToValidate="txt_cityE" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_provinceE" runat="server" Text="Province" AssociatedControlID="ddl_provinceE" />
                        </td>
                        <td colspan="2">
                            <asp:HiddenField ID="hdf_provinceE" Value='<%#Bind("Province")%>' runat="server" />
                            <asp:DropDownList ID="ddl_provinceE" runat="server">
                                <asp:ListItem Value="AB">Alberta</asp:ListItem>
                                <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                                <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                                <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                                <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                                <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                                <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                                <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                                <asp:ListItem Value="ON">Ontario</asp:ListItem>
                                <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                                <asp:ListItem Value="QC">Quebec</asp:ListItem>
                                <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                                <asp:ListItem Value="YT">Yukon</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_pcodeE" runat="server" Text="Postal Code" AssociatedControlID="txt_pcodeE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_pcodeE" Text='<%#Bind("Pcode") %>' runat="server" />
                            <!-- check whether the postal code is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_pcode" runat="server" Text="*" ErrorMessage="Postal code cannot be blank"
                                ControlToValidate="txt_pcodeE" />
                            <%--Checking if postal code is in valid format--%>
                            <asp:RegularExpressionValidator ID="rev_pcode" ControlToValidate="txt_pcodeE" Text="*"
                                ValidationExpression="^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}(\-| |){1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$"
                                ErrorMessage="Please use following postal code formats :X9X-9X9 or X9X 9X9" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_tnumberE" runat="server" Text="Telephone Number" AssociatedControlID="txt_tnumberE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_tnumberE" Text='<%#Bind("Tnumber") %>' runat="server" />
                            <!-- check whether the telephone  number is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_tnumber" runat="server" Text="*" ErrorMessage="Telephone number cannot be blank"
                                ControlToValidate="txt_tnumberE" />
                            <%--Checking if the telephone number is in valid fromat--%>
                            <asp:RegularExpressionValidator ID="rev_tpnumber" Text="*" ControlToValidate="txt_tnumberE"
                                ValidationExpression="\(?(\d{3})\)?-?(\d{3})-(\d{4})" Display="Dynamic" SetFocusOnError="true"
                                ErrorMessage="Please use following telepone format :(999)999-9999" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_emailE" runat="server" Text="Email" AssociatedControlID="txt_emailE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_emailE" Text='<%#Bind("Email") %>' runat="server" />
                            <!-- check whether the email is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*" ErrorMessage="Email cannot be blank"
                                ControlToValidate="txt_emailE" />
                            <%--Checking if the email address is in valid fromat--%>
                            <asp:RegularExpressionValidator ID="rev_email" Text="*" ControlToValidate="txt_emailE"
                                ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" Display="Dynamic" SetFocusOnError="true"
                                ErrorMessage="Please enter valid email address" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_latitudeE" runat="server" Text="Latitude" AssociatedControlID="txt_latitudeE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_latitudeE" Text='<%#Bind("Latitude") %>' runat="server" />
                            <!-- check whether the latitude is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_latitudeE" runat="server" Text="*" ErrorMessage="Latitude cannot be blank"
                                ValidationGroup="Update" ControlToValidate="txt_latitudeE" />
                            <%--Checking if the latitude is in valid fromat--%>
                            <asp:RegularExpressionValidator ID="rev_longitudeE" Text="*" ControlToValidate="txt_latitudeE"
                                ValidationExpression="^(\+|-)?(\d\.\d{1,6}|[1-8]\d\.\d{1,6}|90\.0{1,6})$" Display="Dynamic"
                                ValidationGroup="Update" SetFocusOnError="true" ErrorMessage="Latitude format shoud be 99.999999 -99.999999 "
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_longitudeE" runat="server" Text="Longitude" AssociatedControlID="txt_longitudeE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_longitudeE" Text='<%#Bind("Longitude") %>' runat="server" />
                            <!-- check whether the longitude is not balnk-->
                            <asp:RequiredFieldValidator ID="rfv_longitude" runat="server" Text="*" ValidationGroup="Update"
                                ErrorMessage="Longitude cannot be blank" ControlToValidate="txt_longitudeE" />
                            <%--Checking if the longitude is in valid fromat--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Text="*" ValidationGroup="Update"
                                ControlToValidate="txt_latitudeE" ValidationExpression="^(\+|-)?(\d\.\d{1,6}|[1-8]\d\.\d{1,6}|90\.0{1,6})$"
                                Display="Dynamic" SetFocusOnError="true" ErrorMessage="Latitude format shoud be 99.999999 -99.999999 "
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_imageurlE" runat="server" Text="Image Link" AssociatedControlID="txt_imageurlE" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_imageurlE" Text='<%#Bind("ImageUrl") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btn_update" runat="server" ValidationGroup="Update" Text="Update"
                                CommandName="subUpdate" /> &nbsp;
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="subDelete" /> &nbsp;
                                <asp:Button ID="btn_display_insert" runat="server" Text="Display Insert"  CommandName="subDisplayInsert" />
                        </td>
                       
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <asp:ValidationSummary ID="vds_location_update" CssClass="validationsummary" ValidationGroup="Update"
            runat="server" HeaderText="Error Summary" ShowSummary="true" />
    </asp:Panel>
</asp:Content>
