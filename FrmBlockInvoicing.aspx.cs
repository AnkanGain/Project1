using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmBlockInvoicing : System.Web.UI.Page
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
            string sql = " Select T0.DocEntry,T0.TradeName As OrgName,T0.OrgEmail,ISNULL(T1.InvActive,'Y')InvActive " +
                " From OAgent T0 Left Join Inv_Active T1 On T0.DocEntry=T1.AgentDocENtry" +
                " Where T0.TradeName<>''" +
                " Order By T0.TradeName";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //if (dt.Rows.Count > 0)
            //{
            //    GridView1.UseAccessibleHeader = true;
            //    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "datatable", "makedatatbl('.tblProduct');", true);
            //}
        }

        protected void BtnBlockInvoice_Click(object sender, EventArgs e)
        {
            string DocEntry = string.Empty;
            Session["DocEntryList"] = string.Empty;
            foreach (GridViewRow Grd in GridView1.Rows)
            {
                bool isChecked = ((CheckBox)Grd.FindControl("ChkBI")).Checked;
                if (isChecked)
                {
                    int ID = Convert.ToInt32(GridView1.DataKeys[Grd.RowIndex].Values[0]);
                    DocEntry = DocEntry + "," + ID.ToString();
                }
            }
            if(DocEntry=="")
            {
                Session["DocEntryList"] = "0";
            }
            else
            {
                Session["DocEntryList"] = DocEntry.Substring(1, DocEntry.Length - 1);
            }

            string sql = "Exec SP_PMS_ADMIN_InvInactive '" + Session["DocEntryList"].ToString() + "','" + Session["UserID"].ToString() + "'";
            if (Global.ExecuteNonQuery(sql) == true)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Updated')", true);
                BindData();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "N")
                {
                    ((CheckBox)e.Row.FindControl("ChkBI")).Checked = true;
                }
            }
        }
    }
}