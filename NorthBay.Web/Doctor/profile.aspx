<%@ Page Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="NorthBay.Web.Doctor.profile" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>--%>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:GridView runat="server" ID="grd_all" Width="80%"  ShowHeader="false" BorderWidth="0" BorderStyle="None" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField ItemStyle-width = "20%" ItemStyle-VerticalAlign="Top" ItemStyle-BorderWidth="0" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <h4><img ID="item_name" runat="server" src='<%#Eval("ProfileImage")%>' alt="" height="100" width="100" /></h4>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="" ItemStyle-BorderStyle="None">
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-BorderStyle="None" ItemStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            
                            <div>
                            <table width="100%" border=0>
                            <tr><td   style="vertical-align:top;">Name : </td> <td  style="vertical-align:top;"><%#Eval("DoctorName") %></td></tr>
                            <tr><td  style="vertical-align:top;">Contact No : </td> <td  style="vertical-align:top;"><%#Eval("ContactNo") %></td> </tr>
                            <tr><td  style="vertical-align:top;">Email Id : </td> <td  style="vertical-align:top;"><%#Eval("EmailId") %></td> </tr>
                            <tr><td  style="vertical-align:top; width:100px;">Designation :</td><td  style="vertical-align:top;"><%#Eval("Designation") %></td></tr>
                            <tr><td  style="vertical-align:top;">Qualification :</td><td   style="vertical-align:top;"><%#Eval("Qualification") %></td></tr>
                            <tr><td  style="vertical-align:top;">Biogragpy :</td><td><%#Eval("Biography") %></td></tr></table>
                            </div>
                            <br /><br /><br />
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-BorderStyle="None" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                
                </asp:GridView>
                </asp:Content>
    <%--</div>
    </form>
</body>
</html>--%>
