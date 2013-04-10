<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Masterpage/Main.master" CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Event.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--Event page -Insert , Update and Delete--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="lbl_message" Style="color: Green" runat="server" />
        <br />
        <br />
        <!--Insert a record-->
        <asp:Label ID="lbl_insert" runat="server" Text="Insert a new event: " Font-Bold="true"
            Font-Size="18px" />
        <br />
        <asp:Label ID="lbl_TitleI" runat="server" Text="Title" AssociatedControlID="txt_TitleI" />
        <br />
        <asp:TextBox ID="txt_TitleI" runat="server" />
        <!-- check whether the title is not balnk-->
        <asp:RequiredFieldValidator ID="rfv_TitleI" runat="server" Text="*Required"  ErrorMessage="Title cannot be blank" ControlToValidate="txt_TitleI"
            ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lbl_DescriptionI" runat="server" Text="Description" AssociatedControlID="txt_DescriptionI" />
        <br />
        <asp:TextBox ID="txt_DescriptionI" runat="server" TextMode="MultiLine" />
        <!-- check whether the description is not balnk-->
        <asp:RequiredFieldValidator ID="rfv_DescriptionI"  ErrorMessage="Description cannot be blank" runat="server" Text="*Required"
            ControlToValidate="txt_DescriptionI" ValidationGroup="Insert" />
       
       
        <br />
        <asp:Label ID="lbl_EventDateI" runat="server" Text="Event Date" AssociatedControlID="txt_EventDateI" />
        <br />
        <asp:TextBox ID="txt_EventDateI" runat="server" />
        <asp:CalendarExtender ID="txt_EventDate_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="txt_EventDateI">
        </asp:CalendarExtender>
        <!-- check whether the event date is  not balnk-->
        <asp:RequiredFieldValidator ID="rfv_EventDateI" runat="server" Text="*Required" ErrorMessage="Event date cannot be blank" ControlToValidate="txt_EventDateI"
            ValidationGroup="Insert" Display="Dynamic" />
        <!-- check whether the event date is valid-->
        <asp:RegularExpressionValidator ID="rev_EventDateI" runat="server" ControlToValidate="txt_EventDateI" Text="*"
              Display="Dynamic" ErrorMessage="Date format should be MM/DD/YYYY" ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/
              (29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
              ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lblImageUrlI" runat="server" Text="Image Url" AssociatedControlID="txt_ImageUrlI" />
        <br />
        <asp:TextBox ID="txt_ImageUrlI" runat="server" />
         <br />
        <asp:Label ID="lbl_EventTypeI" runat="server" Text="Event Type" AssociatedControlID="txt_EventTypeI" />
        <br />
        <asp:TextBox ID="txt_EventTypeI" runat="server" />

        <!-- check whether the job event type is  not balnk-->
        <asp:RequiredFieldValidator ID="rfv_EventTypeI" runat="server" Text="*Required" ErrorMessage="Event type cannot be blank" ControlToValidate="txt_EventTypeI"
            ValidationGroup="Insert" Display="Dynamic" />
             <!-- check whether the event date is valid-->
         <asp:RegularExpressionValidator ID="rev_EventTypeI" runat="server" ControlToValidate="txt_EventTypeI" Text="*"
              Display="Dynamic" ErrorMessage="Please enter a numberic value " ValidationExpression="^[0-9]+$"
              ValidationGroup="Insert" />
              <br />
        <br />
              <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin"
            ValidationGroup="Insert" />

        <br />
        <br />
        <asp:Panel ID="pnl_all" runat="server" GroupingText="All Jobs">
            <table cellpadding="3" cellspacing="5">
                <thead style="font-weight: bolder; background-color: #d3d3d3;">
                    <tr>
                        <th style="width: 150px">
                            <asp:Label ID="lbl_Title" runat="server" Text="Title" />
                        </th>
                        <th style="width: 180px">
                            <asp:Label ID="lbl_Description" runat="server" Text="Description" />
                        </th>
                                             <th style="width: 100px">
                            <asp:Label ID="lbl_EventDate" runat="server" Text="Event Date" />
                        </th>
                        <th style="width: 50px">
                            <asp:Label ID="lbl_ImageUrl" runat="server" Text="Image Link" />
                        </th>
                        <th style="width: 75px">
                            <asp:Label ID="lbl_EventType" runat="server" Text="Event Type" />
                        </th>
      
                    </tr>
                </thead>
                <tbody>
                <asp:ValidationSummary ID="vds_event_insert" CssClass="validationsummary" ValidationGroup="Insert"
            runat="server" HeaderText="Error Summary" ShowSummary="true" />

                    <!--Update & delete a record-->

                    
                     <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                               
                                
                                
                                <td>
                                    <asp:TextBox ID="txt_Title" runat="server" Text='<%#Eval("Title")%>' Style="margin-left: 5px;
                                        width: 150px;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Description" runat="server" Text='<%#Eval("Description")%>'
                                        TextMode="MultiLine" Style="width: 180px;" />
                                </td>
                            
                                <td>
                                    <asp:TextBox ID="txt_EventDate" runat="server" Text='<%#Eval("EventDate", "{0:MM/dd/yyyy}")%>'
                                        Style="margin-left: 5px; width: 100px" />
                                   
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ImageUrl" runat="server" Text='<%#Eval("ImageUrl")%>'
                                        Style="margin-left: 5px; width: 200px" />
                                  
                                </td>
                               <td>
                                    <asp:TextBox ID="txt_EventType" runat="server" Text='<%#Eval("EventType")%>'
                                        Style="margin-left: 5px; width: 75px" />
                                  
                                </td>
                                <td>
                                    <asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update"
                                        CommandArgument='<%#Eval("EventId")%>' OnCommand="subAdmin" style="margin-left:30px;" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"
                                        CommandArgument='<%#Eval("EventId")%>' OnCommand="subAdmin" style="margin-left:5px;" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
       <%-- Display records for updating--%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Event">
            <table cellpadding="2" cellspacing="5">
                <thead style="font-weight: bolder; background-color: #d3d3d3;">
                    <tr>
                        <th style="width: 150px">
                            <asp:Label ID="lbl_TitleU" runat="server" Text="Title" />
                        </th>
                        <th style="width: 180px">
                            <asp:Label ID="lbl_DescriptionU" runat="server" Text="Description" TextMode="MultiLine" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_EventDateU" runat="server" Text="EventDate" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_ImageUrlU" runat="server" Text="Image Url" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_EventTypeU" runat="server" Text="Event Type" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_update"  runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 150px;">
                                    <asp:HiddenField ID="hdf_EventId" runat="server" Value='<%#Eval("EventId")%>' />
                                    <asp:TextBox ID="txt_TitleU" runat="server" Text='<%#Eval("Title")%>' />
                                </td>
                                <td style="width: 180px;">
                                    <asp:TextBox ID="txt_DescriptionU" runat="server" Text='<%#Eval("Description")%>'
                                        TextMode="MultiLine" />
                                </td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="txt_EventDateU" runat="server" Columns="100" Width="75px" Text='<%#Eval("EventDate", "{0:MM/dd/yyyy}")%>' />
                                    <asp:CalendarExtender ID="txt_PostDateU_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txt_EventDateU">
                                    </asp:CalendarExtender>
                                </td>
                                  <td style="width: 100px">
                                    <asp:TextBox ID="txt_ImageUrlU" runat="server" Text='<%#Eval("ImageUrl")%>' />
                                </td>
                                <td style="width: 100px">
                                       <asp:TextBox ID="txt_EventTypeU" runat="server" Text='<%#Eval("EventType")%>' />                                 
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                 <!-- check whether the event title is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_TitleU" runat="server" Text="*Required" ErrorMessage="Title cannot be blank" ControlToValidate="txt_TitleU"
                                        ValidationGroup="update" />
                                </td>
                                <td>
                                <!-- check whether the description is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_DescriptionU" runat="server"  ErrorMessage="Description cannot be blank" Text="*Required"
                                        ControlToValidate="txt_DescriptionU" ValidationGroup="update" />
                                </td>
                               
                                <td>
                                <!-- check whether the event date is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_EventDateU" runat="server" Text="*Required"  ErrorMessage="Event date cannot be blank" ControlToValidate="txt_EventDateU"
                                        ValidationGroup="update" Display="Dynamic" />
                                 <!-- check whether the event date is valid-->
                                    <asp:RegularExpressionValidator ID="rev_EventDateU" runat="server" ControlToValidate="txt_EventDateU" Text="*"
                                Display="Dynamic" ErrorMessage="Date format should be MM/DD/YYYY" ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])
                                /(29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
                                ValidationGroup="update" />
                                </td>
                               <td>
                                
                                </td>
                                 <td>
                                <!-- check whether the event type is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_EventTypeU" runat="server" Text="*Required" ErrorMessage="Event type cannot be blank" ControlToValidate="txt_EventTypeU"
                                        ValidationGroup="update" Display="Dynamic" />
                                         <!-- check whether the event date is valid-->
                                    <asp:RegularExpressionValidator ID="rev_EventTypeU" runat="server" ControlToValidate="txt_EventTypeU" Text="*"
                                Display="Dynamic" ErrorMessage="Please enter a numberic value " ValidationExpression="^[0-9]+$"
                                ValidationGroup="update" />
                                </td>    
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_doUpdate" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
               
            </table>
             <asp:ValidationSummary ID="vds_event_update" CssClass="validationsummary" ValidationGroup="update"
            runat="server" HeaderText="Error Summary" ShowSummary="true" />
        </asp:Panel>
       <%-- Delete the selected record--%>
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete a  Career">
            <table cellpadding="2" cellspacing="5">
                <thead style="font-weight: bolder;">
                    <tr>
                        <td colspan="3" align="center" style="color: Red;">
                            <asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this event?" />
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 150px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_TitleD" runat="server" Text="Title" />
                        </th>
                        <th style="width: 180px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_DescriptionD" runat="server" Text="Description" />
                        </th>
                       
                        <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_EventDateD" runat="server" Text="EventDate" />
                        </th>
                         <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_ImageUrlD" runat="server" Text="Image Url" />
                        </th>
                        <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_EventTypeD" runat="server" Text="Event Type" />
                        </th>                      
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_delete" runat="server"  OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 150px;">
                                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("EventId")%>' />
                                    <asp:Label ID="lbl_EventTitleD" runat="server" Text='<%#Eval("Title")%>' />
                                </td>
                                <td style="width: 180px;">
                                    <asp:Label ID="lbl_EventDescriptionD" runat="server" Text='<%#Eval("Description")%>' />
                                </td>
                             
                                <td style="width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_EventDateD" runat="server" Text='<%#Eval("EventDate", "{0:MM/dd/yyyy}")%>' />
                                </td>
                                   <td style="width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_ImageUrlD" runat="server" Text='<%#Eval("ImageUrl")%>' />
                                </td>
                            
                                <td style="padding-left:35px; width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_EventType" runat="server" Text='<%#Eval("EventType")%>' />
                                 
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_doDelete" runat="server" Text="Delete" CommandName="Delete" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_doCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                </td>
                            </tr>
                        </ItemTemplate>
                   </asp:Repeater>
                </tbody>
                
            </table>
            
        </asp:Panel>
    </div>
  </asp:Content>
