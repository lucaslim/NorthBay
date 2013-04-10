<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="true" Inherits="NorthBay.Web.Event.Event_EventDetails" Codebehind="EventDetails.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- When click the event display the details of the event-->
<h3>Event Details</h3>
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
     <asp:BoundField DataField="EventId" HeaderText="EventId" 
                Visible="false" ReadOnly="True" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />     
        <asp:BoundField DataField="EventDate" DataFormatString="{0:d}" HeaderText="EventDate" 
            SortExpression="EventDate" />           
               <asp:ImageField DataImageUrlField="ImageUrl"  HeaderText="" 
            />     
    </Fields>
</asp:DetailsView>
<%-- When click goto prvious page --%>
        <br />  
             <asp:Button ID="btnback" runat="server" Text="<< Back" OnClientClick="JavaScript:window.history.back(1);return false;" />
        <br />

    </div>
    <div class="clear"></div>

</asp:Content>

