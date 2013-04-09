<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Opportunities.aspx.cs" Inherits="NorthBay.Web.Volunteer.Opportunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Volunteer Opportunities
        </div>
        <div id="main_body">
            <asp:DataList runat="server" ID="dl_opportunities" OnItemDataBound="DataList_ItemDataBound"
                RepeatDirection="Horizontal" RepeatColumns="3">
                <ItemTemplate>
                    <div class="volunteer_list_container">
                        <table class="volunteer_list">
                            <tr>
                                <th>
                                    <%# Eval("Name") %>
                                </th>
                            </tr>
                            <asp:Literal runat="server" ID="lit_volunteer"></asp:Literal>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <p>
                Volunteer opportunities are determined by programming needs and availability</p>
            <p>
                Contact the Volunteer Engagement Department for more information.</p>
            <p>
                705-474-8600 ext. 3131
                <br />
                <a href="mailto:volengdept@nbrhc.on.ca">volengdept@nbrhc.on.ca</a>
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph4" runat="server">
</asp:Content>
