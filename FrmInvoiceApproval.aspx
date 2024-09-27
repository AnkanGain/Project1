﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmInvoiceApproval.aspx.cs" Inherits="S_FACTOR_VMS.FrmInvoiceApproval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <h3 style="text-align: center">INVOICE APPROVAL</h3>
    <div class="col-75">
        <div class="container">
            <div class="mb-2">
                <asp:Button ID="Export" runat="server" CssClass="btn" Text="Export" OnClick="Export_Click" />
            </div>
            <div style="overflow-x: scroll;">
                <asp:GridView ID="GridView1" CssClass="table table-bordered tblProduct" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="DocEntry" EmptyDataText="No records has been added." OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <div>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="LinkButton1" Text="Invoice"></asp:LinkButton>
                                </div>
                                <asp:LinkButton ID="LnkOthrDocs" runat="server" OnClick="LnkOthrDocs_Click" Text="Other Docs"></asp:LinkButton>
                                <script>
                                    $(".LinkButton1").click(function () {
                                        var Url = 'wwwroot/images/<%# Eval("InvFileName") %>';
                                        window.open(Url, '_blank');
                                        return false;
                                    });
                                </script>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrgName" HeaderText="Name" />
                        <asp:BoundField DataField="OrgEmail" HeaderText="Email" />
                        <asp:BoundField DataField="OrgMobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="InvDate" HeaderText="InvDate" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="InvUploadOn" />
                        <asp:BoundField DataField="InvAmt" HeaderText="InvAmt" />
                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtRemarks" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtAgentDocEntry" ReadOnly="true" BorderColor="White" BorderStyle="None" Height="0" Width="0" runat="server" Text='<%# Eval("UserDocEntry") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CssClass="btn" CommandName="APPROVE" Text="Approve" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reject">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" CommandName="REJECT" Text="Reject" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <%--Modal view extender--%>
                <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="btnShowModalPopup"
                    PopupControlID="divPopUp"
                    BackgroundCssClass="popUpStyle"
                    PopupDragHandleControlID="panelDragHandle"
                    DropShadow="true" />
                <br />
                <div class="popUpStyle" id="divPopUp" style="display: none; background-color: #DDDCE1; padding: 5px; border: 1px solid">
                    <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                        Hold here to Drag this Box
                    </asp:Panel>
                    <h4 style="text-align: center">Other Documents</h4>
                    <div style="overflow-x: scroll; max-height: 400px">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-bordered tblProduct" EmptyDataText="No records has been added."
                            HeaderStyle-CssClass="header" RowStyle-CssClass="text-center">
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="File Name" DataField="FileName" />
                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="LinkButton2" Text="Download"></asp:LinkButton>
                                        <script>
                                            $(".LinkButton2").click(function () {
                                                var Url = 'wwwroot/images/<%# Eval("Name") %>';
                                                window.open(Url, '_blank');
                                                return false;
                                            });
                                        </script>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:Button ID="btnClose" CssClass="btn btn-danger btn-rounded" runat="server" Text="Close" />
                </div>
                <%--End Modal--%>
            </div>
        </div>
    </div>
</asp:Content>
