<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" MaintainScrollPositionOnPostback="true"
    AutoEventWireup="true" Inherits="NorthBay.Web.Career.Career_Default" Codebehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Career main page - Display job postings--%>
    <div id="desc1">
        <asp:Label ID="lbl_desc1" runat="server" Text="The North Bay Regional Health Center provides intergrated, hight quality, 
client focused care in its dual role as a district referral hospital and a specialized regional mental health centre for northeast Ontario." />
    </div>
    <br />
    <div id="img_job1">
        <asp:Image ID="image_job1" src="../App_Themes/Main/Images/jobs1.JPG" alt="careers"
            runat="server" />
    </div>
    <div id="img_job2">
        <asp:Image ID="image_job2" src="../App_Themes/Main/Images/jobs3.JPG" alt="careers"
            runat="server" />
    </div>
    <br />
    <br />
    <div id="desc2">
        <asp:Label ID="lbl_desc2" runat="server" Text="For an opportunity to be part of our exciting future, please view our job postings below." /><br />
        <asp:Label ID="lbl_desc3" runat="server" Text="Select the job title to review the full job posting and select 'Apply' to submit your application.We wish to thank all applicants for their interest in our organization. An acknowledgement will be sent only to those candidates who we wish to interview.The North Bay Regional Health Centre is an equal opportunity employer." /><br />
        <asp:Label ID="lbl_desc4" runat="server" Text="Due to the interest and volume of applicants, we are unable to retain all resumes following a job competition. Please feel free to bookmark our site and visit regularly to view our new career opportunities.Career opportunities will be posted until they are filled. " /><br />
    </div>
    <br />
    <br />
    <%-- Filter jobs by  job Category--%>
    <div id="job_posting">
        <asp:Label ID="lbl_jcategory" runat="server" Text="Filter by Job Category" />
        <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" AppendDataBoundItems="true"
            Height="23px" Width="221px" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="">Select All</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <%--  When select a job title ,display details of the selected job --%>
        <asp:GridView ID="gv_career" runat="server" AllowPaging="True" AllowSorting="False"
            AutoGenerateColumns="False" CssClass="view" HeaderStyle-CssClass="header" FieldHeaderStyle-CssClass="fieldHeader"
            AlternatingRowStyle-CssClass="alternating" CommandRowStyle-CssClass="command" PageSize="8"  
            PagerStyle-CssClass="pager" OnPageIndexChanging="gv_career_PageIndexChanging" >
            <Columns>
                <asp:BoundField DataField="CareerId" HeaderText="CareerId" InsertVisible="False"
                    Visible="false" ReadOnly="True" SortExpression="CareerId" />
                <asp:HyperLinkField HeaderText="Title" DataTextField="Title" DataNavigateUrlFields="CareerId"
                    DataNavigateUrlFormatString='~/Career/Details.aspx?Careerid={0}' SortExpression="Title" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="PostDate" DataFormatString="{0:d}" HeaderText="PostDate"
                    SortExpression="PostDate" />
                <asp:BoundField DataField="EndDate" DataFormatString="{0:d}" HeaderText="EndDate"
                    SortExpression="EndDate" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            </Columns>
            <%-- Display message,if there are no jobs availabe  for the selected job title--%>
            <EmptyDataTemplate>
                There are no career positions available at the moment
            </EmptyDataTemplate>
            <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="10" />
            <PagerStyle BackColor="LightBlue" Height="30px" VerticalAlign="Bottom" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
