using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgentOTPVerify : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearData();

                Timer1.Enabled = true;
                TimeSpan time = TimeSpan.FromSeconds(180);
                string str = time.ToString(@"hh\:mm\:ss");
                BtnGetOTP.Text = str;

                lblMessage.Text = "OTP Sent Successfully!";
                lblMessage.ForeColor = System.Drawing.Color.ForestGreen;
            }
        }

        public void clearData()
        {
            Timer2.Enabled = false;
            LblSuccessful.Text = "";
            lblMessage.Text = "";
        }

        protected void BtnVerifyOTP_Click(object sender, EventArgs e)
        {
            ///Button Verify

            if (TxtOTPMail.Text == Session["OTP"].ToString())   // && TxtOTPPhn.Text == Session["OTPMobile"].ToString()
            {
                string sql = "Insert into OAgent (OrgName, OrgEmail, OrgEmailVerified, OrgMobile, OrgMobileVerified, OrgPassword, RegisteredDate) Values ";
                sql = sql + "('" + Session["RUserName"].ToString() + "','" + Session["RUserID"].ToString() + "','Y',";
                sql = sql + "'" + Session["RPhonNo"].ToString() + "','Y','" + Session["RPassword"].ToString() + "',GetDate())";

                if (Global.ExecuteNonQuery(sql) == true)
                {

                    LblSuccessful.Text = "Save Successful";
                    Response.Redirect("~/FrmSignIN.aspx?Registered=Y", false);
                }
            }
            else
            {
                LblSuccessful.Text = "Wrong OTP";
                Timer2.Enabled = true;
                lblMessage.Text = "Request for another OTP!";
                lblMessage.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void BtnGetOTP_Click(object sender, EventArgs e)
        {
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

            lblMessage.Text = "OTP Sent Successfully";
            lblMessage.ForeColor = System.Drawing.Color.ForestGreen;

            Timer1.Enabled = true;
            TimeSpan time = TimeSpan.FromSeconds(180);
            string str = time.ToString(@"hh\:mm\:ss");
            BtnGetOTP.Text = str;
            BtnVerifyOTP.Visible = true;

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(BtnGetOTP.Text).TotalSeconds - 1);
            string fromTimeString = result.ToString(@"hh\:mm\:ss");
            BtnGetOTP.Text = fromTimeString;

            if (BtnGetOTP.Text == "00:00:00")
            {
                BtnGetOTP.Text = "Resend OTP";
                BtnGetOTP.Enabled = true;
                Timer1.Enabled = false;
                lblMessage.Text = "Request for another OTP!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Session["OTP"] = "";
                LblSuccessful.Text = "";

                TxtOTPMail.Text = "";
                TxtOTPPhn.Text = "";

            }
            else
            {
                BtnGetOTP.Enabled = false;
            }
        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            clearData();
        }
    }
}