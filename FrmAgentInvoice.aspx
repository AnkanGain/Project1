<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmAgentInvoice.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgentInvoice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // Client-side code to set the accept attribute
        window.onload = function () {
            var InvoiceUploadType = document.getElementById("<%= InvoiceUpload.ClientID %>");
            InvoiceUploadType.setAttribute("accept", ".pdf, .PDF");

            var AttachDoc = document.getElementById("<%= AttachFile.ClientID %>");
            AttachDoc.setAttribute("accept", ".xlsx, .xls");
        };
    </script>

    <script type="text/ecmascript">
        function validateLength(sender, args) {
            //debugger;
            if (args.Value.length == 0)
                return args.IsValid = false;
            else
                return args.IsValid = true;
        };
    </script>

    <style>
        .required::after {
            content: '*';
            margin-right: 4px;
            color: red;
        }

        .requiredpdf::after {
            content: ' (pdf only)*';
            margin-right: 4px;
            color: red;
            font-size: 12px;
        }

        .requiredxlsx::after {
            content: ' (excel only)*';
            margin-right: 4px;
            color: red;
            font-size: 12px;
        }

        input[type=file]::file-selector-button {
            margin-right: 20px;
            border: none;
            background: #007bff;
            padding: 2px 20px 2px 10px;
            height: 30px;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <div class="col-SM">
        <div class="container">
            <div class="row">
                <div class="col-75">
                    <%--<br />--%>
                    <div>
                        <asp:Label ID="Label1" runat="server" Style="color: #bf1d1d; font-size: 18px">Please 
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="LinkButton1" Text="Click here"></asp:LinkButton>
                            <script>
                                $(".LinkButton1").click(function () {
                                    var Url = 'instruction.pdf';
                                    window.open(Url, '_blank');
                                    return false;
                                });
                            </script>
                            for invoicing Instruction</asp:Label>
                    </div>
                    <div class="row mt-2">
                        <div class="col-25">
                            <%--<br />--%>
                            <asp:Label ID="Label9" runat="server" CssClass="required">Invoice Date</asp:Label>
                            <asp:TextBox ID="TxtPmtDate" CssClass="form-control" TextMode="Date" runat="server" Text=""></asp:TextBox>
                        </div>
                        <div class="col-25">
                            <asp:Label ID="Label23" runat="server" CssClass="required">Invoice No.</asp:Label>
                            <asp:TextBox ID="TxtInvNo" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="TxtInvNo" runat="server" ForeColor="Red"
                                Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!!" ValidateEmptyText="true" Display="Dynamic">
                            </asp:CustomValidator>

                        </div>
                    </div>
                    <%---- Added below 13/09/23 ----%>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row mt-2">
                                <div class="col-25">
                                    <asp:Label ID="Label21" runat="server" CssClass="required">Gross Amount</asp:Label>
                                    <asp:TextBox ID="TxtGrossAmt" onClick="this.setSelectionRange(0, this.value.length)" OnTextChanged="TxtGrossAmt_TextChanged" AutoPostBack="true" CssClass="form-control align-right" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="TxtGrossAmt" runat="server" ForeColor="Red"
                                        Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!" ValidateEmptyText="true" Display="Dynamic">
                                    </asp:CustomValidator>
                                </div>
                                <div class="col-25">
                                    <asp:Label ID="Label2" runat="server" CssClass="required">GST Rate(%)</asp:Label>
                                    <asp:DropDownList ID="CmbGSTRate" runat="server" OnTextChanged="CmbGSTRate_TextChanged" AutoPostBack="true" CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="CmbGSTRate" runat="server" ForeColor="Red"
                                        Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!" ValidateEmptyText="true" Display="Dynamic">
                                    </asp:CustomValidator>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-25">
                                    <asp:Label ID="Label3" runat="server" CssClass="required">GST Amt</asp:Label>
                                    <asp:TextBox ID="TxtGSTAmt" CssClass="form-control align-right" ReadOnly="true" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="TxtGSTAmt" runat="server" ForeColor="Red"
                                        Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!" ValidateEmptyText="true" Display="Dynamic">
                                    </asp:CustomValidator>
                                </div>
                                <div class="col-25">
                                    <asp:Label ID="Label24" runat="server" CssClass="required">Total Amount</asp:Label>
                                    <asp:TextBox ID="TxtTotalAmt" CssClass="form-control align-right" ReadOnly="true" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="TxtTotalAmt" runat="server" ForeColor="Red"
                                        Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!!" ValidateEmptyText="true" Display="Dynamic">
                                    </asp:CustomValidator>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="mt-2">
                        <asp:Label ID="Label25" runat="server" CssClass="required">Remarks</asp:Label>
                        <asp:TextBox ID="TxtRemarks" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:CustomValidator ClientValidationFunction="validateLength" ControlToValidate="TxtRemarks" runat="server" ForeColor="Red"
                            Font-Size="Small" Font-Italic="true" ErrorMessage="Invalid input!!" ValidateEmptyText="true" Display="Dynamic">
                        </asp:CustomValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-75">
                    <div class="mt-2">
                        <asp:Label ID="Label26" runat="server" CssClass="requiredpdf">Attach the Invoice</asp:Label>
                        <asp:FileUpload ID="InvoiceUpload" CssClass="required file-selector-button" runat="server" />
                        <asp:RequiredFieldValidator ID="ValidateF1" runat="server" ErrorMessage="Please choose a file" CssClass="row-validate" ForeColor="Red" Font-Size="Small" Font-Italic="true"
                            ControlToValidate="InvoiceUpload">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="mt-2">
                        <asp:Label ID="Label4" runat="server" CssClass="requiredxlsx">Attach Supporting Documents</asp:Label>
                        <asp:FileUpload ID="AttachFile" ToolTip="Choose one or more excel file" AllowMultiple="true" runat="server" CssClass="required custom-file-upload" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please choose a file" CssClass="row-validate" ForeColor="Red" Font-Size="Small" Font-Italic="true"
                            ControlToValidate="AttachFile">
                        </asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="BtnPayWithdrawal" Style="float: right" runat="server" OnClick="BtnPayWithdrawal_Click" class="btn" Text="Submit" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
