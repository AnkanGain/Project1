<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAgentSignUP.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgentSignUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Registration</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <%--<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />
    
    <link href="vendors/ti-icons/css/themify-icons.css" rel="stylesheet" />
    <link href="vendors/base/vendor.bundle.base.css" rel="stylesheet" />
    <style type="text/css">
        .required::after {
            content: '*';
            margin-right: 4px;
            color: red;
        }
        .ErrorControl {
            background-color: #ff000012;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            font-size:12px;
            background:#FEDCD6;
        }
        
        .btn {
            font-size: 12px;
            border-radius: 3px;
            color: #FFFFFF;
            background: #FF3E41;
            border-color: #FF3E41;
        }

            .btn:focus {
                border-color: #FF3E41;
                box-shadow: 0 0 0 0.2rem rgba(255, 99, 71,.25);
            }
            .btn:hover {
                background: #D2042D;
                color: #FFFFFF;
                border-color: #D2042D;
            }
        .container {
            background-color: #FEDCD6;
            padding: 5px 10px 10px 10px;
            border: 1px solid #FEDCD6 !important;
            border-radius: 3px;
        }
        .card .card-body {
            background: #FEF0ED;
        }
    </style>

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
    <div class="container">
        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                    <!-- End Logo -->

                    <div class="card mb-3">

                        <div class="card-body">
                            <form id="form1" class="row g-3 needs-validation" runat="server" novalidate="novalidate">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div class="col-12">
                                    <h3 style="text-align: center">Register Now</h3>
                                </div>
                                <div class="col-12">
                                    <label for="TxtName" class="form-label required">Name</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0">
                                                <i class="ti-user text-primary"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="name" class="form-control" id="TxtName" runat="server" placeholder="Enter Name" />
                                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="TxtName" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="TxtEmaill" class="form-label required">Email</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0">
                                                <i class="ti-email text-primary"></i>
                                            </span>
                                        </div>
                                        <input type="email" name="email" class="form-control" id="TxtEmail" runat="server"  placeholder="Enter your email" />
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtEmail" ID="RegularExpressionValidator1" ForeColor="Red"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid Email Format, Please enter a valid email.">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="reqEmail" ControlToValidate="TxtEmail" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="TxtPhonNo" class="form-label required">Phone</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0">
                                                <i class="ti-mobile text-primary"></i>
                                            </span>
                                            <span class="input-group-text bg-transparent border-right-0">
                                                <small>+91</small>
                                            </span>
                                        </div>
                                        <input type="tel" name="Phone" class="form-control" id="TxtPhonNo" runat="server" maxlength="10" placeholder="Enter Mobile" />
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtPhonNo" ID="RegularExpressionValidator2" ForeColor="Red"
                                            ValidationExpression="[0-9]{10}" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid mobile no, Please enter a 10 digit mobile no.">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" ID="reqPhn" ControlToValidate="TxtPhonNo" Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="TxtPassword" class="form-label required">Password</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0">
                                                <i class="ti-lock text-primary"></i>
                                            </span>
                                        </div>
                                        <input type="password" name="password" class="form-control" id="TxtPassword" runat="server" placeholder="Enter Password"/>
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtPassword" ID="RegularExpressionValidator4" ForeColor="Red"
                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage=" Password must be Minimum eight characters, at least one letter, one number and one special character">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="RequiredFieldValidator1" ControlToValidate="TxtPassword" />
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <asp:CheckBox ID="ChkUserTerms" CssClass="form-check-input" runat="server" Checked="false" />
                                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                                        <div class="invalid-feedback">You must agree before submitting.</div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <p class="small mb-0">Already have an account? <a href="FrmSignIN.aspx">Sign In</a></p>
                                </div>
                                <br />
                                <div class="col-12">
                                    <asp:Button ID="btnSignUp" Text="SIGN UP" CssClass="btn w-100" runat="server" OnClick="btnSignUp_Click" />
                                </div>

                                <div class="col-12">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Timer ID="Timer1" runat="server" Interval="2000" Enabled="False" OnTick="Timer1_Tick" EnableViewState="True"></asp:Timer>
                                            <asp:Label ID="LblSuccessful" Font-Bold="true" Font-Size="Smaller" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                for (var i in Page_Validators) {
                    try {
                        var control = document.getElementById(Page_Validators[i].controltovalidate);
                        if (!Page_Validators[i].isvalid) {
                            control.className = "ErrorControl form-control";
                        } else {
                            control.className = "form-control";
                        }
                    } catch (e) { }
                }
                return false;
            }
            return true;
        }
    </script>
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
