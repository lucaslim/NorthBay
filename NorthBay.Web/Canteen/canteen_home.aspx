<%@ Page Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="canteen_home.aspx.cs" Inherits="NorthBay.Web.Canteen.canteen_home" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div style="position:absolute; float:left;">--%>
         <asp:Panel ID="pnl_all" runat="server">
                
                <asp:GridView runat="server" ID="grd_all" OnRowCommand="orc_canteen" ShowHeader="false" BorderWidth="0" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField ItemStyle-width = "40%" ItemStyle-VerticalAlign="Top" ItemStyle-BorderWidth="0" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                            <asp:HiddenField ID="item_id" runat="server" Value='<%#Eval ("itemID") %>' />
                                <h4><asp:Label ID="item_name" runat="server" Text='<%#Eval("item_name") %>' /></h4>
                                <p style="font-size:small;"><asp:Label ID="item_description" runat="server" Text='<%#Eval("item_description") %>' /></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-BorderWidth="0" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                $<asp:Label ID="item_price" runat="server" Text='<%#Eval("item_price") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                
                </asp:GridView>

         </asp:Panel>
         <%--</div>--%>
         </asp:Content>
