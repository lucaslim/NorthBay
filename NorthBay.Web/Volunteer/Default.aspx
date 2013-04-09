<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Volunteer.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Volunteering
        </div>
        <div id="main_sub_header">
            Welcome
        </div>
        <div id="main_body">
            <p>
                Our Volunteer Engagement Team has been working hard to develop new and exciting
                volunteer opportunities at the North Bay Regional Health Centre. Our volunteers
                are dedicated individuals of all ages who are committed to providing support, compassion
                and leadership through volunteerism.
            </p>
            <p>
                The goal of our volunteer program is to promote quality patient care by supporting
                the diverse needs of staff, visitors, patients and their families. As a volunteer
                you will be given every opportunity to stretch your skills, interests and abilities.
            </p>
            <p>
                Join us!
            </p>
            <p>
                If you are interested in becoming part of our dynamic volunteer team, we would love
                to hear from you!
            </p>
            <p>
                We have opportunities available at both our North Bay (district hospital and regional
                mental health) and Sudbury (regional mental health) sites. Please indicate your
                preferred location on your application.
            </p>
            <p>
                Volunteer opportunities are dependant on programming needs and availability. Please
                be advised that only those applicants selected for an interview will be contacted.
                Successful completion of the application process and participation in an interview
                will not guarantee a volunteer placement with the North Bay Regional Health Centre.
            </p>
            <p>
                We thank you in advance for your interest and we look forward to exploring with
                you, a satisfying and rewarding volunteer experience.
            </p>
            <p>
                Click <asp:HyperLink runat="server" ID="hl_view" NavigateUrl="Opportunities.aspx">here</asp:HyperLink> to view all our volunteer opportunities.
            </p>
        </div>
    </div>
</asp:Content>
