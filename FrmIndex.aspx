<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmIndex.aspx.cs" Inherits="S_FACTOR_VMS.FrmIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>VMS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="IndexDesign/img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet" />

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="IndexDesign/lib/animate/animate.min.css" rel="stylesheet" />
    <link href="IndexDesign/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="IndexDesign/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="IndexDesign/css/style.css" rel="stylesheet" />

    <link href="vendors/ti-icons/css/themify-icons.css" rel="stylesheet" />
    <%--<link href="vendors/base/vendor.bundle.base.css" rel="stylesheet" />--%>
    <style>
        body{
            background:#FEDCD6;
        }
        video {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow border-top border-5 border-primary sticky-top p-0">
            <a href="FrmIndex.aspx" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <img src="images/4smeLogo.png" class="me-2" alt="logo" style="width: 140px; height: 45px; margin-left: 25px" />
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="FrmIndex.aspx" class="nav-item nav-link active">Home</a>
                    <a href="FrmAgentSignUP.aspx" class="nav-item nav-link">Sign Up</a>
                    <a href="FrmSignIN.aspx" class="nav-item nav-link">Sign In</a>
                </div>
                <h4 class="m-0 pe-lg-5 d-none d-lg-block"><i class="fab fa-whatsapp text-primary me-3"></i>89104 36604</h4>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Quote Start -->
        <div class="container-xxl" style="background:#FEDCD6">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-7 wow fadeInUp" data-wow-delay="0.1s">
                        <%--<video src="Videos/4SME%20Card%20Video.mp4" autoplay="autoplay" width="600" controls="controls" />--%>
                        <video autoplay="autoplay" muted="muted" loop="loop" playsinline="true" width="600" controls="controls">
                            <source src="Videos/4SME%20Card%20Video.mp4" type="video/mp4" />
                        </video>
                        <%--<h6 class="text-secondary text-uppercase mb-3">Get A Quote</h6>
                        <h1 class="mb-5">Request A Free Qoute!</h1>
                        <p class="mb-5">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo erat amet</p>
                        <div class="d-flex align-items-center">
                            <i class="fa fa-headphones fa-2x flex-shrink-0 bg-primary p-3 text-white"></i>
                            <div class="ps-4">
                                <h6>Call for any query!</h6>
                                <h3 class="text-primary m-0">+012 345 6789</h3>
                            </div>
                        </div>--%>
                    </div>
                    <div class="col-lg-5">
                        <div class="text-center p-5 wow fadeIn" data-wow-delay="0.5s">
                            <div>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <h3 style="text-align: center">Sign In</h3>
                                    </div>
                                    <div class="col-12">
                                        <label for="TxtEmaill" class="form-label required">Email</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0" style="font-size:1.5rem">
                                                    <i class="ti-email text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="email" name="email" class="form-control" id="TxtEmail" runat="server" placeholder="Enter Email" />
                                            <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="TxtEmail" />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="TxtPassword" class="form-label required">Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0" style="font-size:1.5rem">
                                                    <i class="ti-lock text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="password" name="password" class="form-control" id="TxtPassword" runat="server" placeholder="Enter Password" />
                                            <asp:RequiredFieldValidator runat="server" ID="reqPass" ControlToValidate="TxtPassword" />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <p class="mb-1 small">
                                            New User?
                                        <a href="FrmAgentSignUP.aspx" class="fa text-info">Register Now</a>
                                        </p>
                                        <p class="mb-1 small">
                                            <a href="FrmForgetPassword.aspx" class="fa text-danger">Forgot password?</a>
                                        </p>
                                    </div>
                                    <br />
                                    <div class="col-12">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Timer ID="Timer1" runat="server" Interval="2000" Enabled="False" OnTick="Timer1_Tick" EnableViewState="True"></asp:Timer>
                                                <button id="btnSignIn" class="btn btn-primary w-100" type="submit" runat="server" onserverclick="btnSignIn_ServerClick">Sign In</button>
                                                <asp:Label ID="LblSuccessful" Font-Bold="true" Font-Size="Smaller" Font-Italic="true" ForeColor="Red" runat="server"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <%--<div class="col-12 col-sm-6">
                                        <input type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;" />
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <input type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;" />
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <input type="text" class="form-control border-0" placeholder="Your Mobile" style="height: 55px;" />
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <select class="form-select border-0" style="height: 55px;">
                                            <option>Select A Freight</option>
                                            <option value="1">Freight 1</option>
                                            <option value="2">Freight 2</option>
                                            <option value="3">Freight 3</option>
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <textarea class="form-control border-0" placeholder="Special Note"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn w-100 py-3" type="submit">Submit</button>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Quote End -->

        <!-- Back to Top -->
        <%--<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>--%>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="IndexDesign/lib/wow/wow.min.js"></script>
        <script src="IndexDesign/lib/easing/easing.min.js"></script>
        <script src="IndexDesign/lib/waypoints/waypoints.min.js"></script>
        <script src="IndexDesign/lib/counterup/counterup.min.js"></script>
        <script src="IndexDesign/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="IndexDesign/js/main.js"></script>
    </form>
</body>
</html>
