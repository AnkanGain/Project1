using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgentSignUP : System.Web.UI.Page
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
            TxtName.Value = "";
            TxtEmail.Value = "";
            TxtPassword.Value = "";
            TxtPhonNo.Value = "";
            Timer1.Enabled = false;
            LblSuccessful.Text = "";
            ChkUserTerms.Checked = false;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (ChkUserTerms.Checked != true)
            {
                LblSuccessful.Text = "Please, accept our Terms & Condtions.";
                LblSuccessful.ForeColor = System.Drawing.Color.Red;
                Timer1.Enabled = true;
                return;
            }

            string sql = "Select * From OAgent Where (OrgEmail='" + TxtEmail.Value + "' Or OrgMobile='" + TxtPhonNo.Value + "')";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            if (dt.Rows.Count > 0)
            {
                LblSuccessful.Text = "Sorry, this Email ID/Phone No. already exists!";
                LblSuccessful.ForeColor = System.Drawing.Color.Red;
                Timer1.Enabled = true;
                return;
            }

            Session["RUserName"] = TxtName.Value.Replace("'", "").Replace("\"", "");
            Session["RUserID"] = TxtEmail.Value;
            Session["RPhonNo"] = TxtPhonNo.Value;
            Session["RPassword"] = TxtPassword.Value;

            string strNewPassword = Global.GeneratePassword().ToString();
            Session["OTP"] = strNewPassword;

            string bodyText = "N'" + strNewPassword + " is the OTP to Sign up at 4SME '+@CRLF+@CRLF+ N'Team 4SME'";
            string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                " EXEC msdb.dbo.sp_send_dbmail  " +
                " @profile_name = '4sme Mail',  " +
                " @recipients = '" + Session["RUserID"].ToString() + "', " +
                " @blind_copy_recipients = 'partner@4sme.in', " +
                " @subject = 'Email Verification for 4SME',  " +
                " @body = @BodyText; ";
            Global.ExecuteDBMail(sql2);

            //string strMobilePassword = Global.GeneratePassword().ToString();
            //Session["OTPMobile"] = strMobilePassword;
            //string smsURL = "https://103.229.250.200/smpp/sendsms?username=forsmeapi&password=" +
            //    "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5teXZhbHVlZmlyc3QuY29tL3BzbXMiLCJzdWIiOiJmb3JzbWVhcGkiLCJleHAiOjE2OTA0NTMyNzJ9." +
            //    "TJxkzgC6kZuyKEKLJfiAO-zMvnEjE7ZiL3wSkcABFos&to=" + Session["RPhonNo"].ToString() + "" +
            //    "&from=FORSME&text=Dear " + Session["RUserName"].ToString() + ", Your Login OTP is " + strMobilePassword + ". Regards FORSME";
            //string strResponce = Global.GetResponse(smsURL);

            Timer1.Enabled = true;
            LblSuccessful.Text = "OTP sent Successfully";
            LblSuccessful.ForeColor = System.Drawing.Color.ForestGreen;


            Response.Redirect("~/FrmAgentOTPVerify.aspx", false);

            btnSignUp.Enabled = false;
        }
        
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ClearData();
        }
    }
}