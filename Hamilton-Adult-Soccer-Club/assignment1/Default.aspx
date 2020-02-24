<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="assignment1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Hamilton Adult Soccer Club</h1>
        <p class="lead">The Hamilton Soccer Club is a fun-oriented set of leagues where people ofdifferent abilities and ages
            enjoy soccer with some friendly competition.
        </p>
        <p><a href="Divisions.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Recent Scores</h2>
            <p>
                Check out the scores of some recent games.
            </p>
            <p>
                <a class="btn btn-default" href="Recent.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Referees</h2>
            <p>
                Enter the score and any game notes form the last game that you worked.
            </p>
            <p>
                <a class="btn btn-default" href="NewScore.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>New players</h2>
            <p>
                Interested in joining the action? Register Season.
            </p>
            <p>
                <a class="btn btn-default" href="Register.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
