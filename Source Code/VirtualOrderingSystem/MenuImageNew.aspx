<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="MenuImageNew.aspx.cs" Inherits="VirtualOrderingSystem.MenuImageNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
    <br />
    <asp:TextBox ID="txtTitle" runat="server" AutoPostBack="True" OnTextChanged="txtTitle_TextChanged"></asp:TextBox>
    <asp:Label ID="lblETitle" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Menu"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlMenu" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
    <asp:Label ID="lblEMenu" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [Id], [Name] FROM [Menu]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
    <br />
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Select Image"></asp:Label>
    <br />
    <asp:FileUpload ID="fleImage" runat="server" />
    <asp:Label ID="lblEImage" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
</asp:Content>
