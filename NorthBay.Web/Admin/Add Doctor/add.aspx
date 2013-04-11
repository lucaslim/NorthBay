<%@ Page Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="NorthBay.Web.Admin.Add_Doctor.add" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border=0 style="text-align:center;">
    <tr><td>
                <%--adding doctors profile--%>
                <%--Getting name and validating--%>
                Name :</td>
                <td><asp:TextBox runat="server" ID="txt_dr_name" Height="20"/></td>
                <td><asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="txt_dr_name" /></td> 
                <td><asp:RegularExpressionValidator ID="rev_name" runat="server" ValidationGroup="add_doctor" ValidationExpression="[a-zA-Z ]*[^!@%~?.:#$%^&*()'0123456789]*" ErrorMessage="Not a valid name" ControlToValidate="txt_dr_name" /></td>
                </tr>
            <tr>
            <td>
                <%--Accepting phone number--%>
                Contact # :<p style="color:Gray; font-size:small;">Format 123-456-7890</p></td>
               <td> <asp:TextBox runat="server" ID="txt_contact" Height="20"/></td>
                <td><asp:RequiredFieldValidator ID="rfv_contact" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="txt_contact" /></td>
                <td><asp:RegularExpressionValidator ID="rev_contact" runat="server" ValidationGroup="add_doctor" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Not a valid Phone #" ControlToValidate="txt_contact" /></td>
            </tr>    
            <tr><td>
                <%--Accepting email id--%>
                Email :</td>
                <td><asp:TextBox ID="txt_email" runat="server" Height="20"/></td>
                <td><asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="* Required" ControlToValidate="txt_email" ValidationGroup="add_doctor"/></td>
                <td><asp:RegularExpressionValidator ID="rev_email" runat="server" ValidationGroup="add_doctor" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ErrorMessage="Not a valid email" ControlToValidate="txt_email" /></td>
            </tr>
            <tr><td>
                Designation :</td>

                <td><asp:TextBox ID="txt_designation" runat="server" Height="20"/></td>
            <td><asp:RequiredFieldValidator ID="rfv_desi" runat="server" Text="* Required" ControlToValidate="txt_designation" ValidationGroup="add_doctor"/></td>
         </tr>
            <tr><td>
                Qualification :</td>
                <td><asp:TextBox ID="txt_qualification" runat="server" Height="20"/></td>
                <td><asp:RequiredFieldValidator ID="rfv_quali" runat="server" Text="* Required" ControlToValidate="txt_qualification" ValidationGroup="add_doctor"/></td>
                <td><asp:RegularExpressionValidator ID="rev_qualification" runat="server" ValidationGroup="add_doctor" ValidationExpression="[a-zA-Z. ]*[^!@%~?:#$%^&*()'0123456789]*" ErrorMessage="Not a valid email" ControlToValidate="txt_qualification" /></td>
            </tr>
            <tr><td>
                Join Date :</td>
                <td><asp:TextBox ID="txt_date" runat="server" ValidationGroup="add_doctor" Height="20"/></td>
                <td><asp:RequiredFieldValidator ID="rfv_date" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="txt_date" /></td>
                <%--<asp:Calendar ID="join /_date" runat="server" />--%>
            </tr>
            <tr><td>
                Department ID :</td>
                <td><asp:TextBox ID="txt_departmentID" runat="server" Height="20" /></td>
                <td><asp:RequiredFieldValidator ID="rfv_dept" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="txt_departmentID" /></td>
            </tr>
            <tr><td>
                Biography :</td>
                <td><asp:TextBox ID="txt_biography" TextMode="MultiLine" ValidationGroup="add_doctor" runat="server" Rows="6" /></td>
                <td><asp:RequiredFieldValidator ID="rfv_bio" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="txt_biography" /></td>
            </tr>
            <tr><td>
            <%--Image uploader--%>
                Image :</td>
                 <td><asp:FileUpload ID="upload_image" runat="server" BackColor="#ffffcc"/></td>
                 <td><asp:RequiredFieldValidator ID="rfv_image" runat="server" Text="* Required" ValidationGroup="add_doctor" ControlToValidate="upload_image" /></td>

            </tr>
            
            <tr><td></td>
            <%--Button to add it into database--%>
            <td><asp:Button ID="submit" runat="server" Text="Add" OnClick="btn_submit" ValidationGroup="add_doctor"/></td>
            </tr>
            
    </table>  
    <%--label to diaplay message--%> 
        <asp:Label ID="lbl_message1" runat="server"></asp:Label>
    
    <%--Label to display message for the below panel--%>
    <asp:Label ID="lbl_message" runat="server" Text="" />

    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Doctors">
    
        <table>
            <thead>
                <tr>
                    <td>Image</td>
                    <td>Doctor Name</td>
                    <td>Contact No</td>
                    <td>Email - Id</td>
                    <td> option</td>
                    <td> option</td>
                </tr>
            </thead>
            <tbody>
            <%--Repeater to perform update and delete--%>
            <asp:Repeater ID="rpt_all" runat="server">
                <ItemTemplate>
                <tr>
                <%--Displaying the image --%>
                <td><img id="image" runat="server" src='<%#Eval("ProfileImage") %>' width="70" height="70" alt='<%#Eval("DoctorName") %>'/></td>
                <td><%#Eval("DoctorName") %></td>
                <td><%#Eval("EmailId") %></td>
                <td><%#Eval("ContactNo") %></td>
                <%--button for update--%>
                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("DoctorId") %>' OnCommand="subAdmin" /></td>
                <%--Button for delete--%>
                <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandArgument='<%#Eval("DoctorId") %>' CommandName="Delete" OnCommand="subAdmin"/></td>
                </tr>
                </ItemTemplate>
            </asp:Repeater>
            </tbody>
        </table>
    
    </asp:Panel>
    <%--second panel for update--%>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Doctors Profile">
        <table>
            
            <tbody>

                <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subDel">
                    <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("DoctorId") %>' />
                            <td>Doctor name :</td><td><asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("DoctorName") %>' /></td></tr>
                        <tr><td>contact no :</td><td><asp:TextBox ID="txt_contactnoU" runat="server" Text='<%#Eval("ContactNo") %>' /></td></tr>
                        <tr><td>email :</td><td><asp:TextBox ID="txt_emailU" runat="server" Text='<%#Eval("EmailId") %>' /></td></tr>
                            <tr><td>designation :</td><td><asp:TextBox ID="txt_designationU" runat="server" Text='<%#Eval("Designation") %>' /></td></tr>
                            <tr><td>qualification :</td><td><asp:TextBox ID="txt_QualificationU" runat="server" Text='<%#Eval("Qualification") %>' /></td></tr>
                            <tr><td>joindate :</td><td><asp:TextBox ID="txt_joindateU" runat="server" Text='<%#Eval("JoinDate") %>' /></td></tr>
                            <tr><td>departmentid :</td><td><asp:TextBox ID="txt_departmentidU" runat="server" Text='<%#Eval("DepartmentId") %>' /></td></tr>
                            <tr><td>biography :</td><td><asp:TextBox ID="txt_biographyU" TextMode="MultiLine" Rows="6" runat="server" Text='<%#Eval("Biography") %>' /></td></tr>
                            <tr><td>Image :</td><td><asp:FileUpload ID="txt_profileimageU" runat="server" /></td></tr>
                        
                        <tr>
                          <td>
                            <asp:Button ID="btn_doUpdate" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_cancel" runat="server" CommandName="Cancel" Text="Cancel" />
                          </td>
                        </tr>
                    </ItemTemplate>
                    
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>
    <%--Delete Panel--%>
    <asp:Panel ID="pnl_delete" runat="server">
        <table>
            <thead>
            <tr><td>
                are you sure you want to delete?</td></tr>
            </thead>

            <tbody>
                <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subDel">
                <ItemTemplate>
               <tr>     <td><asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("DoctorId") %>' /></td></tr>
               <tr><td><asp:Button ID="btn_doDelete" runat="server" Text="Delete" CommandName="Delete" />
               <asp:Button ID="btn_doCancel" runat="server" Text="Cancel" CommandName="Cancel" /> </td></tr>
</ItemTemplate>
                </asp:Repeater>
            </tbody>

        </table>
    
    </asp:Panel>
    </asp:Content>
