<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Masterpage/Main.master"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Career.Default" %>

<%--Career page -Insert , Update and Delete--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 10px;">
        <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <!--Insert a record-->
        <asp:Label ID="lbl_insert" runat="server" Text="Insert a new job posting: " Font-Bold="true"
            Font-Size="18px" />
        <br />
        <asp:Label ID="lbl_TitleI" runat="server" Text="Title" AssociatedControlID="txt_TitleI" />
        <br />
        <asp:TextBox ID="txt_TitleI" runat="server" />
        <!-- check whether the name is not balnk-->
        <asp:RequiredFieldValidator ID="rfv_TitleI" runat="server" Text="*Required" ControlToValidate="txt_TitleI"
            ErrorMessage="Title cannot be blank" ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lbl_DescriptionI" runat="server" Text="Description" AssociatedControlID="txt_DescriptionI" />
        <br />
        <asp:TextBox ID="txt_DescriptionI" runat="server" TextMode="MultiLine" />
        <!-- check whether the description is not balnk-->
        <asp:RequiredFieldValidator ID="rfv_DescriptionI" runat="server" Text="*Required"
            ErrorMessage="Description cannot be blank" ControlToValidate="txt_DescriptionI"
            ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lbl_CategoryI" runat="server" Text="Category" AssociatedControlID="txt_CategoryI" />
        <br />
        <asp:TextBox ID="txt_CategoryI" runat="server" />
        <!-- check whether the job category is  not balnk-->
        <asp:RequiredFieldValidator ID="rfv_CategoryI" runat="server" Text="*Required" ControlToValidate="txt_CategoryI"
            ErrorMessage="Category cannot be blank" ValidationGroup="Insert" Display="Dynamic" />
        <br />
        <asp:Label ID="lbl_PostDateI" runat="server" Text="PostDate" AssociatedControlID="txt_PostDateI" />
        <br />
        <asp:TextBox ID="txt_PostDateI" runat="server" />
        <ajax:CalendarExtender ID="txt_PostDate_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="txt_PostDateI">
        </ajax:CalendarExtender>
        <!-- check whether the postdate is  not balnk-->
        <asp:RequiredFieldValidator ID="rfv_PostDate" runat="server" Text="*Required" ControlToValidate="txt_PostDateI"
            ErrorMessage="Post date cannot be blank" ValidationGroup="Insert" Display="Dynamic" />
        <!-- check whether the post date is valid-->
        <asp:RegularExpressionValidator ID="rev_PostDateI" runat="server" ControlToValidate="txt_PostDateI"
            Text="*" Display="Dynamic" ErrorMessage="Post date format should be MM/DD/YYYY"
            ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/
              (29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
            ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lbl_EndDateI" runat="server" Text="EndDate" AssociatedControlID="txt_EndDateI" />
        <br />
        <asp:TextBox ID="txt_EndDateI" runat="server" />
        <ajax:CalendarExtender ID="txt_EndDate_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="txt_EndDateI">
        </ajax:CalendarExtender>
        <!-- check whether the enddate is not balnk-->
        <asp:RequiredFieldValidator ID="rfv_EndDate" runat="server" Text="*Required" ControlToValidate="txt_EndDateI"
            ErrorMessage="End date cannot be blank" ValidationGroup="Insert" Display="Dynamic" />
        <!-- check whether the post date is valid-->
        <asp:RegularExpressionValidator ID="rev_EndDateI" runat="server" ControlToValidate="txt_EndDateI"
            Text="*" Display="Dynamic" ErrorMessage="End date format should be MM/DD/YYYY"
            ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/
              (29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
            ValidationGroup="Insert" />
        <br />
        <asp:Label ID="lbl_StatusI" runat="server" Text="Status" AssociatedControlID="rbl_StatusI" />
        <asp:RadioButtonList ID="rbl_StatusI" runat="server">
            <asp:ListItem Selected="True" Text="Active" Value="1" />
            <asp:ListItem Text="Inactive" Value="0" />
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin"
            ValidationGroup="Insert" />
        <br />
        <br />
        <asp:ValidationSummary ID="vds_career_insert" CssClass="validationsummary" ValidationGroup="Insert"
            runat="server" HeaderText="Error Summary" ShowSummary="true" />
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
                        <th style="width: 150px">
                            <asp:Label ID="lbl_Category" runat="server" Text="Category" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_PostDate" runat="server" Text="PostDate" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_EndDate" runat="server" Text="EndDate" />
                        </th>
                        <th style="width: 50px">
                            <asp:Label ID="lbl_Status" runat="server" Text="Status" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_option1" runat="server" Text="Option" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <!--Update & delete a record-->
                    <asp:DataList ID="dtl_all" runat="server">
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
                                    <asp:TextBox ID="txt_Category" runat="server" Text='<%#Eval("Category")%>' TextMode="MultiLine"
                                        Style="margin-left: 3px; width: 150px;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_PostDate" runat="server" Text='<%#Eval("PostDate", "{0:MM/dd/yyyy}")%>'
                                        Style="margin-left: 5px; width: 100px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_EndDate" runat="server" Text='<%#Eval("EndDate", "{0:MM/dd/yyyy}")%>'
                                        Style="margin-left: 5px; width: 100px" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="ckb_Status" Enabled="false" Checked='<%#Eval("Active")%>' runat="server"
                                        Style="margin-left: 14px;" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update"
                                        CommandArgument='<%#Eval("CareerId")%>' OnCommand="subAdmin" Style="margin-left: 30px;" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"
                                        CommandArgument='<%#Eval("CareerId")%>' OnCommand="subAdmin" Style="margin-left: 5px;" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
        </asp:Panel>
        <%-- Display records for updating--%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Career">
            <table cellpadding="2" cellspacing="5">
                <thead style="font-weight: bolder; background-color: #d3d3d3;">
                    <tr>
                        <th style="width: 150px">
                            <asp:Label ID="lbl_TitleU" runat="server" Text="Title" />
                        </th>
                        <th style="width: 180px">
                            <asp:Label ID="lbl_DescriptionU" runat="server" Text="Description" TextMode="MultiLine" />
                        </th>
                        <th style="width: 150px">
                            <asp:Label ID="lbl_CategoryU" runat="server" Text="Category" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_PostDateU" runat="server" Text="PostDate" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_EndDateU" runat="server" Text="EndDate" />
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="lbl_StatusU" runat="server" Text="Status" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:DataList ID="dtl_update" CellSpacing="5" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 150px;">
                                    <asp:HiddenField ID="hdf_CareerId" runat="server" Value='<%#Eval("CareerId")%>' />
                                    <asp:TextBox ID="txt_TitleU" runat="server" Text='<%#Eval("Title")%>' />
                                </td>
                                <td style="width: 180px;">
                                    <asp:TextBox ID="txt_DescriptionU" runat="server" Text='<%#Eval("Description")%>'
                                        TextMode="MultiLine" />
                                </td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="txt_CategoryU" runat="server" Text='<%#Eval("Category")%>' />
                                </td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="txt_PostDateU" runat="server" Columns="100" Width="75px" Text='<%#Eval("PostDate", "{0:MM/dd/yyyy}")%>' />
                                    <ajax:CalendarExtender ID="txt_PostDateU_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txt_PostDateU">
                                    </ajax:CalendarExtender>
                                </td>
                                <td style="margin-left: 10px; width: 100px">
                                    <asp:TextBox ID="txt_EndDateU" runat="server" Width="75px" Columns="100" Text='<%#Eval("EndDate", "{0:MM/dd/yyyy}")%>' />
                                    <ajax:CalendarExtender ID="txt_EndDateU_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txt_EndDateU">
                                    </ajax:CalendarExtender>
                                </td>
                                <td style="width: 100px">
                                    <asp:CheckBox ID="ckb_StatusU" Checked='<%#Eval("Active")%>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <!-- check whether the job title is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_TitleU" runat="server" Text="*Required" ControlToValidate="txt_TitleU"
                                        ErrorMessage="Title cannot be blank" ValidationGroup="update" />
                                </td>
                                <td>
                                    <!-- check whether the job description is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_DescriptionU" runat="server" Text="*Required"
                                        ErrorMessage="Description cannot be blank" ControlToValidate="txt_DescriptionU"
                                        ValidationGroup="update" />
                                </td>
                                <td>
                                    <!-- check whether the job category is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_CategoryU" runat="server" Text="*Required" ControlToValidate="txt_CategoryU"
                                        ErrorMessage="Category cannot be blank" ValidationGroup="update" Display="Dynamic" />
                                </td>
                                <td>
                                    <!-- check whether the job posting starting date is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_PostDateU" runat="server" Text="*Required" ControlToValidate="txt_PostDateU"
                                        ErrorMessage="Post date cannot be blank" ValidationGroup="update" Display="Dynamic" />
                                    <!-- check whether the post date is valid-->
                                    <asp:RegularExpressionValidator ID="rev_PostDateU" runat="server" ControlToValidate="txt_PostDateU"
                                        Text="*" Display="Dynamic" ErrorMessage="Post date format should be MM/DD/YYYY"
                                        ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/
              (29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
                                        ValidationGroup="update" />
                                </td>
                                <td>
                                    <!-- check whether the job posting ending  date is not blank-->
                                    <asp:RequiredFieldValidator ID="rfv_EndDateU" runat="server" Text="*Required" ControlToValidate="txt_EndDateU"
                                        ErrorMessage="End date cannot be blank" ValidationGroup="update" Display="Dynamic" />
                                    <!-- check whether the end date is valid-->
                                    <asp:RegularExpressionValidator ID="rev_EndDateU" runat="server" ControlToValidate="txt_EndDateU"
                                        Text="*" Display="Dynamic" ErrorMessage="End date format should be MM/DD/YYYY"
                                        ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/
              (29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$"
                                        ValidationGroup="update" />
                                </td>
                                <td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_doUpdate" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
            <asp:ValidationSummary ID="vds_event_insert" CssClass="validationsummary" ValidationGroup="update"
                runat="server" HeaderText="Error Summary" ShowSummary="true" />
        </asp:Panel>
        <%-- Delete the selected record--%>
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete a  Career">
            <table cellpadding="2" cellspacing="5">
                <thead style="font-weight: bolder;">
                    <tr>
                        <td colspan="3" align="center" style="color: Red;">
                            <asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this job?" />
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
                            <asp:Label ID="lbl_CategoryD" runat="server" Text="Category" />
                        </th>
                        <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_PostDateD" runat="server" Text="PostDate" />
                        </th>
                        <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_EndDateD" runat="server" Text="EndDate" />
                        </th>
                        <th style="width: 100px; background-color: #d3d3d3;">
                            <asp:Label ID="lbl_StatusD" runat="server" Text="Status" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:DataList ID="dtl_delete" runat="server" CellPadding="2" CellSpacing="5" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 150px;">
                                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("CareerId")%>' />
                                    <asp:Label ID="lbl_jobTitleD" runat="server" Text='<%#Eval("Title")%>' />
                                </td>
                                <td style="width: 180px;">
                                    <asp:Label ID="lbl_jobDescriptionD" runat="server" Text='<%#Eval("Description")%>' />
                                </td>
                                <td style="width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_jobCategoryD" runat="server" Text='<%#Eval("Category")%>' />
                                </td>
                                <td style="width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_jobPostDateD" runat="server" Text='<%#Eval("PostDate", "{0:MM/dd/yyyy}")%>' />
                                </td>
                                <td style="width: 100px;">
                                    <asp:Label Style="width: 100px;" ID="lbl_jobEndDateD" runat="server" Text='<%#Eval("EndDate", "{0:MM/dd/yyyy}")%>' />
                                </td>
                                <td style="padding-left: 35px; width: 100px;">
                                    <asp:CheckBox ID="ckb_Status" Enabled="false" Checked='<%#Eval("Active")%>' runat="server" />
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
                    </asp:DataList>
                </tbody>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
