<%--Author: Harris Moattar
 ID: 000775608
 Pupose: Modified New Score page of the HASC website giving the refrees a method to modify the game scores.--%>
<%@ Page Title="NewScore" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewScore.aspx.cs" Inherits="assignment1.NewScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Enter a New Score</h3>
    <p>Refree: 
        <%--Dropdown list connected to the refferee names and is used to select the data for the upcoming grid--%>
        <asp:DropDownList
            ID="DropDownList1"
            runat="server"
            DataSourceID="refereeSqlDataSource1"
            DataTextField="Column1"
            DataValueField="person_id" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource 
            runat="server" 
            ID="refereeSqlDataSource1" 
            ConnectionString='<%$ ConnectionStrings:HASCConnectionString %>' 
            SelectCommand="select person_id, CONCAT(first_name, ' ', last_name)
            FROM persons
            Where referee_experience IS NOT NULL">
        </asp:SqlDataSource>
    </p>
    <%--Grid used to collect data of the game observed by the referee and output them so they can be edited--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="game_id" DataSourceID="refereeScoreSqlDataSource1" CssClass="table-condensed" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="game_id" HeaderText="ID" ReadOnly="True" SortExpression="game_id"></asp:BoundField>
            <asp:BoundField DataField="game_date" HeaderText="Date" SortExpression="game_date" DataFormatString="{0:d}" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="field" HeaderText="Field" SortExpression="field" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="home_team_id" HeaderText="Home Team ID" SortExpression="home_team_id" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="home_team_score" HeaderText="Score" SortExpression="home_team_score"></asp:BoundField>
            <asp:BoundField DataField="away_team_id" HeaderText="Away Team ID" SortExpression="away_team_id" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="away_team_score" HeaderText="Score" SortExpression="away_team_score"></asp:BoundField>
            <asp:BoundField DataField="game_notes" HeaderText="Game Notes" SortExpression="game_notes"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="White"></RowStyle>

        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
    </asp:GridView>

    <asp:SqlDataSource
        runat="server"
        ID="refereeScoreSqlDataSource1"
        ConnectionString='<%$ ConnectionStrings:HASCConnectionString %>'
        SelectCommand="SELECT [game_id], [game_date], [field], [home_team_id], [away_team_id], [home_team_score], [away_team_score], [game_notes] FROM [games] WHERE ([referee_id] = @referee_id And (home_team_score IS NULL OR away_team_score IS NULL)) ORDER BY [game_date] ASC" UpdateCommand="UPDATE games SET home_team_score = @home_team_score, away_team_score = @away_team_score, game_notes = @game_notes WHERE (game_id = @game_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="referee_id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="home_team_score"></asp:Parameter>
            <asp:Parameter Name="away_team_score"></asp:Parameter>
            <asp:Parameter Name="game_notes"></asp:Parameter>
            <asp:Parameter Name="game_id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
