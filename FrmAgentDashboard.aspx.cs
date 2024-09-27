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
    public partial class FrmAgentDashboard : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
            Invoice();
            Approval();
            Payment();
            Paid();

        }
        public void BindData()
        {
            string sql = "Select COUNT(*) Invoice From OINV Where UserID='" + Session["UserID"].ToString() + "'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblInvoice.Text = dt.Rows[0]["Invoice"].ToString();

            sql = "Select COUNT(*) Invoice From OINV Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblApproval.Text = dt.Rows[0]["Invoice"].ToString();

            sql = "Select COUNT(*) Invoice From OINV Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus='APPROVED' And PayAmt=0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblPayment.Text = dt.Rows[0]["Invoice"].ToString();

            sql = "Select COUNT(*) Invoice From OINV Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus='APPROVED' And PayAmt>0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            LblPaid.Text = dt.Rows[0]["Invoice"].ToString();
        }

        private void Invoice()
        {
            string sql = " Select InvNo,InvAmt,Convert(nvarchar(10),InvDate,103)InvDate,Remarks " +
                " From OINV Where UserID='" + Session["UserID"].ToString() + "'";
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

        private void Approval()
        {
            string sql = " Select InvNo,InvAmt,Convert(nvarchar(10),InvDate,103)InvDate,Remarks " +
                " From OINV Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdApproval.DataSource = dt;
            GrdApproval.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdApproval.UseAccessibleHeader = true;
                GrdApproval.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }

        private void Payment()
        {
            string sql = " Select InvNo,InvAmt,Convert(nvarchar(10),InvDate,103)InvDate,Remarks From OINV " +
                " Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus='APPROVED' And PayAmt=0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdPayment.DataSource = dt;
            GrdPayment.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdPayment.UseAccessibleHeader = true;
                GrdPayment.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }

        private void Paid()
        {
            string sql = "Select InvNo,PayAmt,PayTDSAmt,Convert(nvarchar(10),PayDate,103)PayDate,PayRemarks From OINV " +
                " Where UserID='" + Session["UserID"].ToString() + "' And ApprovalStatus='APPROVED' And PayAmt>0";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GrdPaid.DataSource = dt;
            GrdPaid.DataBind();
            if (dt.Rows.Count > 0)
            {
                GrdPaid.UseAccessibleHeader = true;
                GrdPaid.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
        }

        protected void BtnPaidExcel_Click(object sender, EventArgs e)
        {
            Paid();
            string fileName = "Paid.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Paid");

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
            string fileName = "Invoices.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Invoices");

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

        protected void BtnPaymentExcel_Click(object sender, EventArgs e)
        {
            Payment();
            string fileName = "PaymentPending.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Payment");

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

        protected void BtnApprovalExcel_Click(object sender, EventArgs e)
        {
            Approval();
            string fileName = "ApprovalPending.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Approval");

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