<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmAgreementApproval.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgreementApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 style="text-align: center">AGREEMENT APPROVAL</h3>
    <div class="col-75">
        <div class="container">
            <div style="overflow-x: scroll;">
                <asp:GridView ID="GridView1" CssClass="table table-bordered tblProduct" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="DocEntry" EmptyDataText="No records has been added." OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CssClass="btn Button1" CommandName="VIEW" Text="View" />
                                <script>
                                    $(".Button1").click(function () {
                                        var Url = 'FrmAgentProfileFromAdmin.aspx?ID=<%# Eval("DocEntry") %>';
                                        window.open(Url, '_blank');
                                        return false;
                                    });
                                </script>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrgName" HeaderText="Name" />
                        <asp:BoundField DataField="OrgEmail" HeaderText="Email" />
                        <asp:BoundField DataField="OrgMobile" HeaderText="Mobile" />
                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtRemarks" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
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
            </div>
        </div>
    </div>
</asp:Content>
