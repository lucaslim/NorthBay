<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="NorthBay.Web.Admin.Gift.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Gift Item Add
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel ID="vgp_gift" runat="server" ValidationGroup="gift">
                <div class="input_label bold">
                    Title:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title">
                    </custom:TextBox>
                </div>
                <div class="input_label bold">
                    Description:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_description" Required="True" TextMode="MultiLine"
                        Height="100px" Width="300px" />
                </div>
                <div class="input_label bold">
                    Price:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_price" Required="True" ValidType="Decimals"></custom:TextBox>
                </div>
                <div class="input_label bold">
                    Category:
                </div>
                <div class="input_control">
                    <asp:CheckBoxList runat="server" ID="cbl_category" RepeatDirection="Horizontal" RepeatColumns="3"
                        RepeatLayout="Table" />
                </div>
                <div class="input_label bold">
                    Image Upload:
                </div>
                <div class="input_control">
                    <asp:FileUpload runat="server" ID="fu_productImage" />
                </div>
                <asp:Button runat="server" ID="btnUpdate" Text="Add" OnClick="ButtonClick" />
            </custom:ValidationGroupPanel>
        </div>
    </div>
</asp:Content>
