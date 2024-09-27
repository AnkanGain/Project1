<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmAgentProfileFromAdmin.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgentProfileFromAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

        .panel {
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            /*border-radius: 4px;*/
            /*-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);*/
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .panel-group .panel {
            margin-bottom: 0;
            border-radius: 4px;
        }

        .panel-primary {
            border-color: #FF3E41
        }

        .panel-heading {
            color: #fff;
            background-color: #FF3E41;
            border-color: #FF3E41
        }

        a {
            color: inherit;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <div class="container">
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">CHOOSE AGENT</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">AGENT ID</label>
                                <asp:DropDownList ID="CmbAgentID" CssClass="form-control form-select mb-2" AutoPostBack="true" OnTextChanged="CmbAgentID_TextChanged" runat="server">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-25"></div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">ENTITY DETAILS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">Type of Entity</label>
                                <asp:TextBox ID="TxtEntityType" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Name of Entity</label>
                                <asp:TextBox ID="TxtEntityName" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-25"></div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">ADDRESS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">Address</label>
                                <asp:TextBox ID="TxtAddress" CssClass="form-control mb-2" runat="server" TextMode="MultiLine" Height="115px" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">District</label>
                                <asp:TextBox ID="TxtDist" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="col-25">
                                <label class="form-label">City</label>
                                <asp:TextBox ID="TxtCity" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">State</label>
                                <asp:TextBox ID="TxtState" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Pin Code</label>
                                <asp:TextBox ID="TxtPincode" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">DOCUMENTS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">Aadhar</label>
                                <asp:TextBox ID="TxtAadhar" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">PAN</label>
                                <asp:TextBox ID="TxtPAN" CssClass="form-control mb-2" style="text-transform: uppercase" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">GST</label>
                                <asp:TextBox ID="TxtGST" CssClass="form-control mb-2" runat="server" style="text-transform: uppercase" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-25">
                                <div style="padding-top:38px">
                                    <asp:LinkButton ID="LnkAadhar" CssClass="LnkAadhar" ForeColor="Red" Font-Bold="true" runat="server">AADHAR CARD DOWNLOAD</asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkAadhar").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkAadhar.ClientID.Replace("ContentPlaceHolder1_","") %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>
                                <div style="padding-top:55px">
                                    <asp:LinkButton ID="LnkPAN" CssClass="LnkPAN" ForeColor="Red" Font-Bold="true" runat="server">PAN CARD DOWNLOAD</asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkPAN").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkPAN.ClientID.Replace("ContentPlaceHolder1_","") %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>
                                <div style="padding-top:55px">
                                    <asp:LinkButton ID="LnkGST" CssClass="LnkGST" ForeColor="Red" Font-Bold="true" runat="server">GST CERTIFICATE DOWNLOAD</asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkGST").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkGST.ClientID.Replace("ContentPlaceHolder1_","") %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">CONTACT PERSONAL DETAILS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">Name</label>
                                <asp:TextBox ID="TxtCPName" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Designation</label>
                                <asp:TextBox ID="TxtCDesig" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-25">
                                <label class="form-label">Email ID</label>
                                <asp:TextBox ID="TxtCEmailID" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Phone</label>
                                <asp:TextBox ID="TxtCPhone" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">BANK DETAILS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <label class="form-label">Bank Name</label>
                                <asp:TextBox ID="TxtBank" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Branch Name</label>
                                <asp:TextBox ID="TxtBranch" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">IFSC</label>
                                <asp:TextBox ID="TxtIFCS" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-25">
                                <label class="form-label">Account No</label>
                                <asp:TextBox ID="TxtAccountNo" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>

                                <label class="form-label">Account Holder Name</label>
                                <asp:TextBox ID="TxtAccHolName" CssClass="form-control mb-2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-25">
                                <div style="padding-top:38px">
                                    <asp:LinkButton ID="LnkCheque" CssClass="LnkCheque" ForeColor="Red" Font-Bold="true" runat="server">CANCEL CHEQUE DOWNLOAD</asp:LinkButton>
                                </div>
                                <script>
                                    $(".LnkCheque").click(function () {
                                        var imageUrl = 'wwwroot/images/<%= LnkCheque.ClientID.Replace("ContentPlaceHolder1_","") %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading text-sm-center">AGREEMENT DETAILS</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-25">
                                <div>
                                    <div>
                                        <asp:LinkButton ID="LnkAgreements" CssClass="LnkAgreements" ForeColor="Red" Font-Bold="true" runat="server">AGREEMENT'S DOWNLOAD</asp:LinkButton>
                                    </div>
                                    <script>
                                        $(".LnkAgreements").click(function () {
                                            var imageUrl = 'wwwroot/images/<%= LnkAgreements.ClientID.Replace("ContentPlaceHolder1_","") %>';
                                        window.open(imageUrl, '_blank');
                                        return false;
                                    });
                                    </script>
                                </div>
                            </div>
                            <div class="col-25">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

