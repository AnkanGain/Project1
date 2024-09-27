using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string sql = string.Empty;
            if (TxtPassword.Value != TxtConfirmPassword.Value)
            {
                LblPassword.Visible = true;
                LblPassword.Text = "Password Not Matched.";
                return;
            }
            if (Session["UserType"].ToString() == "ADMIN")
            {
                sql = " Update OAdmin Set Password='" + TxtPassword.Value + "' " +
                " Where EMail='" + Session["UserID"].ToString() + "'";
            }
            else
            {
                sql = " Update OAgent Set OrgPassword='" + TxtPassword.Value + "' " +
                " Where OrgEMail='" + Session["UserID"].ToString() + "'";
            }
                       
            if (Global.ExecuteNonQuery(sql) == true)
            {
                Response.Redirect("~/FrmSignIN.aspx", false);
            }
        }
    }
}