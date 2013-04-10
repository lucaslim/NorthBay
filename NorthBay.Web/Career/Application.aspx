<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" Inherits="NorthBay.Web.Career.Career_Application" Codebehind="Application.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    

  <%--  Display application form for applying for the selected job--%>
    <div id="application_form">
        <asp:Wizard ID="wzd_form" runat="server" ActiveStepIndex="0">
        
            <FinishNavigationTemplate>
                           
            </FinishNavigationTemplate>

            <StepNavigationTemplate>
                <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                    Text="Previous" /> &nbsp;
                <asp:Button ID="FinishButton" runat="server"  CommandName="MoveNext" 
                OnCommand="subInsert" Text="Submit" />
                

            </StepNavigationTemplate>
            
            <WizardSteps>
                <asp:WizardStep ID="wds_1" runat="server" Title=" " StepType="Start">
                    <asp:Label ID="lbl_start" runat="server" Text="<h2>Applicant Information Form:</h2>" />
                    <table border="0" class="table" cellpadding="3px">
                  <%--  Resume upload------%>
                        <tr>
                            <td>
                                Upload your Resume:
                            </td>
                            <td colspan="4">
                                <asp:FileUpload ID="fupd_FileUpload" runat="server" />&nbsp;<asp:Button ID="btn_Upload"
                                    runat="server" OnClick="btn_Upload_Click" Text="Upload" CausesValidation="false" />
                                <asp:HiddenField ID="hdf_ResumeUrl" Value="" runat="server" />
                                    <br />
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td colspan="4">
                                <asp:Label ID="lbl_UploadStatus" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter Applicant first name--%>
                                <asp:Label ID="lbl_fname" EnableTheming="true" runat="server" Text="Appicant First Name:"></asp:Label>
                            </td>
                            <td colspan="4" width="400px">
                                <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                                <%--Checking if Appicant first name is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname"
                                    Display="Dynamic" Text="*Required" ErrorMessage="First name cannot be blank." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter Applicant last name--%>
                                <asp:Label ID="lbl_lname" runat="server" Text="Applicant Last Name:"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
                                <%--Checking if Applicant last name is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname"
                                    Display="Dynamic" Text="*Required" ErrorMessage="Last name cannot be blank." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter the address --%>
                                
                                <asp:Label ID="lbl_unitno" runat="server" Text="Unit Number:" />
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txt_unitno" runat="server" />
                                <%--Checking if unit number is numeric--%>
                                    <asp:RegularExpressionValidator ID="rev_unit" runat="server" ControlToValidate="txt_unitno" Text="*"
                            Display="Dynamic" ErrorMessage="Unit number must be a numeric value" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"
                                  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_address1" runat="server" Text="Street No/Street Name:" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_streetno" runat="server" />
                            </td>
                            <td>
                                <%--Checking if street number is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_streetno" runat="server" ControlToValidate="txt_streetno"
                                    ErrorMessage="Street number cannot be blank" Text="*Required" />
                                 <%--Checking if street number is numeric--%>
                                    <asp:RegularExpressionValidator ID="rev_streetno" runat="server" ControlToValidate="txt_streetno" Text="*"
                            Display="Dynamic" ErrorMessage="Street number must be a numeric value" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"
                                  />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_streetname" runat="server" />
                            </td>
                            <td>
                                <%--Checking if street number is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_streetname" runat="server" ControlToValidate="txt_streetname"
                                    ErrorMessage="Street name cannot be blank" Text="*Required" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter address -line2--%>
                                <asp:Label ID="lbl_address2" runat="server" Text="City/Province: " />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_city" runat="server" />
                            </td>
                            <td>
                                <%--Checking if city is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city"
                                    ErrorMessage="City cannot be blank" Text="*Required" />
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddl_province" runat="server">
                                    <asp:ListItem Value="AB">Alberta</asp:ListItem>
                                    <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                                    <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                                    <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                                    <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                                    <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                                    <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                                    <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                                    <asp:ListItem  Selected="True" Value="ON">Ontario</asp:ListItem>
                                    <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                                    <asp:ListItem Value="QC">Quebec</asp:ListItem>
                                    <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                                    <asp:ListItem Value="YT">Yukon</asp:ListItem>
                                </asp:DropDownList>
                             
                            </td>
                          
                        </tr>
                        <tr>
                            <td>
                                <%--Enter postal code--%>
                                <asp:Label ID="lbl_pcode" runat="server" Text="Postal code:" AssociatedControlID="txt_pcode" />
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txt_pcode" runat="server" />
                                <%--Checking if postal code is in valid format--%>
                                <asp:RegularExpressionValidator ID="rev_pcode" ControlToValidate="txt_pcode" Text="*"
                                    ValidationExpression="^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}(\-| |){1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$"
                                    ErrorMessage="Please use following postal code formats :X9X-9X9 or X9X 9X9" runat="server" />
                                <%--Checking if postal code is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_pcode" runat="server" ControlToValidate="txt_pcode"
                                    ErrorMessage="Applicant postal code cannot be blank cannot be blank" Text="*Required" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter Applicant telephone number--%>
                                <asp:Label ID="lbl_tpnumber" runat="server" Text="Applicant Telephone number:" AssociatedControlID="txt_tpnumber" />
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txt_tpnumber" runat="server" />
                                <%--Checking if Applicant telephone number is in valid fromat--%>
                                <asp:RegularExpressionValidator ID="rev_tpnumber" Text="*" ControlToValidate="txt_tpnumber"
                                    ValidationExpression="\(?(\d{3})\)?-?(\d{3})-(\d{4})" Display="Dynamic" SetFocusOnError="true"
                                    ErrorMessage="Please use following telepone format :(999)999-9999" runat="server" />
                                <%--Checking if telephone number is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_tpnumber" runat="server" ControlToValidate="txt_tpnumber"
                                    ErrorMessage="Telephone number cannot be blank" Text="*Required" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--Enter Applicant email address--%>
                                <asp:Label ID="lbl_email" runat="server" Text="Applicant Email:" AssociatedControlID="txt_email" />
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txt_email" runat="server" />
                                <%--Checking if email address is blank--%>
                                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email"
                                    ErrorMessage="Email address cannot be blank" Text="*Required" />
                                <%--Checking if Applicant email address is in valid fromat--%>
                                <asp:RegularExpressionValidator ID="rev_email" Text="*" ControlToValidate="txt_email"
                                    ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" Display="Dynamic" SetFocusOnError="true"
                                    ErrorMessage="Please enter valid email address" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </asp:WizardStep>
                <asp:WizardStep ID="wds_2" runat="server" Title=" " OnActivate="wds_2_Activate"  StepType="Step"> <!-- Finish -->
                    <asp:Label ID="lbl_print_hdr" runat="server" Text="<h2>Print Applicant Information</h2>" />
                    <asp:Label ID="lbl_print" runat="server" Text="Label"></asp:Label><br />
                     <asp:Label ID="lbl_message" runat="server" />                    
                </asp:WizardStep>
                 <asp:WizardStep ID="wds_3" runat="server" Title=" " OnActivate="wds_3_Activate" StepType="Finish">
                    <asp:Label ID="lbl_confirmation_hdr" runat="server" Text="<h2>Your application has been submited sucessfully...!</h2>" />
                   <asp:Label ID="lbl_confirmation" runat="server" />

                 </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
        <br />
        <br />
        <asp:ValidationSummary ID="vds_applicant" CssClass="validationsummary" runat="server" HeaderText="Error Summary"
            ShowSummary="true" />
        <asp:Label ID="lbl_submit" runat="server"></asp:Label>
    </div>
</asp:Content>
