using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace S_FACTOR_VMS
{
    public partial class FrmAgentProfile : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            string sql = "Select * from OAgent Where DocEntry='" + Session["DocEntry"].ToString() + "'";
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
    }
}