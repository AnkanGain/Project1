<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmBusinessRegister.aspx.cs" Inherits="S_FACTOR_VMS.FrmBusinessRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script>
        //$(function () {

        //    $('.continue').click(function () {
        //        $('.nav-tabs > .active').next('li').find('a').trigger('click');
        //    });
        //    $('.back').click(function () {
        //        $('.nav-tabs > .active').prev('li').find('a').trigger('click');
        //    });
        //});
        // Validation function for Tab 1
        function validateTextBoxes1() {
            var EntityType = document.getElementById("CmbEntityType").value;
            var EntityName = document.getElementById("TxtEntityName").value;
            var Address = document.getElementById("TxtAddress").value;
            var City = document.getElementById("TxtCity").value;
            //var Dist = document.getElementById("TxtDist").value;
            var Pin = document.getElementById("TxtPin").value;
            var State = document.getElementById("CmbState").value;
            //var Aadhar = document.getElementById("TxtAadhar").value;
            var PAN = document.getElementById("TxtPAN").value;
            //var GST = document.getElementById("TxtGST").value;

            ////////var AadharUpload = document.getElementById("<%= AadharUpload.ClientID %>");
            var PanUpdload = document.getElementById("<%= PanUpdload.ClientID %>");
            ////////var GstUpload = document.getElementById("<%= GstUpload.ClientID %>");

            //var filePathAadhar = AadharUpload.value;
            var filePathPAN = PanUpdload.value;
            //var filePathGST = GstUpload.value;

            //var AadharUploadSize = $('#AadharUpload');
            var PanUpdloadSize = $('#PanUpdload');
            //var GstUploadSize = $('#GstUpload');

            var allowedExtensions = /(.jpg|.jpeg|.png|.pdf)$/i; // Example: Allow only JPG, JPEG, PNG files

            var allowedFileSize = 524288*4;


            if (EntityType.trim() === "" || EntityName.trim() === "" || Address.trim() === "" ||
                City.trim() === "" || Pin.trim() === "" ||
                State.trim() === "" || PAN.trim() === "") {
                // Display an error message or prevent navigation
                alert("You Missed a * mandatory Field!!");

                return false; // Prevent navigation
            }
            else if (!allowedExtensions.exec(filePathPAN)) {
                // Display an error message or prevent navigation
                alert("Please upload files having extensions .jpg/.jpeg/.png/.pdf only.");
                fileUpload.value = "";
                return false;
            }
            else if (PanUpdloadSize[0].files[0].size > allowedFileSize) {
                // Display an error message or prevent navigation
                alert("File size must not exceed 2 mb.");

                return false;
            }
            else {
                $('.nav-tabs > .active').next('li').find('a').trigger('click'); // Allow navigation to the next tab
            }

            return true;
        }

        // Validation function function for tab 2
        function validateTextBoxes2() {
            var CName = document.getElementById("TxtCName").value;
            var CDesig = document.getElementById("TxtCDesig").value;
            var CPhn = document.getElementById("TxtCPhn").value;
            var CMail = document.getElementById("TxtCMail").value;
            //var textbox2 = document.getElementById("textbox2").value;

            if (CName.trim() === "" || CDesig.trim() === "" ||
                CPhn.trim() === "" || CMail.trim() === "") {
                // Display an error message or prevent navigation
                alert("You Missed a * mandatory Field!!");

                return false; // Prevent navigation
            }
            else {
                $('.nav-tabs > .active').next('li').find('a').trigger('click');
                //$('.nav-tabs > .active').prev('li').find('a').trigger('click'); 
            }

            return true;
        }

        // Validation function for tab 3
        function validateTextBoxes3() {
            var Bank = document.getElementById("CmbBank").value;
            //var Branch = document.getElementById("TxtBranch").value;
            var IFSC = document.getElementById("TxtIFSC").value;
            var AccNo = document.getElementById("TxtAccNo").value;
            var AccHolder = document.getElementById("TxtAccHolder").value;
            //var textbox2 = document.getElementById("textbox2").value;

            var CCheckUpload = document.getElementById("<%= CCheckUpload.ClientID %>");
            var filePathCCheck = CCheckUpload.value;

            var CCheckUploadSize = $('#CCheckUpload');

            var allowedExtensions = /(.jpg|.jpeg|.png|.pdf)$/i; // Example: Allow only JPG, JPEG, PNG files

            var allowedFileSize = 524288*4;

            if (Bank.trim() === "" || IFSC.trim() === "" || AccNo.trim() === "" || AccHolder.trim() === "") {
                // Display an error message or prevent navigation
                alert("You Missed a * mandatory Field!!");

                return false; // Prevent navigation
            }
            else if (!allowedExtensions.exec(filePathCCheck)) {
                alert("Please upload files having extensions .jpg/.jpeg/.png/.pdf only.");
                fileUpload.value = "";
                return false;
            }
            else if (CCheckUploadSize[0].files[0].size > allowedFileSize) {
                // Display an error message or prevent navigation
                alert("File size must not exceed 2 mb.");

                return false;
            }
            else {
                $('.nav-tabs > .active').next('li').find('a').trigger('click'); // Allow navigation to the next tab
                //$('.nav-tabs > .active').prev('li').find('a').trigger('click'); // Allow navigation to the prev tab
            }

            return true;
        }

        // Validation function for tab 4 submit
        function validateTextBoxes4() {
            $('.nav-tabs > .active').prev('li').find('a').trigger('click'); // Allow navigation to the prev tab
        }
    </script>
    <script>
        // Client-side code to set the accept attribute
        window.onload = function () {
            var AadharUploadType = document.getElementById('<%= AadharUpload.ClientID %>');
                var PanUpdloadType = document.getElementById('<%= PanUpdload.ClientID %>');
                var GstUploadType = document.getElementById('<%= GstUpload.ClientID %>');
                var CCheckUploadType = document.getElementById('<%= CCheckUpload.ClientID %>');

            AadharUploadType.setAttribute("accept", ".jpg, .jpeg, .png, .pdf");
            PanUpdloadType.setAttribute("accept", ".jpg, .jpeg, .png, .pdf");
            GstUploadType.setAttribute("accept", ".jpg, .jpeg, .png, .pdf");
            CCheckUploadType.setAttribute("accept", ".jpg, .jpeg, .png, .pdf");
        };
    </script>

    <%--("accept", ".jpg,.jpeg,.png,.pdf")--%>

    <style>
        .line {
            height: 2px;
            width: 100%;
            background-color: #E0E0E0;
            margin-top: 15px;
        }

        .tabs-left, .tabs-right {
            border-bottom: none;
            padding-top: 2px;
        }

        .tabs-left {
            border-right: 1px solid #ddd;
        }

        .tabs-right {
            border-left: 1px solid #ddd;
        }

            .tabs-left > li, .tabs-right > li {
                float: none;
                margin-bottom: 2px;
            }

        .tabs-left > li {
            margin-right: -1px;
        }

        .tabs-right > li {
            margin-left: -1px;
        }

        .tabs-left > li.active > a,
        .tabs-left > li.active > a:hover,
        .tabs-left > li.active > a:focus {
            border-bottom-color: #ddd;
            border-right-color: transparent;
        }

        .tabs-right > li.active > a,
        .tabs-right > li.active > a:hover,
        .tabs-right > li.active > a:focus {
            border-bottom: 1px solid #ddd;
            border-left-color: transparent;
        }

        .tabs-left > li > a {
            border-radius: 4px 0 0 4px;
            margin-right: 0;
            display: block;
        }

        .tabs-right > li > a {
            border-radius: 0 4px 4px 0;
            margin-right: 0;
        }

        .vertical-text {
            margin-top: 50px;
            border: none;
            position: relative;
        }

            .vertical-text > li {
                height: 20px;
                width: 120px;
                margin-bottom: 100px;
            }

                .vertical-text > li > a {
                    border-bottom: 1px solid #ddd;
                    border-right-color: transparent;
                    text-align: center;
                    border-radius: 4px 4px 0px 0px;
                }

                .vertical-text > li.active > a,
                .vertical-text > li.active > a:hover,
                .vertical-text > li.active > a:focus {
                    border-bottom-color: transparent;
                    border-right-color: #ddd;
                    border-left-color: #ddd;
                }

            .vertical-text.tabs-left {
                left: -50px;
            }

            .vertical-text.tabs-right {
                right: -50px;
            }

                .vertical-text.tabs-right > li {
                    -webkit-transform: rotate(90deg);
                    -moz-transform: rotate(90deg);
                    -ms-transform: rotate(90deg);
                    -o-transform: rotate(90deg);
                    transform: rotate(90deg);
                }

            .vertical-text.tabs-left > li {
                -webkit-transform: rotate(-90deg);
                -moz-transform: rotate(-90deg);
                -ms-transform: rotate(-90deg);
                -o-transform: rotate(-90deg);
                transform: rotate(-90deg);
            }

        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 1px;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .required::after {
            content: '*';
            margin-right: 4px;
            color: red;
        }

        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,500,300,700);

        .footer-distributed {
            /*box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
            box-sizing: border-box;*/
            color: grey;
            width: 100%;
            text-align: left;
            font: bold 16px sans-serif;
            padding: 25px 50px;
        }

            .footer-distributed .footer-left,
            .footer-distributed .footer-center,
            .footer-distributed .footer-right {
                display: inline-block;
                vertical-align: top;
            }

            /* Footer left */

            .footer-distributed .footer-left {
                width: 40%;
            }

            /* The company logo */

            .footer-distributed h3 {
                color: grey;
                font: normal 36px 'Open Sans', cursive;
                margin: 0;
            }

                .footer-distributed h3 span {
                    color: lightseagreen;
                }

            /* Footer links */

            .footer-distributed .footer-links {
                color: grey;
                margin: 20px 0 12px;
                padding: 0;
            }

                .footer-distributed .footer-links a {
                    display: inline-block;
                    line-height: 1.8;
                    font-weight: 400;
                    text-decoration: none;
                    color: inherit;
                }

            .footer-distributed .footer-company-name {
                color: grey;
                font-size: 14px;
                font-weight: normal;
                margin: 0;
            }

            /* Footer Center */

            .footer-distributed .footer-center {
                width: 35%;
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

                    .footer-distributed .footer-center i.fa-envelope {
                        font-size: 17px;
                        line-height: 38px;
                    }

                .footer-distributed .footer-center p {
                    display: inline-block;
                    color: grey;
                    font-weight: 400;
                    vertical-align: middle;
                    margin: 0;
                }

                    .footer-distributed .footer-center p span {
                        display: block;
                        font-weight: normal;
                        font-size: 14px;
                        line-height: 2;
                    }

                    .footer-distributed .footer-center p a {
                        color: lightseagreen;
                        text-decoration: none;
                    }

            .footer-distributed .footer-links a:before {
                content: "|";
                font-weight: 300;
                font-size: 20px;
                left: 0;
                color: grey;
                display: inline-block;
                padding-right: 5px;
            }

            .footer-distributed .footer-links .link-1:before {
                content: none;
            }

            /* Footer Right */

            .footer-distributed .footer-right {
                width: 20%;
            }

            .footer-distributed .footer-company-about {
                line-height: 20px;
                color: grey;
                font-size: 13px;
                font-weight: normal;
                margin: 0;
            }

                .footer-distributed .footer-company-about span {
                    display: block;
                    color: grey;
                    font-size: 14px;
                    font-weight: bold;
                    margin-bottom: 20px;
                }

            .footer-distributed .footer-icons {
                margin-top: 25px;
            }

                .footer-distributed .footer-icons a {
                    display: inline-block;
                    width: 35px;
                    height: 35px;
                    cursor: pointer;
                    background-color: #33383b;
                    border-radius: 2px;
                    font-size: 20px;
                    color: grey;
                    text-align: center;
                    line-height: 35px;
                    margin-right: 3px;
                    margin-bottom: 5px;
                }

        /* If you don't want the footer to be responsive, remove these media queries */

        @media (max-width: 880px) {

            .footer-distributed {
                font: bold 14px sans-serif;
            }

                .footer-distributed .footer-left,
                .footer-distributed .footer-center,
                .footer-distributed .footer-right {
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
</head>
<body>
    <form runat="server" class="container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <div class="col-lg-12">
                <h3>Business Registration</h3>
                <hr />
                <div class="col-xs-3">
                    <!-- required for floating -->
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tabs-left" style="min-width: 90px">
                        <li class="active"><a href="#home" style="pointer-events: none;" data-toggle="tab">Business Information</a></li>
                        <li><a href="#Personal" style="pointer-events: none;" data-toggle="tab">Personal Information</a></li>
                        <li><a href="#Bank" style="pointer-events: none;" data-toggle="tab">Bank Details</a></li>
                        <%--<li><a href="#Agreement" style="pointer-events: none;" data-toggle="tab">Agreement</a></li>--%>
                        <li><a runat="server" data-toggle="tab" style="padding: 0">
                            <asp:LinkButton ID="NavLogout" OnClick="NavLogout_ServerClick" runat="server">Logout</asp:LinkButton>
                        </a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <div class="col-sm-6">
                                <asp:Label ID="Label35" CssClass="required" runat="server">Type of Entity</asp:Label>
                                <asp:DropDownList ID="CmbEntityType" CssClass="form-control form-select" ClientIDMode="Static" runat="server">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>Individual</asp:ListItem>
                                    <asp:ListItem>Private Ltd Company</asp:ListItem>
                                    <asp:ListItem>Public Ltd Company</asp:ListItem>
                                    <asp:ListItem>Proprietorship</asp:ListItem>
                                    <asp:ListItem>Partnership</asp:ListItem>
                                    <asp:ListItem>Limited Liability Partnership (LLP)</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label18" CssClass="required" runat="server">Name of Entity</asp:Label>
                                <asp:TextBox ID="TxtEntityName" CssClass="form-control" ToolTip="No special character allowed" ClientIDMode="Static" runat="server"></asp:TextBox>
                                <asp:Label ID="Label30" CssClass="required" runat="server">Address</asp:Label>
                                <asp:TextBox ID="TxtAddress" CssClass="form-control" ToolTip="No special character allowed" ClientIDMode="Static" runat="server"></asp:TextBox>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="Label11" CssClass="required" runat="server">City</asp:Label>
                                        <asp:TextBox ID="TxtCity" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label41" runat="server">District</asp:Label>
                                        <asp:TextBox ID="TxtDist" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-25">
                                        <asp:Label ID="Label12" CssClass="required" runat="server">Pin</asp:Label>
                                        <asp:TextBox ID="TxtPin" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label10" CssClass="required" runat="server">State</asp:Label>
                                        <asp:DropDownList ID="CmbState" CssClass="form-control form-select" ClientIDMode="Static" runat="server">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <asp:Label ID="Label13" CssClass="" runat="server">Aadhar Card</asp:Label>
                                <%--<input type="text" class="form-control" runat="server" id="TxtAadhar" maxlength="12" placeholder="Enter Your Aadhar No." />--%>
                                <asp:TextBox ID="TxtAadhar" CssClass="form-control" runat="server" ClientIDMode="Static" MaxLength="12" PlaceHolder="Enter Your Aadhar No."></asp:TextBox>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtAadhar" ID="RegularExpressionValidator1" ForeColor="Red"
                                    ValidationExpression="^[\d+]{12,12}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Aadhar No should be 12 digit & no characters allowed.">
                                </asp:RegularExpressionValidator>
                                <asp:FileUpload ID="AadharUpload" CssClass="form-control" ToolTip="Please attach Aadhar" runat="server" />
                                <p class="text-danger small">*File size must not exceed 2 mb(.jpg/.jpeg/.png/.pdf only)*</p>
                                <%-- <div>
                                    <asp:LinkButton ID="LnkAadhar" CssClass="LnkAadhar" runat="server"></asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkAadhar").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkAadhar.ClientID %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>--%>
                                <asp:Label ID="Label14" CssClass="required" runat="server">PAN Card</asp:Label>
                                <%--<input type="text" class="form-control" style="text-transform: uppercase" runat="server" id="TxtPAN" maxlength="10" placeholder="Enter Your PAN No." />--%>
                                <asp:TextBox ID="TxtPAN" CssClass="form-control uppercase" ClientIDMode="Static" Style="text-transform: uppercase" runat="server" MaxLength="10" PlaceHolder="Enter Your PAN No."></asp:TextBox>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtPAN" ID="RegularExpressionValidator2" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Enter a valid PAN No.">
                                </asp:RegularExpressionValidator>
                                <asp:FileUpload ID="PanUpdload" CssClass="form-control required" ToolTip="Please attach PAN" runat="server" />
                                <p class="text-danger small">*File size must not exceed 2 mb(.jpg/.jpeg/.png/.pdf only)*</p>
                                <%-- <div>
                                    <asp:LinkButton ID="LnkPAN" CssClass="LnkPAN" runat="server"></asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkPAN").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkPAN.ClientID %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>--%>
                                <asp:Label ID="Label16" runat="server">GST Certificate</asp:Label>
                                <input type="text" class="form-control" autocomplete="KothaSoneNa" style="text-transform: uppercase" runat="server" id="TxtGST" maxlength="15" placeholder="Enter Your GST No." />
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtGST" ID="RegularExpressionValidator3" ForeColor="Red"
                                    ValidationExpression="^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[a-zA-Z0-9]{3}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Enter a valid GST No.">
                                </asp:RegularExpressionValidator>
                                <asp:FileUpload ID="GstUpload" CssClass="form-control" ToolTip="Please attach GST" runat="server" />
                                <p class="text-danger small">*File size must not exceed 2 mb(.jpg/.jpeg/.png/.pdf only)*</p>
                                <%--<div>
                                    <asp:LinkButton ID="LnkGST" CssClass="LnkGST" runat="server"></asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkGST").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkGST.ClientID %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>--%>
                                <br />
                                <button type="button" class="btn" onclick="return validateTextBoxes1();">Next &rarr;</button>
                            </div>
                        </div>
                        <div class="tab-pane" id="Personal">
                            <div class="col-sm-6">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <asp:CheckBox ID="ChkContact" Text="Same as registered" AutoPostBack="true" OnCheckedChanged="ChkContact_CheckedChanged" runat="server" />
                                        </div>
                                        <asp:Label ID="Label17" CssClass="required" runat="server">Contact Person Name</asp:Label>
                                        <asp:TextBox ID="TxtCName" ToolTip="No special character allowed" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label19" CssClass="required" runat="server">Designation</asp:Label>
                                        <asp:TextBox ID="TxtCDesig" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label20" CssClass="required" runat="server">Phone No.</asp:Label>
                                        <asp:TextBox ID="TxtCPhn" CssClass="form-control" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtCPhn" ID="RegularExpressionValidator5" ForeColor="Red"
                                            ValidationExpression="^[\d+]{10,10}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Mobile No should be 10 digit & no characters allowed.">
                                        </asp:RegularExpressionValidator>
                                        <asp:Label ID="Label15" CssClass="required" runat="server">Email ID</asp:Label>
                                        <asp:TextBox ID="TxtCMail" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>                               
                                <br />
                                <button type="button" class="btn" onclick="return validateTextBoxes4();">&#8592; Previous</button>
                                <button type="button" class="btn" onclick="return validateTextBoxes2();">Next &rarr;</button>
                            </div>
                        </div>
                        <div class="tab-pane" id="Bank">
                            <div class="col-sm-6">
                                <asp:Label ID="Label1" CssClass="required" runat="server">Bank Name</asp:Label>
                                <asp:DropDownList ID="CmbBank" CssClass="form-control form-select" ClientIDMode="Static" runat="server">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:Label ID="Label3" CssClass="required" runat="server">Branch Name</asp:Label>
                                <asp:TextBox ID="TxtBranch" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>--%>
                                <asp:Label ID="Label4" CssClass="required" runat="server">IFSC</asp:Label>
                                <asp:TextBox ID="TxtIFSC" CssClass="form-control" MaxLength="11" Style="text-transform: uppercase" ClientIDMode="Static" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtIFSC" ID="RegularExpressionValidator4" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z]{4}[0][a-zA-Z0-9]{6}$" runat="server" Font-Size="Small" Font-Italic="true" ErrorMessage="Enter a valid IFSC No.">
                                </asp:RegularExpressionValidator>
                                <asp:Label ID="Label21" CssClass="required" runat="server">Account No.</asp:Label>
                                <asp:TextBox ID="TxtAccNo" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                <asp:Label ID="Label22" CssClass="required" runat="server">Account Holder Name As Per Record</asp:Label>
                                <asp:TextBox ID="TxtAccHolder" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                <asp:Label ID="Label5" CssClass="required" runat="server">Upload Cancel Cheque</asp:Label>
                                <asp:FileUpload ID="CCheckUpload" CssClass="form-control" ClientIDMode="Static" ToolTip="Please attach cancel cheque" runat="server" />
                                <p class="text-danger small">*File size must not exceed 2 mb(.jpg/.jpeg/.png/.pdf only)*</p>
                                <%--<div>
                                    <asp:LinkButton ID="LnkCheque" CssClass="LnkCheque" runat="server"></asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkCheque").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkCheque.ClientID %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>--%>
                                <br />
                                <button type="button" class="btn" onclick="return validateTextBoxes4();">&#8592; Previous</button>
                                <%--<button type="button" class="btn" onclick="return validateTextBoxes3();">Next &rarr;</button>--%>
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" OnClientClick="return validateTextBoxes3();" class="btn" Text="Submit" />
                            </div>
                        </div>
                        <%--<div class="tab-pane" id="Agreement">
                            <div class="col-sm-6">
                                <div class="form-check">
                                    <asp:CheckBox ID="ChkUserTerms" CssClass="form-check-input" runat="server" Checked="true" />
                                    <label class="form-check-label" for="acceptTerms">
                                        I read and accept the 
                                        <a onclick="window.open('FrmAgreementDownload.aspx?CName=' + document.getElementById('TxtCName').value 
                                            + '&CAddress=' + document.getElementById('TxtAddress').value
                                            + '&CCity=' + document.getElementById('TxtCity').value
                                            + '&CState=' + document.getElementById('CmbState').value
                                            + '&CCDesig=' + document.getElementById('TxtCDesig').value
                                            + '&CCompName=' + document.getElementById('TxtEntityName').value,
                                            null,'left=50,top=50,width=900,height=600,toolbar=1,location=0,resizable=1,scrollbars=1'); return false;">Agreements</a>
                                    </label>
                                    <div class="invalid-feedback">You must agree before submitting.</div>
                                </div>
                                <button type="button" class="btn" onclick="return validateTextBoxes4()">&#8592; Previous</button>
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" class="btn" Text="Submit" />

                            </div>
                        </div>--%>

                    </div>
                </div>
            </div>
        </div>

        <%--<div class="row px-3 mb-2">
            <div class="line"></div>
        </div>--%>
        <%--<footer class="footer-distributed">

            <div class="footer-left">
                <h3>Company<span>logo</span></h3>
                <p class="footer-links">
                    <a href="#" class="link-1">Home</a>

                    <a href="#">Blog</a>

                    <a href="#">Pricing</a>

                    <a href="#">About</a>

                    <a href="#">Faq</a>

                    <a href="#">Contact</a>
                </p>

                <p class="footer-company-name">Company Name © 2015</p>
            </div>

            <div class="footer-center">
                <div>
                    <i class="fa fa-map-marker"></i>
                    <p><span>444 S. Cedros Ave</span> Solana Beach, California</p>
                </div>

                <div>
                    <i class="fa fa-phone"></i>
                    <p>+91 89818 61567</p>
                </div>

                <div>
                    <i class="fa fa-envelope"></i>
                    <p><a href="#">shamimindiaautiscenter@org</a></p>
                </div>
            </div>

            <div class="footer-right">

                <p class="footer-company-about">
                    <span>About the company</span>
                </p>

                <div class="footer-icons">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                </div>
            </div>
        </footer>--%>
    </form>
</body>
</html>
