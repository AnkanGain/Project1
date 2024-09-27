using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnChangePassword_Click(object sender, EventArgs e)
        {
            if (TxtOldPass.Text == Session["Password"].ToString() && TxtNewPass1.Text == TxtNewPass2.Text)
            {
                string sql = "Update OAgent set OrgPassword='" + TxtNewPass1.Text + "' Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                Global.ExecuteNonQuery(sql);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Congratulations ! You Have Successfully Change Your Password.')", true);
                TxtOldPass.Text = "";
                TxtNewPass1.Text = "";
                TxtNewPass2.Text = "";
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Input. Please, try again!')", true);
            }
        }
    }
}