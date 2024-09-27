using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgreementApproval : System.Web.UI.Page
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
            string sql = "Select * from OAgent Where ApprovalStatus='APPROVED' And AgreementAttechment='Y' And AgreementApprovedStarus=''";
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
                string sql = " Update OAgent Set ";
                sql = sql + " AgreementApprovedStarus = 'APPROVED' ,";
                sql = sql + " AgreementApprovedRemarks = '" + ApproveRemarks + "' ,";
                sql = sql + " AgreementApprovedBy = '" + Session["UserID"].ToString() + "' ,";
                sql = sql + " AgreementApprovedDate = GETDATE() ";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + ID + "'";
                Global.ExecuteNonQuery(sql);

                string bodyText = "N'Hi,'+@CRLF+ N'Welcome to 4SME as a Sales Associate.'+@CRLF+ N'" +
                    "We look forward working with you in proving the 4SME cards to the masses.'+@CRLF+ N'" +
                    "Click http://vms.4sme.in to login to the world of 4SME.'+@CRLF+@CRLF+ N'" +
                    "Cheers'+@CRLF+ N'" +
                    "Team 4SME'";
                string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                    " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                    " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                    " EXEC msdb.dbo.sp_send_dbmail  " +
                    " @profile_name = '4sme Mail',  " +
                    " @recipients = '" + row.Cells[2].Text + "', " +
                    " @blind_copy_recipients = 'partner@4sme.in', " +
                    " @subject = 'Welcome aboard 4SME',  " +
                    " @body = @BodyText; ";
                Global.ExecuteDBMail(sql2);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agreement Approved.')", true);
                bindData();
            }
            else if (e.CommandName == "REJECT")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
                string ApproveRemarks = (row.FindControl("TxtRemarks") as TextBox).Text.Trim().Replace(",", "");
                string sql = " Update OAgent Set ";
                sql = sql + " AgreementApprovedStarus = 'REJECTED' ,";
                sql = sql + " AgreementApprovedRemarks = '" + ApproveRemarks + "' ,";
                sql = sql + " AgreementApprovedBy = '" + Session["UserID"].ToString() + "' ,";
                sql = sql + " AgreementApprovedDate = GETDATE() ";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + ID + "'";
                Global.ExecuteNonQuery(sql);

                string bodyText = "N'Hi,'+@CRLF+ N'We have reviewed your agreement and found some discrepancy in the same.'+@CRLF+ N'" +
                    "" + ApproveRemarks + "'+@CRLF+ N'" +
                    "Click http://vms.4sme.in to login and re-submit the same.'+@CRLF+ N'" +
                    "We look forward to have you onboard.'+@CRLF+@CRLF+ N'" +
                    "Cheers'+@CRLF+ N'" +
                    "Team 4SME'";
                string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                    " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                    " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                    " EXEC msdb.dbo.sp_send_dbmail  " +
                    " @profile_name = '4sme Mail',  " +
                    " @recipients = '" + row.Cells[2].Text + "', " +
                    " @blind_copy_recipients = 'partner@4sme.in', " +
                    " @subject = 'Discrepancy in your agreement with 4SME',  " +
                    " @body = @BodyText; ";
                Global.ExecuteDBMail(sql2);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agreement Rejected.')", true);
                bindData();
            }
        }
    }
}