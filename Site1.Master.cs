using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (!IsPostBack)
            {
                Session["Reset"] = true;
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~/Web.Config");
                SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                int timeout = (int)section.Timeout.TotalMinutes * 1000 * 60;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
                try
                {
                    string UserID = Session["UserID"].ToString();
                    LblProfile.Text = " " + Session["UserName"].ToString() + (char)13 + "[" + UserID + "]";
                    if (UserID == null)
                    {
                        Response.Redirect("~/FrmSignIN.aspx");
                    }
                    else
                    {
                        if (Session["UserType"].ToString() == "ADMIN")
                        {
                            NavAgent.Visible = false;
                        }
                        else if (Session["UserType"].ToString() == "AGENT")
                        {
                            NavAdmin.Visible = false;
                            string sql = " Select ISNULL(T1.InvActive,'Y')InvActive From OAgent T0 Left Join Inv_Active T1 On T0.DocEntry=T1.AgentDocENtry " +
                                "Where T0.OrgEMail='" + Session["UserID"].ToString() + "'";
                            dt.Columns.Clear();
                            dt = Global.ExecuteQuery(sql);
                            if (dt.Rows[0]["InvActive"].ToString() == "N")
                            {
                                NavAgentInvoice.Visible = false;
                            }
                        }
                    }
                }
                catch
                {
                    Response.Redirect("~/FrmSignIN.aspx");
                }
            }
        }
        protected void NavLogout_ServerClick(object sender, EventArgs e)
        {
            Session["UserID"] = "";
            Session["UserName"] = "";
            Session["Mobile"] = "";
            Session["DocEntry"] = "";
            Session["UserType"] = "";
            Session["ApprovalStatus"] = "";
            Session["AgreementStarus"] = "";
            Session["PcName"] = "";
            Response.Redirect("~/FrmIndex.aspx");
        }
    }
}