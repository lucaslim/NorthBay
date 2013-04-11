<%@ Page Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="canteen_admin.aspx.cs" Inherits="NorthBay.Web.Admin.Canteen.canteen_admin" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Listview --%>
        <asp:Label ID="lbl_nameI" runat="server" Text="Item Name :" AssociatedControlID="txt_nameI" />
    <br />
    <asp:TextBox ID="txt_nameI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_nameI" ValidationGroup="insert_item" />
    <br />


    <asp:Label ID="lbl_priceI" runat="server" Text="Price" AssociatedControlID="txt_priceI"/>
    <br />
    <asp:TextBox ID="txt_priceI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_priceI" runat="server" Text="*Required" ControlToValidate="txt_priceI" ValidationGroup="insert_item" />
    <br />

    <asp:Label ID="lbl_descI" runat="server" Text="Description :" AssociatedControlID="txt_descI"/>
    <br />
    <asp:TextBox ID="txt_descI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="txt_descI" ValidationGroup="insert_item" />
    <br />

    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert_item" />
    <%--<asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />--%>
    <br />
    <hr />

    <asp:Panel ID="pnl_all" runat="server">
    <%--Message of success or failure of data--%>
        <asp:Label ID="lbl_msg" runat="server" /> 
        <br />
        <table cellpadding="2" cellspacing="5">
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_Item" runat="server" Text="Item" /></th>
                    <th><asp:Label ID="lbl_price" runat="server" Text="Price" /></th>
                    <th><asp:Label ID="lbl_description" runat="server" Text="Description" /></th>
                    <th><asp:Label ID="lbl_option1" runat="server" Text="Option" /></th>
                    <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:ListView ID="ltv_all" runat="server">
                    <ItemTemplate>
                        <tr>
                        
                            <td><%#Eval("item_name")%></td>
                            <td><%#Eval("item_price") %></td>
                            <td><%#Eval("item_description") %></td>
                            <td><asp:LinkButton ID="btn_update" runat="server" Text="Edit" CommandName="Updating" CommandArgument='<%#Eval("itemID") %>' OnCommand="subAdmin" /></td>
                            <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Deleting" CommandArgument='<%#Eval("itemID") %>' OnCommand="subAdmin" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnl_update" runat="server">
        <table cellpadding="2" cellspacing="3">
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_nameU" runat="server" Text="Name" /></th>
                    <th><asp:Label ID="lbl_priceU" runat="server" Text="Price" /></th>
                    <th><asp:Label ID="lbl_descU" runat="server" Text="Description" /></th>
                    
                </tr>
            </thead>
            <tbody>
                <asp:ListView ID="ltv_update" runat="server" OnItemCommand="subUpdate">
                    <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("itemID") %>' />
                            <td><asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("item_name") %>' /></td>
                            <td><asp:TextBox ID="txt_priceU" runat="server" Text='<%#Eval("item_price") %>' /></td>
                            <td><asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("item_description") %>' /></td>
                            
                        </tr>
                        <tr>
                            <td><asp:RequiredFieldValidator ID="rfv_nameU" runat="server" ControlToValidate="txt_nameU" ErrorMessage="*Required" ValidationGroup="update" /></td>
                            <td><asp:RequiredFieldValidator ID="rfv_priceU" runat="server" ControlToValidate="txt_priceU" ErrorMessage="*Required" ValidationGroup="update" /></td>
                            <td><asp:RequiredFieldValidator ID="rfv_descU" runat="server" ControlToValidate="txt_descU" ErrorMessage="*Required" ValidationGroup="update" /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Updating" ValidationGroup="update" />
                            
                            <asp:Button ID="btn_insert" runat="server" Text="Cancel" CommandName="Canceling" CausesValidation="false" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_delete" runat="server">
        <asp:Label ID="lbl_delete" runat="server" Text="Delete this record?"/>
        <table cellpadding="2" cellspacing="3">
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_nameD" runat="server" Text="Name" /></th>
                    <th><asp:Label ID="lbl_priceD" runat="server" Text="Price" /></th>
                    <th><asp:Label ID="lbl_descD" runat="server" Text="Description" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:ListView ID="ltv_delete" runat="server" OnItemCommand="subDelete">
                    <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("itemID") %>' />
                            <td><asp:Label ID="lbl_nameD" runat="server" Text='<%#Eval("item_name") %>' /></td>
                            <td><asp:Label ID="lbl_priceD" runat="server" Text='<%#Eval("item_price") %>' /></td>
                            <td><asp:Label ID="lbl_descD" runat="server" Text='<%#Eval("item_description") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Deleting" />
                               
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Canceling" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
    </asp:Panel>
    </asp:Content>
