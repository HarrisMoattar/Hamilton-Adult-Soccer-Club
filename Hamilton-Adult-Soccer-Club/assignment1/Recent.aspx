<%--Author: Harris Moattar
 ID: 000775608
 Pupose: Modified Recent page of the HASC website with recent game information.--%>
<%@ Page Title="Recent" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recent.aspx.cs" Inherits="assignment1.Recent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %> Scores</h3>
    <%--Grid that displays the recent games played and outputs them from joining the games and teams table.--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="hascSqlDataSource" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="table-condensed" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="game_date" HeaderText="Date" SortExpression="game_date" DataFormatString="{0:d}"></asp:BoundField>
            <asp:BoundField DataField="Expr1" HeaderText="Away" SortExpression="Expr1"></asp:BoundField>
            <asp:BoundField DataField="away_team_score" HeaderText="Score" SortExpression="away_team_score"></asp:BoundField>
            <asp:BoundField DataField="team_name" HeaderText="Home" SortExpression="team_name"></asp:BoundField>
            <asp:BoundField DataField="home_team_score" HeaderText="Score" SortExpression="home_team_score"></asp:BoundField>
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
    <asp:SqlDataSource
        runat="server"
        ID="hascSqlDataSource"
        ConnectionString='<%$ ConnectionStrings:HASCConnectionString %>'
        SelectCommand="SELECT TOP (10) games.game_date, games.home_team_score, games.away_team_score, t1.team_name, t2.team_name AS Expr1 FROM games INNER JOIN teams AS t1 ON t1.team_id = games.home_team_id INNER JOIN teams AS t2 ON t2.team_id = games.away_team_id WHERE (games.home_team_score IS NOT NULL) AND (games.away_team_score IS NOT NULL) ORDER BY games.game_date DESC">
    </asp:SqlDataSource>
</asp:Content>
