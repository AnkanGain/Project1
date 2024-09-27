using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmForgetPassword : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BtnSendEmail.Visible = false;
                GeneratePassword();
                LblSuccessful.Text = "";
            }
        }
        public string GeneratePassword()
        {
            string PasswordLength = "4";
            string NewPassword = "";

            string allowedChars = "";
            allowedChars = "1,2,3,4,5,6,7,8,9,0";
            //allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            //allowedChars += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";


            char[] sep = {
            ','
        };
            string[] arr = allowedChars.Split(sep);


            string IDString = "";
            string temp = "";

            Random rand = new Random();

            for (int i = 0; i < Convert.ToInt32(PasswordLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                IDString += temp;
                NewPassword = IDString;

            }
            return NewPassword;
        }

        protected void BtnSendEmail_Click(object sender, EventArgs e)
        {
            if (TxtOTP.Value == Session["OTP"].ToString())
            {
                Response.Redirect("~/FrmResetPassword.aspx", false);
            }
            else
            {
                LblSuccessful.Text = "Wrong OTP";
            }
        }

        protected void BtnGetOTP_Click(object sender, EventArgs e)
        {
            string username = string.Empty;
            string password = string.Empty;

            string sql = "SELECT OrgEMail As UserID,OrgPassword As UserPassword,UserType FROM OUSR WHERE OrgEMail = '" + txtEmail.Value.Trim() + "'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                username = dt.Rows[0]["UserID"].ToString();
                password = dt.Rows[0]["UserPassword"].ToString();
                Session["UserType"] = dt.Rows[0]["UserType"].ToString();
                Session["UserID"] = username;
            }

            if (!string.IsNullOrEmpty(username))
            {
                string strNewPassword = GeneratePassword().ToString();
                Session["OTP"] = strNewPassword;

                string sql2 = " EXEC msdb.dbo.sp_send_dbmail  " +
                    " @profile_name = '4sme Mail',  " +
                    " @recipients = '" + txtEmail.Value + "', " +
                    " @blind_copy_recipients = 'partner@4sme.in', " +
                    " @subject = 'Verify Your Email.',  " +
                    " @body = 'Please use " + strNewPassword + " as OTP to verify your email ID.'; ";
                Global.ExecuteDBMail(sql2);

                lblMessage.Text = "Email Sent Successfully";
                lblMessage.ForeColor = System.Drawing.Color.ForestGreen;

                Timer1.Enabled = true;
                TimeSpan time = TimeSpan.FromSeconds(180);
                string str = time.ToString(@"hh\:mm\:ss");
                BtnGetOTP.Text = str;
                BtnSendEmail.Visible = true;
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "This email address does not match our records.";
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(BtnGetOTP.Text).TotalSeconds - 1);
            string fromTimeString = result.ToString(@"hh\:mm\:ss");
            BtnGetOTP.Text = fromTimeString;
            if (BtnGetOTP.Text == "00:00:00")
            {
                BtnGetOTP.Text = "Get OTP";
                BtnGetOTP.Enabled = true;
                Timer1.Enabled = false;
                lblMessage.Text = "";
                BtnSendEmail.Visible = false;
                Session["OTP"] = "";
                LblSuccessful.Text = "";
            }
            else
            {
                BtnGetOTP.Enabled = false;
                TxtOTP.Focus();
            }
        }
    }
}