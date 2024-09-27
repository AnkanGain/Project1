<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmProfileView.aspx.cs" Inherits="S_FACTOR_VMS.FrmProfileView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <div class="col-75">
        <h3 style="text-align: center">PROFILE</h3>
        <asp:Button ID="BtnExcel" runat="server" CssClass="btn m-1" Style="float: right" Text="Export" OnClick="BtnExcel_Click" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container">
                    <asp:GridView ID="GridView1" CssClass="table table-bordered tblProduct" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="DocEntry" EmptyDataText="No records has been added.">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LnkEMail" runat="server" OnClick="LnkEMail_Click"><%# Eval("OrgEmail") %></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="OrgName" HeaderText="Name" />
                            <asp:BoundField DataField="PAN" HeaderText="PAN" />
                            <asp:BoundField DataField="GST" HeaderText="GST" />
                            <asp:BoundField DataField="CPName" HeaderText="Contact Person" />
                            <asp:BoundField DataField="CPMobile" HeaderText="Contact Mobile" />
                        </Columns>
                    </asp:GridView>
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
                        <h4 style="text-align: center">STATUS</h4>
                        <div class="row">
                            <div>
                                <label style="color: #007BFF"><i class="fa"></i>Profile Approve Status :</label>
                                <asp:Label ID="LblProfileStatus" ForeColor="IndianRed" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label style="color: #007BFF"><i class="fa"></i>Agreement Approve Status :</label>
                                <asp:Label ID="LblAgreementStatus" ForeColor="IndianRed" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <asp:Button ID="btnClose" CssClass="btn btn-danger btn-rounded" OnClick="btnClose_Click" runat="server" Text="Close" />
                    </div>
                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
