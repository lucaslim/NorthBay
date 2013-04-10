<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Volunteer Edit
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel ID="ValidationGroupPanel1" runat="server" ValidationGroup="AddVolunteer">
                <div class="input_label bold">
                    Title:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title">
                    </custom:TextBox>
                </div>
                <div class="input_label bold">
                    Category:
                </div>
                <div class="input_control">
                    <custom:DropDownList runat="server" ID="ddl_category" Required="True" Title="Category">
                    </custom:DropDownList>
                </div>
                <div class="input_label bold">
                    Description:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_description" Required="True" TextMode="MultiLine"
                        Height="100px" Width="300px" />
                </div>
                <div class="input_label bold">
                    Post Date:
                </div>
                <div class="input_control">
                    <custom:DateBox runat="server" ID="txt_postdate" Required="True" />
                </div>
                <div class="input_label bold">
                    End Date:
                </div>
                <div class="input_control">
                    <custom:DateBox runat="server" ID="txt_enddate" Required="True" />
                </div>
                <div class="input_label bold">
                    Active:
                </div>
                <div class="input_control">
                    <custom:DropDownList runat="server" ID="ddl_active" Required="True">
                        <Items>
                            <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                            <asp:ListItem Text="No" Value="False"></asp:ListItem>
                        </Items>
                    </custom:DropDownList>
                </div>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="ButtonClick" />
            </custom:ValidationGroupPanel>
        </div>
    </div>
</asp:Content>
