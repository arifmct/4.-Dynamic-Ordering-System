<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="VirtualOrderingSystem.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-flude row" style="padding:20px; padding-top:150px;">
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="menuItem col-md-3">
                <h2><%# Eval("Name") %></h2>
                <img src="Uploads/MenuImages/<%# Eval("image") %>" height="150px" />
                <span><%# Eval("Category") %></span>
                <span><%# Eval("Price") %>, <%# Eval("Unit") %></span>
                <p><%# Eval("Description") %></p>
            </div>
        </ItemTemplate>

    </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM vwMenu"></asp:SqlDataSource>
</asp:Content>
