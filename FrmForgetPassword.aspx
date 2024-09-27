<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmForgetPassword.aspx.cs" Inherits="S_FACTOR_VMS.FrmForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link href="css/login.css" rel="stylesheet" />
</head>
<body style="background-color: white;">

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
                            <p>Email Verification.</p>
                            <div class="panel-body">

                                <form id="register" role="form" autocomplete="off" runat="server" class="form" method="post">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                    <input id="txtEmail" runat="server" name="email" style="margin-bottom: 5px" placeholder="Email Address" class="form-control" type="email" />

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblMessage" CssClass="label" runat="server" Text=""></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="input-group">
                                        <span id="timerLabel"></span>


                                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" Enabled="False" EnableViewState="True">
                                        </asp:Timer>

                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="BtnGetOTP" runat="server" OnClick="BtnGetOTP_Click" CssClass="btn" Text="Get OTP" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <input id="TxtOTP" runat="server" placeholder="Enter Verification Code..." class="form-control" />
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="LblSuccessful" Font-Bold="true" Font-Size="Smaller" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                                            <asp:Button ID="BtnSendEmail" Text="Verify OTP" Style="margin-top: 5px" Width="100%" CssClass="btn" runat="server" OnClick="BtnSendEmail_Click" />

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
