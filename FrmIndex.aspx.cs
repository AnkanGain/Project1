using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmIndex : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearData();
            }
        }
        public void ClearData()
        {
            TxtEmail.Value = "";
            TxtPassword.Value = "";
            Timer1.Enabled = false;
            LblSuccessful.Text = "";
        }
        protected void btnSignIn_ServerClick(object sender, EventArgs e)
        {
            string sql = "SELECT OrgName,OrgEmail,OrgMobile,OrgPassword,DocEntry,ApprovalStatus,AgreementApprovedStarus,TradeName,AgreementAttechment,USERTYPE,UpdatedDate" +
                " from OUSR Where OrgEmail='" + TxtEmail.Value + "' and OrgPassword='" + TxtPassword.Value + "'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                Session["UserID"] = dt.Rows[0]["OrgEmail"].ToString();
                Session["UserName"] = dt.Rows[0]["OrgName"].ToString();
                Session["Mobile"] = dt.Rows[0]["OrgMobile"].ToString();
                Session["DocEntry"] = dt.Rows[0]["DocEntry"].ToString();
                Session["UserType"] = dt.Rows[0]["USERTYPE"].ToString();
                Session["ApprovalStatus"] = dt.Rows[0]["ApprovalStatus"].ToString();
                Session["AgreementStarus"] = dt.Rows[0]["AgreementApprovedStarus"].ToString();
                Session["Password"] = dt.Rows[0]["OrgPassword"].ToString();
                Session["PcName"] = HttpContext.Current.Server.MachineName;
                if (Session["UserType"].ToString() == "ADMIN")
                {
                    Response.Redirect("~/FrmAdminDashboard.aspx", false);
                }
                else if (Session["UserType"].ToString() == "AGENT")
                {
                    if (Session["AgreementStarus"].ToString() == "APPROVED")
                    {
                        Response.Redirect("~/FrmAgentDashboard.aspx", false);
                    }
                    else if (Session["ApprovalStatus"].ToString() == "APPROVED" && dt.Rows[0]["AgreementAttechment"].ToString() == "")
                    {
                        Response.Redirect("~/FrmAgreement.aspx", false);
                    }
                    else if (Session["ApprovalStatus"].ToString() == "" && dt.Rows[0]["UpdatedDate"].ToString() == "")
                    {
                        Response.Redirect("~/FrmBusinessRegister.aspx", false);
                    }
                    else if (Session["AgreementStarus"].ToString() == "REJECTED")
                    {
                        Response.Redirect("~/FrmAgreement.aspx?REJECTA=Y", false);
                    }
                    else if (Session["ApprovalStatus"].ToString() == "REJECTED")
                    {
                        Response.Redirect("~/FrmBusinessRegister.aspx?REJECTP=Y", false);
                    }
                    else
                    {
                        //Response.Redirect("~/FrmBusinessRegister.aspx", false);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Oops!! Your application is still under process, wait for the approval mail from us.')", true);
                    }
                }
            }
            else
            {
                LblSuccessful.Text = "Wrong UserID/Password";
                Timer1.Enabled = true;
                return;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ClearData();
        }
    }
}