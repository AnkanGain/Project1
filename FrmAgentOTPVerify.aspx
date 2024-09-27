<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAgentOTPVerify.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgentOTPVerify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>OTP VERIFICATION</title>
    <meta content="" name="description"/>
    <meta content="" name="keywords"/>

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon"/>
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

    <!-- Vendor CSS Files -->
    <%--<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet"/>
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet"/>
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet"/>

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet"/>

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-2 pb-2">
                                        <h5 class="card-title pb-0 fs-4">Verify Your Account</h5>
                                    </div>
                                    <form class="row g-3 needs-validation" runat="server" novalidate="novalidate">

                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                        <div class="col-12">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lblMessage" CssClass="label" runat="server" Text=""></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        </div>

                                        <div class="col-12">
                                            <p class="small">Enter the OTP sent on your Email.</p>
                                            <asp:TextBox CssClass="form-control mt-3 mb-3" ID="TxtOTPMail" runat="server" MaxLength="4" PlaceHolder="Enter OTP" ></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <%--<p class="small">Enter the OTP sent on your phone.</p>--%>
                                            <asp:TextBox CssClass="form-control mt-3 mb-3" ID="TxtOTPPhn" runat="server" MaxLength="4" PlaceHolder="Enter OTP" Enabled="false" Visible="false" ></asp:TextBox>
                                        </div>

                                        <div class="input-group">
                                            <span id="timerLabel"></span>
                                            <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="false" EnableViewState="True" OnTick="Timer1_Tick">
                                            </asp:Timer>

                                            <div class="col-12">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                                                    <ContentTemplate>
                                                        <asp:Button ID="BtnGetOTP" runat="server" CssClass="btn mt-3 w-100" Text="" OnClick="BtnGetOTP_Click"/>
                                                    </ContentTemplate>

                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>

                                        </div>

                                        <div class="col-12">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:Timer ID="Timer2" runat="server" Interval="2000" Enabled="False" OnTick="Timer2_Tick" EnableViewState="True"></asp:Timer>
                                                    <asp:Button ID="BtnVerifyOTP" Text="VERIFY OTP" CssClass="btn mt-3 w-100" runat="server" OnClick="BtnVerifyOTP_Click" />
                                                    <asp:Label ID="LblSuccessful" Font-Bold="true" Font-Size="Smaller" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>
    </main>
    <!-- End #main -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>
