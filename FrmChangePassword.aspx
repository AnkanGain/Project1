<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmChangePassword.aspx.cs" Inherits="S_FACTOR_VMS.FrmChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-sm-6">
            <asp:Label ID="Label6" runat="server">Old Password</asp:Label>
            <asp:TextBox ID="TxtOldPass" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Label ID="Label7" runat="server">New Password</asp:Label>
            <asp:TextBox ID="TxtNewPass1" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtNewPass1" ID="RegularExpressionValidator4" ForeColor="Red"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage=" Password must be Minimum eight characters, at least one letter, one number and one special character">
            </asp:RegularExpressionValidator>
            <asp:Label ID="Label8" runat="server">Confirm New Password</asp:Label>
            <asp:TextBox ID="TxtNewPass2" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnChangePassword" runat="server" CssClass="btn" OnClick="BtnChangePassword_Click" Text="SAVE" />
        </div>
    </div>
</asp:Content>
