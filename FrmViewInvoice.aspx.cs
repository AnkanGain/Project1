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
    public partial class FrmViewInvoice : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TxtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                string sql = "Select StartDate From Fyear Where GETDATE() between StartDate And EndDate";
                dt.Columns.Clear();
                dt = Global.ExecuteQuery(sql);
                string fDate = dt.Rows[0][0].ToString();
                DateTime fDT = Convert.ToDateTime(fDate);
                TxtFromDate.Text = fDT.ToString("yyyy-MM-dd");
                //BindAgent();
                //bindData();
            }
        }

        private void BindAgent()
        {
            //string sql = " Select ISNULL((Select OrgName From OAgent Where OrgEmail=T0.UserID),'')OrgName,UserID From OINV T0";
            //dt.Rows.Clear();
            //dt = Global.ExecuteQuery(sql);
            //if (dt.Rows.Count > 0)
            //{
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        CmbAgentID.Items.Add(new ListItem(dt.Rows[i]["OrgName"].ToString(), dt.Rows[i]["UserID"].ToString()));
            //    }
            //}
        }

        public void bindData()
        {
            string UserID = "";
            //if(CmbAgentID.Text=="--Select--")
            //{
            //    UserID = "";
            //}
            //else
            //{
            //    UserID = CmbAgentID.Text;
            //}
            string sql = " Declare @UserID As nvarchar(50)='" + UserID + "' " +
                " Select ISNULL((Select Top 1 TradeName From OAgent Where OrgEmail=T0.UserID And TradeName<>''),'')OrgName," +
                " UserID,InvNo,CONVERT(nvarchar(10),InvDate,103)InvDate,CONVERT(nvarchar(10),CreatedDate,103)CreatedDate,InvAmt,Remarks,DocEntry,InvFileName," +
                " CASE When ApprovalStatus='' Then 'DRAFT' Else ApprovalStatus End Status From OINV T0 " +
                " Where InvDate>='" + TxtFromDate.Text + "' And InvDate<='" + TxtToDate.Text + "' And (UserID=@UserID Or @UserID='')";
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
        protected void BtnView_Click(object sender, EventArgs e)
        {
            bindData();
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            bindData();
        }

        protected void BtnExcel_Click(object sender, EventArgs e)
        {
            string UserID = "";
            //if(CmbAgentID.Text=="--Select--")
            //{
            //    UserID = "";
            //}
            //else
            //{
            //    UserID = CmbAgentID.Text;
            //}
            string sql = " Declare @UserID As nvarchar(50)='" + UserID + "' " +
                " Select ISNULL((Select Top 1 TradeName From OAgent Where OrgEmail=T0.UserID And TradeName<>''),'')OrgName," +
                " UserID,InvNo,CONVERT(nvarchar(10),InvDate,103)InvDate,CONVERT(nvarchar(10),CreatedDate,103)CreatedDate,GrossAmt,GSTRate,GSTAmt,InvAmt,Remarks," +
                " CASE When ApprovalStatus='' Then 'DRAFT' Else ApprovalStatus End Status From OINV T0 " +
                " Where InvDate>='" + TxtFromDate.Text + "' And InvDate<='" + TxtToDate.Text + "' And (UserID=@UserID Or @UserID='')";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            string fileName = "Invoice_Details.xlsx";
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