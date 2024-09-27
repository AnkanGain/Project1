using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml.Linq;
using System.Drawing.Printing;
using System.IO;

namespace S_FACTOR_VMS
{
    public partial class FrmBusinessRegister : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string TableImage = "Agent1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBank();
                LoadState();
                findData();

                //if (Request.QueryString["REJECTP"] == "Y")
                //{
                //    findData();
                //}
            }
        }
        public void findData()
        {
            string sql = "Select * From OAgent Where DocEntry='" + Session["DocEntry"].ToString() + "'";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0 && dt.Rows[0]["TradeName"].ToString() != "")
            {
                CmbEntityType.Text = dt.Rows[0]["BusinessType"].ToString();
                TxtEntityName.Text = dt.Rows[0]["TradeName"].ToString();
                TxtAddress.Text = dt.Rows[0]["Address"].ToString();
                TxtCity.Text = dt.Rows[0]["City"].ToString();
                TxtPin.Text = dt.Rows[0]["Pin"].ToString();
                TxtDist.Text = dt.Rows[0]["District"].ToString();
                CmbState.Text = dt.Rows[0]["State"].ToString();
                TxtAadhar.Text = dt.Rows[0]["Aadhar"].ToString();
                TxtPAN.Text = dt.Rows[0]["PAN"].ToString();
                TxtGST.Value = dt.Rows[0]["GST"].ToString();
                TxtCName.Text = dt.Rows[0]["CPName"].ToString();
                TxtCDesig.Text = dt.Rows[0]["CPDesignation"].ToString();
                TxtCPhn.Text = dt.Rows[0]["CPMobile"].ToString();
                TxtCMail.Text = dt.Rows[0]["CPEmailID"].ToString();
                CmbBank.Text = dt.Rows[0]["BankName"].ToString();
                //TxtBranch.Text = dt.Rows[0]["BranchName"].ToString();
                TxtIFSC.Text = dt.Rows[0]["IFSC"].ToString();
                TxtAccNo.Text = dt.Rows[0]["AccountNo"].ToString();
                TxtAccHolder.Text = dt.Rows[0]["BenifesiryName"].ToString();

                //sql = "Select * From Agent1 Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                //dt.Rows.Clear();
                //dt = Global.ExecuteQuery(sql);
                //if (dt.Rows.Count > 0)
                //{
                //    for(int i = 0; i < dt.Rows.Count - 1; i++)
                //    {
                //        if (dt.Rows[i]["DocName"].ToString() == "Aadhar")
                //        {
                //            //LnkAadhar.Visible = true;
                //            AadharUpload.Visible = false;
                //            LnkAadhar.Text = dt.Rows[i]["OrgName"].ToString();
                //            LnkAadhar.ID = dt.Rows[i]["FileName"].ToString();
                //        }
                //        else if (dt.Rows[i]["DocName"].ToString() == "PAN")
                //        {
                //            //LnkPAN.Visible = true;
                //            PanUpdload.Visible = false;
                //            LnkPAN.Text = dt.Rows[i]["OrgName"].ToString();
                //            LnkPAN.ID = dt.Rows[i]["FileName"].ToString();
                //        }
                //        else if (dt.Rows[i]["DocName"].ToString() == "GST")
                //        {
                //            //LnkGST.Visible = true;
                //            GstUpload.Visible = false;
                //            LnkGST.Text = dt.Rows[i]["OrgName"].ToString();
                //            LnkGST.ID = dt.Rows[i]["FileName"].ToString();
                //        }
                //        else if (dt.Rows[i]["DocName"].ToString() == "CHEQUE")
                //        {
                //            //LnkCheque.Visible = true;
                //            CCheckUpload.Visible = false;
                //            LnkCheque.Text = dt.Rows[i]["OrgName"].ToString();
                //            LnkCheque.ID = dt.Rows[i]["FileName"].ToString();
                //        }
                //    }                       
                //}               
            }
        }

        public void ClearData()
        {
            CmbEntityType.Text = "--Select--";
            TxtEntityName.Text = "";
            TxtAddress.Text = "";
            TxtCity.Text = "";
            TxtDist.Text = "";
            TxtPin.Text = "";
            CmbState.Text = "--Select--";
            TxtCName.Text = "";
            TxtCDesig.Text = "";
            TxtCPhn.Text = "";
            TxtCMail.Text = "";
            CmbBank.Text = "--Select--";
            //TxtBranch.Text = "";
            TxtIFSC.Text = "";
            TxtAccNo.Text = "";
            TxtAccHolder.Text = "";
            TxtAadhar.Text = "";
            TxtPAN.Text = "";
            TxtGST.Value = "";
        }
        private void LoadBank()
        {
            string sql = "Select BankName From PayOBank Order By BankName";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CmbBank.Items.Add(dt.Rows[i]["BankName"].ToString());
                }
            }
        }
        private void LoadState()
        {
            string sql = "Select StateName From OState Order By StateName";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CmbState.Items.Add(dt.Rows[i]["StateName"].ToString());
                }
            }
        }
        private bool ImageUpload()
        {
            int LineID5 = 0;
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
                try
                {
                    if (AadharUpload.HasFile == true)
                    {
                        foreach (HttpPostedFile upload in AadharUpload.PostedFiles)
                        {
                            string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='Aadhar'";
                            Global.ExecuteNonQuery(delSql);
                            string fileEx = System.IO.Path.GetExtension(upload.FileName);
                            string newName = Session["Mobile"].ToString() + "Aadhar" + fileEx;
                            string fileN = newName;
                            string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);

                            FileInfo file = new FileInfo(fileP);
                            if (file.Exists)//check file exsit or not  
                            {
                                file.Delete();
                            }

                            string DocName = "Aadhar";
                            upload.SaveAs(fileP);

                            byte[] bytes = new byte[0];
                            try
                            {
                                System.IO.Stream Stream = upload.InputStream;
                                Stream.Position = 0;
                                System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                                bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));
                            }
                            catch
                            {
                                bytes = new byte[0];
                            }

                            LineID5 = LineID5 + 1;

                            dtb2.Rows.Add(DocEntry, LineID5, DocName, upload.FileName, fileN, bytes);
                        }
                    }
                    else
                    {
                        string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='Aadhar'";
                        Global.ExecuteNonQuery(delSql);
                        string newName = Session["Mobile"].ToString() + "Aadhar";
                        string fileN = newName;
                        LineID5 = LineID5 + 1;
                        byte[] bytes= new byte[0];
                        dtb2.Rows.Add(DocEntry, LineID5, "Aadhar", "", fileN, bytes);
                    }
                }
                catch (Exception ex)
                {
                    string sql = "";
                    sql = sql + "Update OAgent Set";
                    sql = sql + " UpdatedDate = ''";
                    sql = sql + (char)13;
                    sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                    Global.ExecuteNonQuery(sql);

                    Session["EXM"] = ex.Message + "-Aadhar";
                    return false;
                }
                try
                {
                    foreach (HttpPostedFile upload in PanUpdload.PostedFiles)
                    {
                        string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='PAN'";
                        Global.ExecuteNonQuery(delSql);

                        string fileEx = System.IO.Path.GetExtension(upload.FileName);
                        string newName = Session["Mobile"].ToString() + "PAN" + fileEx;
                        string fileN = newName;
                        string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);

                        FileInfo file = new FileInfo(fileP);
                        if (file.Exists)//check file exsit or not  
                        {
                            file.Delete();
                        }

                        string DocName = "PAN";
                        upload.SaveAs(fileP);
                        byte[] bytes = new byte[0];
                        try
                        {
                            System.IO.Stream Stream = upload.InputStream;
                            Stream.Position = 0;
                            System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                            bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));
                        }
                        catch
                        {
                            bytes = new byte[0];
                        }
                        LineID5 = LineID5 + 1;

                        dtb2.Rows.Add(DocEntry, LineID5, DocName, upload.FileName, fileN, bytes);

                    }
                }
                catch (Exception ex)
                {
                    string sql = "";
                    sql = sql + "Update OAgent Set";
                    sql = sql + " UpdatedDate = ''";
                    sql = sql + (char)13;
                    sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                    Global.ExecuteNonQuery(sql);

                    Session["EXM"] = ex.Message + "-PAN";
                    return false;
                }
                try
                {
                    if (GstUpload.HasFile == true)
                    {
                        foreach (HttpPostedFile upload in GstUpload.PostedFiles)
                        {
                            string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='GST'";
                            Global.ExecuteNonQuery(delSql);

                            string fileEx = System.IO.Path.GetExtension(upload.FileName);
                            string newName = Session["Mobile"].ToString() + "GST" + fileEx;
                            string fileN = newName;
                            string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);

                            FileInfo file = new FileInfo(fileP);
                            if (file.Exists)//check file exsit or not  
                            {
                                file.Delete();
                            }

                            string DocName = "GST";
                            upload.SaveAs(fileP);
                            byte[] bytes = new byte[0];
                            try
                            {
                                System.IO.Stream Stream = upload.InputStream;
                                Stream.Position = 0;
                                System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                                bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));
                            }
                            catch
                            {
                                bytes = new byte[0];
                            }
                            LineID5 = LineID5 + 1;

                            dtb2.Rows.Add(DocEntry, LineID5, DocName, upload.FileName, fileN, bytes);
                        }
                    }
                    else
                    {
                        string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='GST'";
                        Global.ExecuteNonQuery(delSql);
                        string newName = Session["Mobile"].ToString() + "GST";
                        string fileN = newName;
                        LineID5 = LineID5 + 1;
                        byte[] bytes = new byte[0];
                        dtb2.Rows.Add(DocEntry, LineID5, "GST", "", fileN, bytes);
                    }
                }
                catch (Exception ex)
                {
                    string sql = "";
                    sql = sql + "Update OAgent Set";
                    sql = sql + " UpdatedDate = ''";
                    sql = sql + (char)13;
                    sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                    Global.ExecuteNonQuery(sql);

                    Session["EXM"] = ex.Message + "-GST";
                    return false;
                }
                try
                {
                    foreach (HttpPostedFile upload in CCheckUpload.PostedFiles)
                    {
                        string delSql = " Delete From " + TableImage + " where DocEntry='" + Session["DocEntry"].ToString() + "' And DocName='CHEQUE'";
                        Global.ExecuteNonQuery(delSql);

                        string fileEx = System.IO.Path.GetExtension(upload.FileName);
                        string newName = Session["Mobile"].ToString() + "CHEQUE" + fileEx;
                        string fileN = newName;
                        string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);

                        FileInfo file = new FileInfo(fileP);
                        if (file.Exists)//check file exsit or not  
                        {
                            file.Delete();
                        }

                        string DocName = "CHEQUE";
                        upload.SaveAs(fileP);
                        byte[] bytes = new byte[0];
                        try
                        {
                            System.IO.Stream Stream = upload.InputStream;
                            Stream.Position = 0;
                            System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                            bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));
                        }
                        catch
                        {
                            bytes = new byte[0];
                        }
                        LineID5 = LineID5 + 1;

                        dtb2.Rows.Add(DocEntry, LineID5, DocName, upload.FileName, fileN, bytes);

                    }
                }
                catch (Exception ex)
                {
                    string sql = "";
                    sql = sql + "Update OAgent Set";
                    sql = sql + " UpdatedDate = ''";
                    sql = sql + (char)13;
                    sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                    Global.ExecuteNonQuery(sql);

                    Session["EXM"] = ex.Message + "-Cheque";
                    return false;
                }
                SqlBulkCopy sqlBulk5 = new SqlBulkCopy(con);
                sqlBulk5.DestinationTableName = TableImage;
                sqlBulk5.WriteToServer(dtb2);
            }
            catch (Exception ex)
            {
                string sql = "";
                sql = sql + "Update OAgent Set";
                sql = sql + " UpdatedDate = ''";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                Global.ExecuteNonQuery(sql);

                Session["EXM"] = ex.Message + "-Image";
                return false;
            }
            return true;
        }
        private void MailPDF()
        {
            //using (StringWriter sw = new StringWriter())
            //{
            //    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            //    {
            //        using (StreamReader sr = new StreamReader(Server.MapPath("~/FrmAgreementDownload.aspx")))
            //        {
            //            Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            //            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //            pdfDoc.Open();
            //            htmlparser.Parse(sr);
            //            pdfDoc.Close();
            //            Response.ContentType = "application/pdf";
            //            Response.AddHeader("content-disposition", "attachment;filename=HTMLExport.pdf");
            //            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //            Response.Write(pdfDoc);
            //            Response.End();
            //        }
            //    }
            //}
            string bodyText = "N'Hi,'+@CRLF+ N'Thanks for showing interest in 4SME.'+@CRLF+ N'" +
                "We are in receipt of your application & documents to register with us. Relax, our team is looking into the same.'+@CRLF+ N'" +
                "You will hear from us within 48 hours.'+@CRLF+@CRLF+ N'" +
                "Cheers'+@CRLF+ N'" +
                "Team 4SME'";
            string sql2 = " DECLARE @CRLF char(2), @MailItemID int" +
                " SELECT @CRLF = CHAR(13) + CHAR(10)" +
                " Declare @BodyText As Nvarchar(2000)=" + bodyText + "" +
                " EXEC msdb.dbo.sp_send_dbmail  " +
                " @profile_name = '4sme Mail',  " +
                " @recipients = '" + Session["UserID"].ToString() + "', " +
                " @blind_copy_recipients = 'partner@4sme.in', " +
                " @subject = 'Thank you for showing interest in 4SME',  " +
                " @body = @BodyText; ";
            Global.ExecuteDBMail(sql2);
        }
        private void SaveData()
        {
            try
            {
                string sql = " Select DocEntry,OrgName,OrgEmail,OrgEmailVerified,OrgMobile,OrgMobileVerified,OrgPassword,RegisteredDate," +
                    " BusinessType,TradeName,Case When UpdatedDate='' Then '' Else CAST(UpdatedDate As nvarchar(20)) End UpdatedDate " +
                    " From OAgent Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                dt.Rows.Clear();
                dt = Global.ExecuteQuery(sql);
                if (dt.Rows.Count > 0 && (dt.Rows[0]["UpdatedDate"].ToString() == "" || Request.QueryString["REJECTP"] == "Y"))
                {
                    sql = "";
                    sql = sql + "Update OAgent Set";
                    sql = sql + " BusinessType = '" + CmbEntityType.Text + "' ,";
                    sql = sql + " TradeName = '" + TxtEntityName.Text.Replace("'", "").Replace("\"", "") + "' ,";
                    sql = sql + " Address = '" + TxtAddress.Text.Replace("'","").Replace("\"","") + "' ,";
                    sql = sql + " City = '" + TxtCity.Text + "' ,";
                    sql = sql + " Pin = '" + TxtPin.Text + "' ,";
                    sql = sql + " District = '" + TxtDist.Text + "' ,";
                    sql = sql + " State = '" + CmbState.Text + "' ,";
                    sql = sql + " Aadhar = '" + TxtAadhar.Text + "' ,";
                    if (TxtAadhar.Text != "")
                    {
                        sql = sql + " AadharAttachment = 'Y' ,";
                    }
                    else
                    {
                        sql = sql + " AadharAttachment = 'N' ,";
                    }
                    sql = sql + " PAN = '" + TxtPAN.Text + "' ,";
                    sql = sql + " PANAttachment = 'Y' ,";
                    sql = sql + " GST = '" + TxtGST.Value + "' ,";
                    if (TxtGST.Value != "")
                    {
                        sql = sql + " GSTAttachment = 'Y' ,";
                    }
                    else
                    {
                        sql = sql + " GSTAttachment = 'N' ,";
                    }
                    sql = sql + " CPName = '" + TxtCName.Text.Replace("'", "").Replace("\"", "") + "' ,";
                    sql = sql + " CPDesignation = '" + TxtCDesig.Text + "' ,";
                    sql = sql + " CPMobile = '" + TxtCPhn.Text + "' ,";
                    sql = sql + " CPMobileVerified = 'N' ,";
                    sql = sql + " CPEmailID = '" + TxtCMail.Text + "' ,";
                    sql = sql + " CPEmailIDVerified = 'N' ,";
                    sql = sql + " BankName = '" + CmbBank.Text + "' ,";
                    sql = sql + " BranchName = '' ,";
                    sql = sql + " IFSC = '" + TxtIFSC.Text + "' ,";
                    sql = sql + " AccountNo = '" + TxtAccNo.Text + "' ,";
                    sql = sql + " BenifesiryName = '" + TxtAccHolder.Text + "' ,";
                    sql = sql + " ChqAttachment = 'Y' ,";
                    sql = sql + " ApprovalStatus = '' ,";
                    sql = sql + " UpdatedDate = GETDATE() ";
                    sql = sql + (char)13;
                    sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                    if (Global.ExecuteNonQuery(sql) == true)
                    {
                        if (ImageUpload() == true)
                        {
                            MailPDF();
                            ClearData();
                            Response.Redirect("~/FrmSignIN.aspx?Account=Y", false);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data not saved, Please try again(" + Session["EXM"].ToString() + ").')", true);
                        }
                    }
                    else
                    {
                        sql = "";
                        sql = sql + "Update OAgent Set";
                        sql = sql + " BusinessType = '' ,";
                        sql = sql + " TradeName = '' ,";
                        sql = sql + " Address = '' ,";
                        sql = sql + " City = '' ,";
                        sql = sql + " Pin = '' ,";
                        sql = sql + " District = '' ,";
                        sql = sql + " State = '' ,";
                        sql = sql + " Aadhar = '' ,";
                        sql = sql + " AadharAttachment = '' ,";
                        sql = sql + " PAN = '' ,";
                        sql = sql + " PANAttachment = '' ,";
                        sql = sql + " GST = '' ,";
                        sql = sql + " GSTAttachment = '' ,";
                        sql = sql + " CPName = '' ,";
                        sql = sql + " CPDesignation = '' ,";
                        sql = sql + " CPMobile = '' ,";
                        sql = sql + " CPMobileVerified = '' ,";
                        sql = sql + " CPEmailID = '' ,";
                        sql = sql + " CPEmailIDVerified = '' ,";
                        sql = sql + " BankName = '' ,";
                        sql = sql + " BranchName = '' ,";
                        sql = sql + " IFSC = '' ,";
                        sql = sql + " AccountNo = '' ,";
                        sql = sql + " BenifesiryName = '' ,";
                        sql = sql + " ChqAttachment = '' ,";
                        sql = sql + " ApprovalStatus = '' ,";
                        sql = sql + " UpdatedDate = '' ";
                        sql = sql + (char)13;
                        sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                        Global.ExecuteNonQuery(sql);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data not saved, Please try again.')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Have Already Registered.')", true);
                }
            }
            catch (Exception ex)
            {
                string sql = "";
                sql = sql + "Update OAgent Set";
                sql = sql + " UpdatedDate = ''";
                sql = sql + (char)13;
                sql = sql + " Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                Global.ExecuteNonQuery(sql);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data not saved, Please try again(" + ex.Message + ").')", true);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int fileSize = CCheckUpload.PostedFile.ContentLength;
                if (fileSize > 0)
                {
                    SaveData();
                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {

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

        protected void ChkContact_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkContact.Checked == true)
            {
                TxtCName.Text = Session["UserName"].ToString();
                TxtCMail.Text = Session["UserID"].ToString();
                TxtCPhn.Text = Session["Mobile"].ToString();
                TxtCName.ReadOnly = true;
                TxtCMail.ReadOnly = true;
                TxtCPhn.ReadOnly = true;
            }
            else
            {
                TxtCName.Text = "";
                TxtCMail.Text = "";
                TxtCPhn.Text = "";
                TxtCName.ReadOnly = false;
                TxtCMail.ReadOnly = false;
                TxtCPhn.ReadOnly = false;
            }
        }
    }
}