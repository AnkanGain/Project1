<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmAgentDashboard.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgentDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title text-md-center text-xl-left">Invoices</p>
                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" style="padding-left: 20px">
                            <asp:Label ID="LblInvoice" runat="server" Text=""></asp:Label>
                        </h3>
                        <i class="ti-time icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                    </div>
                    <button type="button" class="btn btn-icon-text btn-rounded" data-toggle="modal" data-target="#myModal1">
                        <i class="fa fa-plus-circle"></i>Details
                    </button>
                    <%--<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ms-1"><small>(30 days)</small></span></p>--%>
                    <div class="modal fade" id="myModal1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <asp:GridView ID="GrdInvoice" HeaderStyle-CssClass="bg-primary text-white" runat="server" CssClass="table table-bordered tblProduct" AutoGenerateColumns="true">
                                        <Columns>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="height: 50px; padding: 2px" class="modal-footer">
                                    <asp:Button ID="BtnInvoiceExcel" runat="server" CssClass="btn" Text="Export" OnClick="BtnInvoiceExcel_Click" />
                                    <button type="button" class="btn btn-danger btn-rounded" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title text-md-center text-xl-left">Pending for Approval</p>
                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" style="padding-left: 20px">
                            <asp:Label ID="LblApproval" runat="server" Text=""></asp:Label>
                        </h3>
                        <i class="ti-time icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                    </div>
                    <button type="button" class="btn btn-icon-text btn-rounded" data-toggle="modal" data-target="#myModal2">
                        <i class="fa fa-plus-circle"></i>Details
                    </button>
                    <%--<p class="mb-0 mt-2 text-danger">0.47% <span class="text-black ms-1"><small>(30 days)</small></span></p>--%>
                    <div class="modal fade" id="myModal2">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <asp:GridView ID="GrdApproval" HeaderStyle-CssClass="bg-primary text-white" runat="server" CssClass="table table-bordered tblProduct" AutoGenerateColumns="true">
                                        <Columns>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="height: 50px; padding: 2px" class="modal-footer">
                                    <asp:Button ID="BtnApprovalExcel" runat="server" CssClass="btn" Text="Export" OnClick="BtnApprovalExcel_Click"/>
                                    <button type="button" class="btn btn-danger btn-rounded" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title text-md-center text-xl-left">Pending for Payment</p>
                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" style="padding-left: 20px">
                            <asp:Label ID="LblPayment" runat="server" Text=""></asp:Label>
                        </h3>
                        <i class="ti-time icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                    </div>
                    <button type="button" class="btn btn-icon-text btn-rounded" data-toggle="modal" data-target="#myModal3">
                        <i class="fa fa-plus-circle"></i>Details
                    </button>
                    <%--<p class="mb-0 mt-2 text-success">64.00%<span class="text-black ms-1"><small>(30 days)</small></span></p>--%>
                    <div class="modal fade" id="myModal3">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <asp:GridView ID="GrdPayment" HeaderStyle-CssClass="bg-primary text-white" runat="server" CssClass="table table-bordered tblProduct" AutoGenerateColumns="true">
                                        <Columns>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="height: 50px; padding: 2px" class="modal-footer">
                                    <asp:Button ID="BtnPaymentExcel" runat="server" CssClass="btn" Text="Export" OnClick="BtnPaymentExcel_Click"/>
                                    <button type="button" class="btn btn-danger btn-rounded" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title text-md-center text-xl-left">Paid Invoices</p>
                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" style="padding-left: 20px">
                            <asp:Label ID="LblPaid" runat="server" Text=""></asp:Label>
                        </h3>
                        <i class="ti-time icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                    </div>
                    <button type="button" class="btn btn-icon-text btn-rounded" data-toggle="modal" data-target="#myModal4">
                        <i class="fa fa-plus-circle"></i>Details
                    </button>
                    <%--<p class="mb-0 mt-2 text-success">64.00%<span class="text-black ms-1"><small>(30 days)</small></span></p>--%>
                    <div class="modal fade" id="myModal4">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <asp:GridView ID="GrdPaid" HeaderStyle-CssClass="bg-primary text-white" runat="server" CssClass="table table-bordered tblProduct" AutoGenerateColumns="true">
                                        <Columns>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="height: 50px; padding: 2px" class="modal-footer">
                                    <asp:Button ID="BtnPaidExcel" runat="server" CssClass="btn" Text="Export" OnClick="BtnPaidExcel_Click" />
                                    <button type="button" class="btn btn-danger btn-rounded" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
