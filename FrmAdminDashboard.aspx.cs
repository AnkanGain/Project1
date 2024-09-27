using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAdminDashboard : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
            Agreement();
            DetailsSubmitted();
            Registered();
            Invoice();
            PaymentPaid();
        }
        public void BindData()
        {
            string sql = "Select COUNT(*) Registered From OAgent";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblRegistered.Text = dt.Rows[0]["Registered"].ToString();

            sql = "Select COUNT(*) DetailsSubmitted From OAgent Where UpdatedDate<>''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblDetailsSubmitted.Text = dt.Rows[0]["DetailsSubmitted"].ToString();

            sql = "Select COUNT(*) Agreement From OAgent Where AgreementAttechment='Y'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblAgreement.Text = dt.Rows[0]["Agreement"].ToString();

            sql = "Select COUNT(*) Invoice From OAgent Where AgreementAttechment='Y' And AgreementApprovedStarus='APPROVED'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblInvoice.Text = dt.Rows[0]["Invoice"].ToString();

            sql = "Select COUNT(*) PenApproval From OINV Where ApprovalStatus<>'APPROVED'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblPendingInvoice.Text = dt.Rows[0]["PenApproval"].ToString();

            sql = "Select COUNT(*) as InvCount From OINV Where ApprovalStatus='APPROVED' And PayDate=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblPendingPayment.Text = dt.Rows[0]["InvCount"].ToString();

            sql = "Select COUNT(*) PayCount From OINV Where ApprovedDate<>'' and PayAmt>0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblPaidPayCount.Text = dt.Rows[0]["PayCount"].ToString();
        }

        private void Registered()
        {
            string sql = "Select OrgName As Name,OrgEmail As Email From OAgent Order By OrgName";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdRegistered.DataSource = dt;
            GrdRegistered.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdRegistered.UseAccessibleHeader = true;
                GrdRegistered.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }

        private void DetailsSubmitted()
        {
            string sql = "Select TradeName,OrgEmail As Email," +
                " Case When ApprovalStatus='' Then 'DRAFT' Else ApprovalStatus End Status From OAgent Where UpdatedDate<>''" +
                " Order By TradeName";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdDetailsSubmitted.DataSource = dt;
            GrdDetailsSubmitted.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdDetailsSubmitted.UseAccessibleHeader = true;
                GrdDetailsSubmitted.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }
        private void Agreement()
        {
            string sql = "Select TradeName,OrgEmail As Email," +
                " Case When AgreementApprovedStarus='' Then 'DRAFT' Else AgreementApprovedStarus End Status From OAgent Where AgreementAttechment='Y'" +
                " Order By TradeName";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdAgreement.DataSource = dt;
            GrdAgreement.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdAgreement.UseAccessibleHeader = true;
                GrdAgreement.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }
        private void Invoice()
        {
            string sql = "Select TradeName,OrgEmail As Email From OAgent Where AgreementAttechment='Y' And AgreementApprovedStarus='APPROVED'" +
                " Order By TradeName";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdInvoice.DataSource = dt;
            GrdInvoice.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdInvoice.UseAccessibleHeader = true;
                GrdInvoice.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }
        private void PaymentPaid()
        {
            string sql = "Select T1.OrgName,InvNo,Convert(nvarchar(10),PayDate,103)PayDate,PayAmt,PayTDSAmt " +
                " From OINV T0 Inner Join OAgent T1 On T0.UserDocEntry = T1.DocEntry Where T0.ApprovedDate<>'' and T0.PayAmt>0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdPaidPay.DataSource = dt;
            GrdPaidPay.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdPaidPay.UseAccessibleHeader = true;
                GrdPaidPay.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }
        protected void BtnRegExcel_Click(object sender, EventArgs e)
        {
            Registered();
            string fileName = "Registered.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Registered");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + "");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void BtnDetailsExcel_Click(object sender, EventArgs e)
        {
            DetailsSubmitted();
            string fileName = "DetailsSubmitted.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "DetailsSubmitted");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + "");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void BtnAgreementExcel_Click(object sender, EventArgs e)
        {
            Agreement();
            string fileName = "Agreement.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Agreement");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + "");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void BtnInvoiceExcel_Click(object sender, EventArgs e)
        {
            Invoice();
            string fileName = "Invoice.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Invoice");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + "");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void BtnPaidPayExcel_Click(object sender, EventArgs e)
        {
            PaymentPaid();
            string fileName = "PaymentPaid.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "PaymentPaid");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName + "");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}