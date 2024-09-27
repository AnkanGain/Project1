using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgreementDownload : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "Select * from OAgent Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                dt.Columns.Clear();
                dt = Global.ExecuteQuery(sql);

                if (dt.Rows.Count > 0)
                {
                    LblREntityName.Text = dt.Rows[0]["TradeName"].ToString();
                    string _DocDate = dt.Rows[0]["UpdatedDate"].ToString();
                    DateTime DocDate = Convert.ToDateTime(_DocDate);
                    TxtDocDate.Text = DocDate.ToString("dd/MM/yyyy");
                    LblDocMonth.Text = DocDate.ToString("MMMM");
                    LblDocDay.Text = DocDate.ToString("dd");
                    LblDocYear.Text = DocDate.ToString("yyyy");
                    TxtRAddress.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["City"].ToString() 
                        + ", " + dt.Rows[0]["Pin"].ToString() + ", " + dt.Rows[0]["District"].ToString() + ", " + dt.Rows[0]["State"].ToString();
                    LblRDes.Text = dt.Rows[0]["CPDesignation"].ToString();
                    LblRName.Text = dt.Rows[0]["TradeName"].ToString();
                    LblRName2.Text = dt.Rows[0]["CPName"].ToString();
                    LblAgreeDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
            }
        }
    }
}