<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAgreement.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgreement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

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

        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 -16px;
        }
        
        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }

        .ErrorControl {
            background-color: #ff000012;
        }

        .form-control {
            height: auto;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        a {
            cursor: pointer;
        }

        .footer-distributed .footer-center i {
            color: grey;
            font-size: 25px;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            text-align: center;
            line-height: 42px;
            margin: 10px 15px;
            vertical-align: middle;
        }

        @media (max-width: 880px) {
            .footer-distributed {
                font: bold 14px sans-serif;
            }


                .footer-distributed .footer-center {
                    display: block;
                    width: 100%;
                    margin-bottom: 40px;
                    text-align: center;
                }

                    .footer-distributed .footer-center i {
                        margin-left: 0;
                    }
        }
    </style>
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <script>
        function validateAgreement() {

            //var textbox2 = document.getElementById("textbox2").value;

            var UploadAgreement = document.getElementById("<%= UploadAgreements.ClientID %>");
            var filePathAgreement = UploadAgreement.value;
            var AgreementUploadSize = $('#UploadAgreements');

            var allowedExtensions = /(.pdf)$/i; // Example: Allow only JPG, JPEG, PNG files
            var allowedFileSize = 524288 * 10; //512KB

            if (!allowedExtensions.exec(filePathAgreement)) {
                alert("Please upload files having extensions .pdf only.");
                fileUpload.value = "";
                return false;
            }
            else if (AgreementUploadSize[0].files[0].size > allowedFileSize) {
                // Display an error message or prevent navigation
                alert("File size must not exceed 5 mb.");

                return false;
            }
            else {
                return true; // Allow 
            }
        }
    </script>

    <script>
        // Client-side code to set the accept attribute
        window.onload = function () {
            var AadharUploadType = document.getElementById('<%= UploadAgreements.ClientID %>');

            AadharUploadType.setAttribute("accept", ".pdf");
        };
    </script>

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
        <section class="min-vh-100 d-flex flex-column justify-content-center py-4">
            <div class="row justify-content-center">
                <form id="form1" runat="server" class=" d-flex flex-column align-items-center justify-content-center">
                    <!-- End Logo -->
                    <h3 style="align-self: center">AGREEMENT</h3>
                    <div class="row g-3 needs-validation" novalidate="novalidate">
                        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                        <div class="row">
                            <div class="col-25" style="border: 1px solid lightgrey; padding: 3px;">
                                <h6 style="margin-left: 5px">Please click here for downlaod the agreement</h6>
                                <a class="btn" style="margin-top:68px" href="FrmAgreementDownload.aspx" target="myiFrame">DOWNLOAD</a>
                                <iframe name="myiFrame" style="height: 0; width: 0; border-width: 0;" src="about:blank"></iframe>
                            </div>
                            <div style="padding: 20px">
                            </div>
                            <div class="col-25" style="border: 1px solid lightgrey; padding: 3px;">
                                <h6 class="form-label required">Upload a signed copy of an agreement</h6>
                                <asp:FileUpload ID="UploadAgreements" CssClass="form-control mb-2" runat="server" ClientIDMode="Static" ToolTip="Please take a print, Please Sign and Stamp and Upload the Agreement." />
                                <p class="text-danger small">*File size must not exceed 5 mb(.pdf only)*</p>
                                <asp:Timer ID="Timer1" runat="server" Interval="2000" Enabled="False" OnTick="Timer1_Tick" EnableViewState="True"></asp:Timer>
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" class="btn" Text="Submit" OnClientClick="return validateAgreement();" />
                                <asp:Label ID="LblSuccessful" Font-Bold="true" Font-Size="Smaller" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3">
                        <img src="images/Agg.png" style="width: 750px; height: 150px;" />
                        <div class="row">
                            <div class="col-75">
                                <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Style="float: right; margin-right:30px" class="btn" Text="Logout" />
                            </div>
                        </div>
                    </div>
                </form>
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
        };
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
