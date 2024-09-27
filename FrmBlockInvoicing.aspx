<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmBlockInvoicing.aspx.cs" Inherits="S_FACTOR_VMS.FrmBlockInvoicing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function myheadcheck(btn) {

            // get the ONE check box, checked, or not???
            var bolChecked = $(btn).is(':checked')

            // now set all check boxes
            MyTable = $('#<%= GridView1.ClientID %>')    // select and get grid
            MyCheckBoxs = MyTable.find('input:checkbox') // select all check boxes in grid
            MyCheckBoxs.each(function () {
                $(this).prop('checked', bolChecked)
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center">Block Invoicing</h3>
    <div class="col-75">
        <div class="container">
            <div style="overflow-x: scroll;">
                <asp:Label ID="Label25" runat="server" Font-Italic="true" Style="color:red" CssClass="required" Text="*Please check to block invoicing..."></asp:Label>
                <asp:GridView ID="GridView1" CssClass="table table-bordered tblProduct" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="DocEntry" EmptyDataText="No records has been added." OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField
                            ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="70px">
                            <HeaderTemplate>
                                <div style="display:inline-flex; text-align: center">
                                    Select All&nbsp;
                                    <asp:CheckBox ID="chkAll" runat="server" onclick="myheadcheck(this)" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ChkBI" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrgName" HeaderText="Organization Name" />
                        <asp:BoundField DataField="OrgEmail" HeaderText="OrgEmail" />
                        <asp:BoundField DataField="InvActive" HeaderText="Invoice Active" />
                    </Columns>
                </asp:GridView>
                <asp:Button ID="BtnBlockInvoice" runat="server" CssClass="btn btn-primary" Text="Block/Unblock Invoicing" OnClick="BtnBlockInvoice_Click" />
            </div>
        </div>
    </div>
</asp:Content>
