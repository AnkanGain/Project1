<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmPendingPayment.aspx.cs" Inherits="S_FACTOR_VMS.FrmPendingPayment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <h3 style="text-align: center">Pending Payment</h3>
    <div class="col-75">
        <div class="container">
            <div class="mb-2">
                <asp:Button ID="Export" runat="server" CssClass="btn" Text="Export" OnClick="Export_Click" />
            </div>
            <div class="row">
                <asp:GridView ID="GridView1" CssClass="table table-bordered tblProduct" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="DocEntry" EmptyDataText="No records has been added." OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF3E41" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="OrgName" HeaderText="Name" />

                        <asp:BoundField DataField="InvNo" HeaderText="Invoice No" />

                        <asp:TemplateField HeaderText="Payment Date">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtPayDate" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtPayDate"
                                    ErrorMessage="Please use dd/mm/yyyy format"
                                    ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19|20)\d\d$"
                                    Display="Dynamic" ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtPayAmt" CssClass="form-control" Text='<%# Eval("InvAmt") %>' runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="TxtPayAmt" Display="Dynamic"
                                    ErrorMessage="No characters allowed." ForeColor="Red" Font-Italic="true"
                                    ValidationExpression="([0-9])[0-9]*[.]?[0-9]*">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TDS Amount">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtTDSAmt" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="TxtTDSAmt" Display="Dynamic"
                                    ErrorMessage="No characters allowed." ForeColor="Red" Font-Italic="true"
                                    ValidationExpression="([0-9])[0-9]*[.]?[0-9]*">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtRemarks" CssClass="form-control" runat="server"></asp:TextBox>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="TxtRemarks" Display="Dynamic"
                                    ErrorMessage="No characters allowed." ForeColor="Red" Font-Italic="true"
                                    ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate">
                                </asp:RegularExpressionValidator>--%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Pay">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CssClass="btn" CommandName="PAY" Text="Pay" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
