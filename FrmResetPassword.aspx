<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmResetPassword.aspx.cs" Inherits="S_FACTOR_VMS.FrmResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RESET PASSWORD</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link href="css/login.css" rel="stylesheet" />
</head>
<body style="background-color:white;">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <div class="form-gap"></div>
    <div class="container">
        <section class="min-vh-100 d-flex flex-column justify-content-center py-4">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                    <div class="card mb-3">
                        <div class="text-center card-body">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Forgot Password?</h2>
                            <p>You can reset your password here.</p>
                            <div class="panel-body">

                                <form id="register" role="form" autocomplete="off" runat="server" class="form" method="post">

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="TxtPassword" runat="server" placeholder="Enter New Password" autocomplete="new-password" class="form-control" type="password" />
                                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtPassword" ID="RegularExpressionValidator4" ForeColor="Red"
                                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage=" Password must be Minimum eight characters, at least one letter, one number and one special character">
                                            </asp:RegularExpressionValidator>
                                            <%--<asp:TextBox ID="txtEmail" runat="server" Width = "250" />--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input id="TxtConfirmPassword" runat="server" placeholder="Confirm Password" class="form-control" type="password" />
                                        <br />
                                        <asp:Label ID="LblPassword" Font-Bold="true" Visible="false" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                                        <%--<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit"/>--%>
                                        <asp:Button ID="BtnSubmit" Text="Submit" CssClass="btn btn-lg btn-primary btn-block" runat="server" OnClick="BtnSubmit_Click" />
                                    </div>

                                    <%-- <input type="hidden" class="hide" name="token" id="token" value=""/> --%>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
