using ClosedXML.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
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
    public partial class FrmPendingPayment : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();                
            }
        }
        public void BindData()
        {
            string sql = "Select T0.DocEntry, T1.TradeName As OrgName, InvNo,InvAmt, PayDate, PayAmt, PayTDSAmt, PayRemarks" +
                " From OINV T0 Inner Join OAgent T1 On T0.UserDocEntry=T1.DocEntry Where T0.ApprovalStatus='APPROVED' And T0.PayDate=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (dt.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            }
            DateTime yourDate = DateTime.Now; // Replace this with your actual date
            string formattedDate = string.Format("{0:dd/MM/yyyy}", yourDate);
            foreach (GridViewRow row in GridView1.Rows)
            {
                ((TextBox)row.FindControl("TxtPayDate")).Text = formattedDate;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PAY")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);

                string PayDate = (row.FindControl("TxtPayDate") as TextBox).Text.Trim();
                string PayAmt = (row.FindControl("TxtPayAmt") as TextBox).Text.Trim();
                string TDSAmt = (row.FindControl("TxtTDSAmt") as TextBox).Text.Trim();
                string PayRemarks = (row.FindControl("TxtRemarks") as TextBox).Text.Trim().Replace("'", "");

                //string DT1 = Convert.ToDateTime(PayDate).ToString("dd/MM/yyyy");
                //string DT2 = Convert.ToDateTime("01/01/1900").ToString("dd/MM/yyyy");

                //if (Convert.ToDateTime(DT1) <= Convert.ToDateTime(DT2))
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter a valid payment date!')", true);
                //    return;
                //}
                //else
                //{
                string sql = " Update OINV Set ";
                sql = sql + " PayDate = '" + PayDate + "' ,";
                sql = sql + " PayAmt = '" + PayAmt + "' ,";
                sql = sql + " PayTDSAmt = '" + TDSAmt + "' ,";
                sql = sql + " PayRemarks = '" + PayRemarks + "' ,";
                sql = sql + " PayCreateDate = GETDATE() ";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + ID + "'";

                if (Global.ExecuteNonQuery(sql) == true)
                {
                    sql = "Select InvNo,InvAmt,(PayAmt-PayTDSAmt) As PaidAmt,T1.OrgEmail,T0.PayRemarks " +
                    " From OINV T0 Inner Join OAgent T1 On T0.UserDocEntry=T1.DocEntry Where T0.DocEntry='" + ID + "'";
                    dt.Columns.Clear();
                    dt = Global.ExecuteQuery(sql);

                    string bodyText = "N'Hi,'+@CRLF+ N'" +
                        "Happy to share that payment for the captioned invoice has been processed and'+@CRLF+ N'" +
                        "the amount will be credited to your bank.'+@CRLF+@CRLF+ N'" +
                        "Invoice No. - " + dt.Rows[0]["InvNo"].ToString() + "'+@CRLF+ N'" +
                        "Invoice Amount Rs. - " + dt.Rows[0]["InvAmt"].ToString() + "'+@CRLF+ N'" +
                        "Amount Paid Rs. - " + dt.Rows[0]["PaidAmt"].ToString() + "'+@CRLF+ N'" +
                        "Bank Ref. - " + dt.Rows[0]["PayRemarks"].ToString() + "'+@CRLF+ N'" +
                        "(TDS deducted as applicable)'+@CRLF+@CRLF+ N'" +
                        "Kindly reach out to us if the details are not in oder.'+@CRLF+@CRLF+ N'" +
                        "Cheers'+@CRLF+ N'" +
                        "Team 4SME'";

                    string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                        " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                        " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                        " EXEC msdb.dbo.sp_send_dbmail  " +
                        " @profile_name = '4sme Mail',  " +
                        " @recipients = '" + dt.Rows[0]["OrgEmail"].ToString() + "', " +
                        " @blind_copy_recipients = 'partner@4sme.in', " +
                        " @subject = 'Hoorah Your Invoice is Paid',  " +
                        " @body = @BodyText; ";
                    Global.ExecuteDBMail(sql2);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment status updated!')", true);
                    BindData();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment status not updated!')", true);
                    BindData();
                }
                //}
            }
        }

        protected void Export_Click(object sender, EventArgs e)
        {
            string sql = "Select T1.TradeName As Name, OrgEmail As Email,OrgMobile As Mobile, InvNo,InvAmt,Convert(nvarchar(10),InvDate,103)InvDate " +
                " From OINV T0 Inner Join OAgent T1 On T0.UserDocEntry=T1.DocEntry Where T0.ApprovalStatus='APPROVED' And T0.PayDate=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            string fileName = "PendingPayment.xlsx";
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
    }
}