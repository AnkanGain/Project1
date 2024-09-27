using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Net;

namespace S_FACTOR_VMS
{
    public class Global
    {
        public static string NextID(string ColName, string TblName)
        {
            DataTable dt = new DataTable();
            int NextID = 0;
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();
                DataSet ds = new DataSet();
                string sql = "Select IsNull(MAX(convert(INT,SUBSTRING(" + ColName + ", 2, 8))),0) From " + TblName + "";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.Fill(ds);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    NextID = Int16.Parse(dt.Rows[0][0].ToString()) + 1;
                }
                else
                {
                    NextID = 1;
                }
                con.Close();

            }
            catch { }
            finally
            {
                dt.Dispose();
            }
            return NextID.ToString();
        }
        public static string GetResponse(string smsURL)
        {
            try
            {
                WebClient objWebClient = new WebClient();
                System.IO.StreamReader reader = new System.IO.StreamReader(objWebClient.OpenRead(smsURL));
                string ResultHTML = reader.ReadToEnd();
                return ResultHTML;
            }
            catch (Exception)
            {
                return "Fail";
            }
        }

        public static string GeneratePassword()
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
        public static DataTable ExecuteQuery(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.Fill(ds);
                dt = ds.Tables[0];
                con.Close();
            }
            catch (Exception)
            {
                //throw new Exception(EX.Message);
                HttpContext.Current.Response.Redirect("~/FrmSignIN.aspx", false);
            }
            return dt;
        }
        public static bool ExecuteNonQuery(string sql)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message+ sql);
                //HttpContext.Current.Response.Redirect("~/FrmSignIN.aspx", false);
                return false;
            }
            return true;
        }
        public static bool ExecuteDBMail(string sql)
        {
            try
            {
                string DBString = "Data Source=120.138.8.167;uid=erp;pwd=ERP#SFactor;Initial Catalog=msdb";
                SqlConnection con = new SqlConnection(DBString);
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                //throw new Exception(EX.Message);
                HttpContext.Current.Response.Redirect("~/FrmSignIN.aspx", false);
            }
            return true;
        }
    }
}