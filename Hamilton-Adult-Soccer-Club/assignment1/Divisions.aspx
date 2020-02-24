<%--Author: Harris Moattar
 ID: 000775608
 Pupose: Modified Divisions page of the HASC website with Divisions table.--%>
<%@ Page Title="Divisions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Divisions.aspx.cs" Inherits="assignment1.Divisions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <h3>HASC features the following divisions.</h3>
    <%--Grid is used to diplay the divisons from the tables.--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="hascSqlDataSource" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="table-condensed" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="division_name" HeaderText="Division" SortExpression="division_name"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="hascSqlDataSource" ConnectionString='<%$ ConnectionStrings:HASCConnectionString %>' SelectCommand="SELECT [division_name] FROM [divisions] ORDER BY [division_name] ASC"></asp:SqlDataSource>
    <p><br />Age is determined as of March 1 of each year.</p>
</asp:Content>
