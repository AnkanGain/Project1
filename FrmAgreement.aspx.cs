using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgreement : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string TableImage = "Agent1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearData();
            }
        }
        public void ClearData()
        {
            Timer1.Enabled = false;
            LblSuccessful.Text = "";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ClearData();
        }

        private void MailPDF()
        {
            string bodyText = "N'Hi,'+@CRLF+ N'" +
                    "Thanks for successfully uploading the Agreements.'+@CRLF+ N'" +
                    "We will do the needful at our end and get back to you.'+@CRLF+ N'" +
                    "You are now an approved associate of TEAM 4SME, we look forward to work together.'+@CRLF+@CRLF+ N'" +
                    "Cheers'+@CRLF+ N'" +
                    "Team 4SME'";
            string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                    " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                    " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                " EXEC msdb.dbo.sp_send_dbmail  " +
                " @profile_name = '4sme Mail',  " +
                " @recipients = '" + Session["UserID"].ToString() + "', " +
                " @blind_copy_recipients = 'partner@4sme.in', " +
                " @subject = 'Welcome Aboard 4SME !!',  " +
                " @body = @BodyText; ";
            Global.ExecuteDBMail(sql2);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int fileSize = UploadAgreements.PostedFile.ContentLength;
            // Allow only files less than 2,100,000 bytes (approximately 2 MB) to be uploaded.
            if (fileSize > 524288 * 10)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File size must not exceed 5 mb.')", true);
                return;
                // do something if the file is too big
            }
            else if (fileSize == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please choose agreement file')", true);
                return;
                // do something if the file is too big
            }
            string sql = "Select * From Agent1 Where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='Agreements'";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0 && Request.QueryString["REJECTA"] != "Y")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agreements already send for verification.')", true);
            }
            else
            {
                string LineID5 = "0";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();

                try
                {
                    DataTable dtb2 = new DataTable();
                    dtb2.Columns.Add("DocEntry", typeof(string));
                    dtb2.Columns.Add("LineID", typeof(string));
                    dtb2.Columns.Add("DocName", typeof(string));
                    dtb2.Columns.Add("OrgName", typeof(string));
                    dtb2.Columns.Add("FileName", typeof(string));
                    dtb2.Columns.Add("FileData", typeof(byte[]));


                    string DocEntry = Session["DocEntry"].ToString();
                    sql = "Select MAX(LineID)+1 From Agent1 Where DocEntry='" + DocEntry + "' And DocName<>'Agreements'";
                    dt.Rows.Clear();
                    dt = Global.ExecuteQuery(sql);
                    if (dt.Rows.Count > 0)
                    {
                        LineID5 = dt.Rows[0][0].ToString();
                    }

                    foreach (HttpPostedFile upload in UploadAgreements.PostedFiles)
                    {
                        string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='Agreements'";
                        Global.ExecuteNonQuery(delSql);

                        string fileEx = System.IO.Path.GetExtension(upload.FileName);
                        string newName = Session["Mobile"].ToString() + "Agreements" + fileEx;
                        string fileN = newName;
                        string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);
                        string DocName = "Agreements";
                        upload.SaveAs(fileP);
                        System.IO.Stream Stream = upload.InputStream;
                        Stream.Position = 0;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                        byte[] bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));

                        dtb2.Rows.Add(DocEntry, LineID5, DocName, upload.FileName, fileN, bytes);
                    }
                    SqlBulkCopy sqlBulk5 = new SqlBulkCopy(con);
                    sqlBulk5.DestinationTableName = TableImage;
                    sqlBulk5.WriteToServer(dtb2);

                    string UpSql = " Update OAgent Set AgreementAttechment='Y' , AgreementApprovedStarus='', AgreementDate=GETDATE() Where DocEntry='" + DocEntry + "'";
                    if (Global.ExecuteNonQuery(UpSql) == true)
                    {
                        MailPDF();
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File Uploaded Successfully.')", true);
                        //btnSave.Enabled = false;
                        Response.Redirect("~/FrmSignIN.aspx?Agreement=Y", false);
                    }
                }
                catch (Exception ex)
                {
                    LblSuccessful.Text = "Problem in uploading file.";
                    Timer1.Enabled = true;
                    return;
                }
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
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