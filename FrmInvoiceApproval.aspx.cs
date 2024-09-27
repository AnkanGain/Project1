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
    public partial class FrmInvoiceApproval : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindData();
            }
        }
        public void bindData()
        {
            string sql = "Select T0.DocEntry,T0.UserDocEntry,TradeName As OrgName,OrgEmail,OrgMobile,Convert(nvarchar(10),InvDate,103)InvDate,CONVERT(nvarchar(10),CreatedDate,103)CreatedDate,InvAmt,InvFileName " +
                " from OINV T0 Inner Join OAgent T1 On T0.UserDocEntry=T1.DocEntry Where T0.ApprovalStatus=''";
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
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "APPROVE")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
                string ApproveRemarks = (row.FindControl("TxtRemarks") as TextBox).Text.Trim().Replace(",", "");
                string sql = " Update OINV Set ";
                sql = sql + " ApprovalStatus = 'APPROVED' ,";
                sql = sql + " ApprovalRemarks = '" + ApproveRemarks + "' ,";
                sql = sql + " ApprovedBy = '" + Session["UserID"].ToString() + "' ,";
                sql = sql + " ApprovedDate = GETDATE() ";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + ID + "'";
                Global.ExecuteNonQuery(sql);

                string UserDocEntry = (row.FindControl("txtAgentDocEntry") as TextBox).Text.Trim().Replace(",", "");
                sql = string.Empty;
                sql = "Select * From OAgent Where DocEntry='" + UserDocEntry + "'";
                dt.Columns.Clear();
                dt = Global.ExecuteQuery(sql);

                string bodyText = "N'Hi,'+@CRLF+ N'" +
                    "Happy to share that your invoice has been approved and will be processed for payment soon.'+@CRLF+ N'" +
                    "The amount will be credited to your bank account as below'+@CRLF+ N'" +
                    "Bank Name - " + dt.Rows[0]["BankName"].ToString() + "'+@CRLF+ N'" +
                    "Account Number - " + dt.Rows[0]["AccountNo"].ToString() + "'+@CRLF+ N'" +
                    "IFSC Code - " + dt.Rows[0]["IFSC"].ToString() + "'+@CRLF+@CRLF+ N'" +
                    "Kindly reach out to us if the details are not in oder.'+@CRLF+@CRLF+ N'" +
                    "Cheers'+@CRLF+ N'" +
                    "Team 4SME'";
                string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                    " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                    " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                    " EXEC msdb.dbo.sp_send_dbmail  " +
                    " @profile_name = '4sme Mail',  " +
                    " @recipients = '" + row.Cells[2].Text + "', " +
                    " @blind_copy_recipients = 'partner@4sme.in', " +
                    " @subject = '4SME - Invoice Approved',  " +
                    " @body = @BodyText; ";
                Global.ExecuteDBMail(sql2);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account Approved.')", true);
                bindData();
            }
            else if (e.CommandName == "REJECT")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
                string ApproveRemarks = (row.FindControl("TxtRemarks") as TextBox).Text.Trim().Replace(",", "");

                string sql = " Update OINV Set ";
                sql = sql + " ApprovalStatus = 'REJECTED' ,";
                sql = sql + " ApprovalRemarks = '" + ApproveRemarks + "' ,";
                sql = sql + " ApprovedBy = '" + Session["UserID"].ToString() + "' ,";
                sql = sql + " ApprovedDate = GETDATE() ";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + ID + "'" + (char)13;
                sql = sql + " Insert Into OINVReject " + (char)13 +
                    " Select * From OINV Where DocEntry='" + ID + "'" + (char)13;
                sql = sql + " Delete From OINV Where DocEntry='" + ID + "'" + (char)13 +
                    " Delete From INV1 Where DocEntry='" + ID + "'";
                Global.ExecuteNonQuery(sql);

                string bodyText = "N'Hi,'+@CRLF+ N'We regret that the invoice raised on us has been rejected for the following reason.'+@CRLF+ N'" +
                    "" + ApproveRemarks + "'+@CRLF+ N'" +
                    "Kindly resubmit the correct invoice for us to do the needful.'+@CRLF+@CRLF+ N'" +
                    "Cheers'+@CRLF+ N'" +
                    "Team 4SME'";
                string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                    " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                    " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                    " EXEC msdb.dbo.sp_send_dbmail  " +
                    " @profile_name = '4sme Mail',  " +
                    " @recipients = '" + row.Cells[2].Text + "', " +
                    " @blind_copy_recipients = 'partner@4sme.in', " +
                    " @subject = '4SME - Invoice Rejected',  " +
                    " @body = @BodyText; ";
                Global.ExecuteDBMail(sql2);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account Rejected.')", true);
                bindData();
            }
        }
        protected void LnkOthrDocs_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)(((LinkButton)sender).NamingContainer);
            int DocEntry = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
            //LinkButton lbl = sender as LinkButton;
            string sql = " Select OrgName As FileName,FileName As Name From INV1 " +
                " Where DocEntry=" + DocEntry + " And OrgName<>''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            // Show the modalpopupextender
            ModalPopupExtender1.Show();
        }

        protected void Export_Click(object sender, EventArgs e)
        {
            string sql = "Select TradeName As Name,OrgEmail As Email,OrgMobile As Mobile,Convert(nvarchar(10),InvDate,103)InvDate,CONVERT(nvarchar(10),CreatedDate,103)CreatedDate,InvAmt " +
                " from OINV T0 Inner Join OAgent T1 On T0.UserDocEntry=T1.DocEntry Where T0.ApprovalStatus=''";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            string fileName = "PendingInvoice.xlsx";
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
    }
}