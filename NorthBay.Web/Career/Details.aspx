<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="true" Inherits="NorthBay.Web.Career.Career_Details" Codebehind="Details.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--Display the deatails of the selected job posting--%>
<br /><br />
    <div id="detail">
       
    <asp:DetailsView ID="dtv_Details" 
                     runat="server"             
                     Height="50px" 
                     Width="500px"         
                     AutoGenerateRows="False" 
                     CssClass="view"
                     HeaderStyle-CssClass="header"
                     FieldHeaderStyle-CssClass="fieldHeader"
                     AlternatingRowStyle-CssClass="alternating"
                     CommandRowStyle-CssClass="command"
                     PagerStyle-CssClass="pager">
    <Fields>
     <asp:BoundField DataField="CareerId" HeaderText="CareerId" 
                Visible="false" ReadOnly="True" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:BoundField DataField="Category" HeaderText="Category" 
            SortExpression="Category" />
        <asp:BoundField DataField="PostDate" DataFormatString="{0:d}" HeaderText="PostDate" 
            SortExpression="PostDate" />
        <asp:BoundField DataField="EndDate" DataFormatString="{0:d}" HeaderText="EndDate" 
            SortExpression="EndDate" />
        <asp:CheckBoxField DataField="Active" HeaderText="Active" 
            SortExpression="Active" />
    </Fields>
</asp:DetailsView>
<%-- When click 'Apply',display an application form --%>
        <br />  
        <asp:Button ID="btnApply" runat="server" Text="Apply" 
            onclick="btnApply_Click" />
        <asp:Button ID="btnback" runat="server" Text="<< Back" OnClientClick="JavaScript:window.history.back(1);return false;" />
        <br />

    </div>
<div id="img_position" >
<img src="../App_Themes/Main/Images/position.JPG""  alt="careers" />
</div>
<div class="clear"></div>



</asp:Content>

