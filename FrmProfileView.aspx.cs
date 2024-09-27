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
    public partial class FrmProfileView : System.Web.UI.Page
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
            string sql = string.Empty;
            sql = "Select DocEntry,OrgName,OrgEmail,UPPER(PAN)PAN,UPPER(GST)GST,CPName,CPMobile From OAgent Order By OrgName";

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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmProfileView.aspx", false);
        }

        protected void LnkEMail_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;

            int DocEntry = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);

            string sql = " Select Case When ApprovalStatus='' Then 'DRAFT' Else ApprovalStatus End ProfileStatus," +
                " Case When AgreementApprovedStarus='' Then 'DRAFT' Else AgreementApprovedStarus End AgreementStatus " +
                " From OAgent Where DocEntry=" + DocEntry + "";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                LblProfileStatus.Text = dt.Rows[0]["ProfileStatus"].ToString();
                LblAgreementStatus.Text = dt.Rows[0]["AgreementStatus"].ToString();
            }

            // Show the modalpopupextender
            ModalPopupExtender1.Show();
        }
        protected void BtnExcel_Click(object sender, EventArgs e)
        {
            string sql = string.Empty;
            sql = "Select OrgName,OrgEmail,UPPER(PAN)PAN,UPPER(GST)GST,CPName,CPMobile From OAgent Order By OrgName";

            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            string fileName = "Profile.xlsx";
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Profile");

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