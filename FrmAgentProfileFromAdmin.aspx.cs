using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgentProfileFromAdmin : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAgent();
            }
        }
        private void BindAgent()
        {
            string ID = Request.QueryString["ID"];
            string sql = " Declare @DocEntry as nvarchar(10)='" + ID + "'" +
                " Select TradeName As OrgName,DocEntry From OAgent Where (DocEntry=@DocEntry Or @DocEntry='') And TradeName<>'' Order By TradeName";
            dt.Rows.Clear();
            dt = Global.ExecuteQuery(sql);
            if (ID != null || ID == "")
            {
                CmbAgentID.Items.Add(new ListItem(dt.Rows[0]["OrgName"].ToString(), dt.Rows[0]["DocEntry"].ToString()));
                CmbAgentID.SelectedIndex = 1;
                BindData();
            }
            else if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CmbAgentID.Items.Add(new ListItem(dt.Rows[i]["OrgName"].ToString(), dt.Rows[i]["DocEntry"].ToString()));
                }
            }
        }
        private void BindData()
        {
            if (CmbAgentID.Text=="--Select--")
            {
                return;
            }
            string sql = "Select * from OAgent Where DocEntry='" + CmbAgentID.Text + "'";
            dt.Columns.Clear();
            dt = Global.ExecuteQuery(sql);

            if (dt.Rows.Count > 0)
            {
                TxtEntityType.Text = dt.Rows[0]["BusinessType"].ToString();
                TxtEntityName.Text = dt.Rows[0]["TradeName"].ToString();

                TxtAddress.Text = dt.Rows[0]["Address"].ToString();
                TxtCity.Text = dt.Rows[0]["City"].ToString();
                TxtDist.Text = dt.Rows[0]["District"].ToString();
                TxtState.Text = dt.Rows[0]["State"].ToString();
                TxtPincode.Text = dt.Rows[0]["Pin"].ToString();

                TxtAadhar.Text = dt.Rows[0]["Aadhar"].ToString();
                TxtPAN.Text = dt.Rows[0]["PAN"].ToString();
                TxtGST.Text = dt.Rows[0]["GST"].ToString();

                TxtCDesig.Text = dt.Rows[0]["CPDesignation"].ToString();
                TxtCEmailID.Text = dt.Rows[0]["CPEmailID"].ToString();
                TxtCPName.Text = dt.Rows[0]["CPName"].ToString();
                TxtCPhone.Text = dt.Rows[0]["CPMobile"].ToString();

                TxtBank.Text = dt.Rows[0]["BankName"].ToString();
                TxtBranch.Text = dt.Rows[0]["BranchName"].ToString();
                TxtIFCS.Text = dt.Rows[0]["IFSC"].ToString();
                TxtAccountNo.Text = dt.Rows[0]["AccountNo"].ToString();
                TxtAccHolName.Text = dt.Rows[0]["BenifesiryName"].ToString();

                Session["DocEntry"] = dt.Rows[0]["DocEntry"].ToString();
                sql = "Select * From Agent1 Where DocEntry='" + Session["DocEntry"].ToString() + "'";
                dt.Rows.Clear();
                dt = Global.ExecuteQuery(sql);
                if (dt.Rows.Count == 4)
                {
                    LnkAgreements.Enabled = false;
                    LnkAgreements.Visible = false;
                }
                if (dt.Rows.Count == 0)
                {
                    LnkAadhar.Enabled = false;
                    LnkAadhar.Visible = false;
                    LnkPAN.Enabled = false;
                    LnkPAN.Visible = false;
                    LnkGST.Enabled = false;
                    LnkGST.Visible = false;
                    LnkCheque.Enabled = false;
                    LnkCheque.Visible = false;
                    LnkAgreements.Enabled = false;
                    LnkAgreements.Visible = false;
                }
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        if (dt.Rows[i]["DocName"].ToString() == "Aadhar")
                        {
                            if (dt.Rows[i]["OrgName"].ToString() == "")
                            {
                                LnkAadhar.Enabled = false;
                                LnkAadhar.Visible = false;
                            }
                            LnkAadhar.ID = dt.Rows[i]["FileName"].ToString();
                        }
                        else if (dt.Rows[i]["DocName"].ToString() == "PAN")
                        {
                            if (dt.Rows[i]["OrgName"].ToString() == "")
                            {
                                LnkPAN.Enabled = false;
                                LnkPAN.Visible = false;
                            }
                            LnkPAN.ID = dt.Rows[i]["FileName"].ToString();
                        }
                        else if (dt.Rows[i]["DocName"].ToString() == "GST")
                        {
                            if (dt.Rows[i]["OrgName"].ToString() == "")
                            {
                                LnkGST.Enabled = false;
                                LnkGST.Visible = false;
                            }
                            LnkGST.ID = dt.Rows[i]["FileName"].ToString();
                        }
                        else if (dt.Rows[i]["DocName"].ToString() == "CHEQUE")
                        {
                            if (dt.Rows[i]["OrgName"].ToString() == "")
                            {
                                LnkCheque.Enabled = false;
                                LnkCheque.Visible = false;
                            }
                            LnkCheque.ID = dt.Rows[i]["FileName"].ToString();
                        }
                        else if (dt.Rows[i]["DocName"].ToString() == "Agreements")
                        {
                            if (dt.Rows[i]["OrgName"].ToString() == "")
                            {
                                LnkAgreements.Enabled = false;
                                LnkAgreements.Visible = false;
                            }
                            LnkAgreements.ID = dt.Rows[i]["FileName"].ToString();
                        }
                    }
                }
            }
        }

        protected void CmbAgentID_TextChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}