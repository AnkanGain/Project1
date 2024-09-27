using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace S_FACTOR_VMS
{
    public partial class FrmAgentInvoice : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string TableImageIn = "OINV";
        string TableImage = "INV1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Added below 13/09/23
                GSTRate();
                ClearData();
            }
        }
        public void ClearData()
        {
            TxtPmtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            //Added below 13/09/23
            TxtInvNo.Text = "";
            TxtGrossAmt.Text = "0";
            CmbGSTRate.Text = "18.00";
            TxtGSTAmt.Text = "0";
            TxtTotalAmt.Text = "0";
            TxtRemarks.Text = "";
        }
        //Added below 13/09/23
        private void GSTRate()
        {
            string Sql = "Select GSTRate From GSTRate";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(Sql);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CmbGSTRate.Items.Add(dt.Rows[i]["GSTRate"].ToString());
                }
            }
        }

        private bool SaveAttach(int DocNo)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();
                int DocEntry = DocNo;
                int LineID5 = 1;
                DataTable dtb3 = new DataTable();
                dtb3.Columns.Add("DocEntry", typeof(int));
                dtb3.Columns.Add("LineID", typeof(string));
                dtb3.Columns.Add("DocName", typeof(string));
                dtb3.Columns.Add("OrgName", typeof(string));
                dtb3.Columns.Add("FileName", typeof(string));
                dtb3.Columns.Add("FileData", typeof(byte[]));
                dtb3.Columns.Add("Remarks", typeof(string));

                foreach (HttpPostedFile upload in AttachFile.PostedFiles)
                {
                    string fileEx = System.IO.Path.GetExtension(upload.FileName);
                    string newName = DocEntry + "_" + LineID5 + fileEx;
                    string fileN = newName;
                    string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);
                    upload.SaveAs(fileP);
                    System.IO.Stream Stream = upload.InputStream;
                    Stream.Position = 0;
                    System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                    byte[] bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));

                    dtb3.Rows.Add(DocEntry, LineID5, "Supporting Document", upload.FileName, fileN, bytes, "");
                    LineID5 = LineID5 + 1;
                }
                SqlBulkCopy sqlBulk5 = new SqlBulkCopy(con);
                sqlBulk5.DestinationTableName = TableImage;
                sqlBulk5.WriteToServer(dtb3);
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        private void PaymentWithdrawal()
        {
            int EntryNo = 0;
            string sql = "Select ISNULL(MAX(DocEntry)+1,1) DocEntry From OINV";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (dt.Rows.Count > 0)
            {
                EntryNo = int.Parse(dt.Rows[0]["DocEntry"].ToString());
            }
            else
            {
                EntryNo = 1;
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();

            try
            {
                DataTable dtb2 = new DataTable();
                dtb2.Columns.Add("EntryNo", typeof(int));
                dtb2.Columns.Add("UserID", typeof(string));
                dtb2.Columns.Add("UserDocEntry", typeof(string));
                dtb2.Columns.Add("InvNo", typeof(string));
                dtb2.Columns.Add("InvDate", typeof(string));
                //Added below 13/09/23
                dtb2.Columns.Add("GrossAmt", typeof(string));
                dtb2.Columns.Add("GSTRate", typeof(string));
                dtb2.Columns.Add("GSTAmt", typeof(string));
                dtb2.Columns.Add("InvAmt", typeof(string));
                dtb2.Columns.Add("Remarks", typeof(string));
                dtb2.Columns.Add("InvOrgFileName", typeof(string));
                dtb2.Columns.Add("InvFileName", typeof(string));
                dtb2.Columns.Add("InvAttachment", typeof(byte[]));
                dtb2.Columns.Add("CreatedDate", typeof(string));
                dtb2.Columns.Add("ApprovalStatus", typeof(string));

                if (InvoiceUpload.HasFile == true)
                {
                    foreach (HttpPostedFile upload in InvoiceUpload.PostedFiles)
                    {
                        //Added below 13/09/23
                        string GrossAmt = "0";
                        string GstRate = "0";
                        string Gstamt = "0";
                        string TotalAmt = "0";
                        bool GrAmt = double.TryParse(TxtGrossAmt.Text, out double n);
                        bool GSTR = double.TryParse(CmbGSTRate.Text, out double m);
                        bool GSTA = double.TryParse(TxtGSTAmt.Text, out double o);
                        bool TAmt = double.TryParse(TxtTotalAmt.Text, out double p);
                        if (GrAmt == false)
                        {
                            GrossAmt = "0";
                        }
                        else
                        {
                            GrossAmt = TxtGrossAmt.Text;
                        }

                        if (GSTR == false)
                        {
                            GstRate = "0";
                        }
                        else
                        {
                            GstRate = CmbGSTRate.Text;
                        }

                        if (GSTA == false)
                        {
                            Gstamt = "0";
                        }
                        else
                        {
                            Gstamt = TxtGSTAmt.Text;
                        }
                        if (TAmt == false)
                        {
                            TotalAmt = "0";
                        }
                        else
                        {
                            TotalAmt = TxtTotalAmt.Text;
                        }
                        string AttachmentDate = DateTime.Now.ToString();
                        string fileEx = System.IO.Path.GetExtension(upload.FileName);
                        string newName = EntryNo + "Invoice" + fileEx;
                        string fileN = newName;
                        string fileP = System.IO.Path.Combine(Server.MapPath("~/wwwroot/images/"), newName);

                        FileInfo file = new FileInfo(fileP);
                        if (file.Exists)//check file exsit or not  
                        {
                            file.Delete();
                        }

                        upload.SaveAs(fileP);
                        System.IO.Stream Stream = upload.InputStream;
                        Stream.Position = 0;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(Stream);
                        byte[] bytes = br.ReadBytes(System.Convert.ToInt32(Stream.Length));

                        dtb2.Rows.Add(EntryNo, Session["UserID"].ToString(), Session["DocEntry"].ToString(), TxtInvNo.Text, TxtPmtDate.Text, GrossAmt, GstRate, Gstamt, TotalAmt,
                            TxtRemarks.Text, upload.FileName, fileN, bytes, AttachmentDate, "");
                    }

                    SqlBulkCopy sqlBulk5 = new SqlBulkCopy(con);
                    sqlBulk5.DestinationTableName = TableImageIn;
                    //left side columns in datatable and right side columns in server
                    sqlBulk5.ColumnMappings.Add("EntryNo", "DocEntry");
                    sqlBulk5.ColumnMappings.Add("UserID", "UserID");
                    sqlBulk5.ColumnMappings.Add("UserDocEntry", "UserDocEntry");
                    sqlBulk5.ColumnMappings.Add("InvNo", "InvNo");
                    sqlBulk5.ColumnMappings.Add("InvDate", "InvDate");
                    sqlBulk5.ColumnMappings.Add("GrossAmt", "GrossAmt");
                    sqlBulk5.ColumnMappings.Add("GSTRate", "GSTRate");
                    sqlBulk5.ColumnMappings.Add("GSTAmt", "GSTAmt");
                    sqlBulk5.ColumnMappings.Add("InvAmt", "InvAmt");
                    sqlBulk5.ColumnMappings.Add("Remarks", "Remarks");
                    sqlBulk5.ColumnMappings.Add("InvOrgFileName", "InvOrgFileName");
                    sqlBulk5.ColumnMappings.Add("InvFileName", "InvFileName");
                    sqlBulk5.ColumnMappings.Add("InvAttachment", "InvAttachment");
                    sqlBulk5.ColumnMappings.Add("CreatedDate", "CreatedDate");
                    sqlBulk5.ColumnMappings.Add("ApprovalStatus", "ApprovalStatus");

                    sqlBulk5.WriteToServer(dtb2);

                    if (SaveAttach(EntryNo) == true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invoice Saved.')", true);
                        ClearData();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invoice Not Saved.')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invoice Not Saved,Please try again.')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error," + ex.Message + "')", true);
                //throw ex;
            }
        }

        protected void BtnPayWithdrawal_Click(object sender, EventArgs e)
        {
            int fileSize = InvoiceUpload.PostedFile.ContentLength;
            // Allow only files less than 2,100,000 bytes (approximately 2 MB) to be uploaded.
            if (fileSize > 524288 * 10)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File(s) size must not exceed more than 5 mb')", true);
                return;
                // do something if the file is too big
            }

            string sql = "Select * from OINV Where InvNo='" + TxtInvNo.Text + "' And UserID='" + Session["UserID"].ToString() + "'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This invoice Number already exists!')", true);
                return;
            }
            PaymentWithdrawal();
        }
        protected void CmbGSTRate_TextChanged(object sender, EventArgs e)
        {
            if (CmbGSTRate.Text == "0.00")
            {
                TxtGSTAmt.Text = "0";
                TxtTotalAmt.Text = TxtGrossAmt.Text;
                return;
            }
            TxtGSTAmt.Text = (double.Parse(TxtGrossAmt.Text) * (double.Parse(CmbGSTRate.Text)) / 100).ToString();
            TxtTotalAmt.Text = (double.Parse(TxtGrossAmt.Text) + double.Parse(TxtGSTAmt.Text)).ToString();
        }

        protected void TxtGrossAmt_TextChanged(object sender, EventArgs e)
        {
            if (TxtGrossAmt.Text == "0" && CmbGSTRate.Text == "0.00")
            {
                TxtGSTAmt.Text = "0";
                TxtTotalAmt.Text = TxtGrossAmt.Text;
                return;
            }
            TxtGSTAmt.Text = (double.Parse(TxtGrossAmt.Text) * (double.Parse(CmbGSTRate.Text)) / 100).ToString();
            TxtTotalAmt.Text = (double.Parse(TxtGrossAmt.Text) + double.Parse(TxtGSTAmt.Text)).ToString();
        }
    }
}