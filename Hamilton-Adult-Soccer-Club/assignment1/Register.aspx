<%--Author: Harris Moattar
 ID: 000775608
 Pupose: Modified Register page of the HASC website to register to persons in the database.--%>
<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="assignment1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>

    <%--Row to input the first name values and has a validator--%>
    <div class="table row">
        <div class="col-md-2">
            <asp:Label ID="firstNameLabel" runat="server" Text="First Name"></asp:Label>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="firstNameTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:RequiredFieldValidator 
                ID="firstNameRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="First Name is required."
                ControlToValidate="firstNameTextBox"
                SetFocusOnError="True"
                Text="Required.">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%--Row to input the last name values and has a validator--%>
    <div class="table row">
        <div class="col-md-2">
            <asp:Label ID="lastNameLabel" runat="server" Text="Last Name"></asp:Label>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="lastNameTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:RequiredFieldValidator 
                ID="lastNameRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="Last Name is required."
                ControlToValidate="lastNameTextBox"
                SetFocusOnError="True"
                Text="Required.">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%--Row to select the division dropdown list with access to the database--%>
    <div class="table row">
        <div class="col-md-2">
            <asp:Label ID="divisionLabel" runat="server" Text="Division"></asp:Label>
        </div>
        <div class="col-md-2">
            <asp:DropDownList 
                ID="divisionDropDownList" 
                runat="server" 
                DataSourceID="divisionSqlDataSource1" 
                DataTextField="division_name" 
                DataValueField="division_id">
            </asp:DropDownList>
            <asp:SqlDataSource 
                runat="server" 
                ID="divisionSqlDataSource1" 
                ConnectionString='<%$ ConnectionStrings:HASCConnectionString %>' 
                SelectCommand="SELECT [division_id], [division_name] FROM [divisions]">
            </asp:SqlDataSource>
        </div>
        <div class="col-md-2">
        </div>
    </div>

    <%--Row to input the email value and has a validator--%>
    <div class="table row">
        <div class="col-md-2">
            <asp:Label ID="emailLabel" runat="server" Text="Email"></asp:Label>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:RequiredFieldValidator 
                ID="emailRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="Email is required."
                ControlToValidate="emailTextBox"
                SetFocusOnError="True"
                Text="Required."
                Display="Dynamic">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator 
                ID="emailRegularExpressionValidator" 
                runat="server" 
                ErrorMessage="Invalid Email format."
                ControlToValidate="emailTextBox"
                ValidationExpression="^.+@.+\..+$"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
        </div>
    </div>

    <%--Row to input the birth date value and has a validator--%>
    <div class="table row">
        <div class="col-md-2">
            <asp:Label ID="birthDateLabel" runat="server" Text="Birth Date"></asp:Label>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="birthDateTextBox" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:RequiredFieldValidator 
                ID="birthDateRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="Birth Date is required."
                ControlToValidate="birthDateTextBox"
                SetFocusOnError="True"
                Text="Required.">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%--Row containing the submit button to process the inputs--%>
    <div class="table row">
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
            <asp:Button ID="cancelButton" runat="server" Text="Cancel" CausesValidation="false" />
        </div>
        <div class="col-md-2">
        </div>
    </div>

    <%--Info to return to the user based on the values they submitted--%>
    <br />
    <asp:ValidationSummary ID="formValidationSummary" runat="server" />
    <asp:Literal ID="resultLiteral" runat="server"></asp:Literal>

</asp:Content>
