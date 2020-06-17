using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Admin_Default3 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db_EcomConnectionString"].ToString());
    DataSet1TableAdapters.TblSubCategoryTableAdapter subCat = new DataSet1TableAdapters.TblSubCategoryTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSubCategoryId.Visible = false;
        if (!IsPostBack)
        {
            if (Request.Url.Query.Contains("cid"))
            {
                SqlCommand cmd = new SqlCommand("Select * from TblSubCategory where SubCategoryId='" + Request.QueryString["cid"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        DropDownListcat.SelectedValue = dr["CategoryId"].ToString();
                        TxtSubCat.Text = dr["SubCategoryName"].ToString();
                        lblSubCategoryId.Text = Request.QueryString["cid"];
                        TxtShortdesc.Text = dr["ShortDescription"].ToString();
                        Txtremark.Text = dr["remark"].ToString();
                        TxtDesc.Text = dr["Description"].ToString();
                        DropDownListStatus.SelectedValue = dr["Status"].ToString();
                        ImageSubCat.ImageUrl = "../photo/SubCatPhoto/" + dr["SubCatPhoto"].ToString() + ".jpg";
                        lbluid.Text = dr["SubCatPhoto"].ToString();
                    }

                }

                con.Close();
                BtnSave.Visible = false;
                BtnDelete.Visible = true;
                BtnUpdate.Visible = true;

            }
            else
            {
                BtnSave.Visible = true;
                BtnDelete.Visible = false;
                BtnUpdate.Visible = false;
            }
        }
    }
    protected void Btnsave_click(object sender, EventArgs e)
    {
        Guid uid = Guid.NewGuid();

        if (FileUploadPhoto.HasFile)
        {
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/SubCatPhoto/" + uid + ".jpg").ToString());

        }
        subCat.Insert(Convert.ToDecimal(DropDownListcat.SelectedValue),TxtSubCat.Text, uid, TxtShortdesc.Text, TxtDesc.Text, DropDownListStatus.SelectedValue, Txtremark.Text);
        Response.Write("save Successfully");
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        Guid uid = new Guid(lbluid.Text);
    

        if (FileUploadPhoto.HasFile)
        {
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/SubCatPhoto/" + uid + ".jpg").ToString());
        
        }
        subCat.Update(Convert.ToDecimal(DropDownListcat.SelectedValue), TxtSubCat.Text, uid, TxtShortdesc.Text, TxtDesc.Text, DropDownListStatus.SelectedValue, Txtremark.Text, Convert.ToDecimal(lblSubCategoryId.Text));
        Response.Write("Update Sucessfully..");
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        subCat.Delete(Convert.ToDecimal(lblSubCategoryId.Text));
        Response.Write("Delete Sucessfully..");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT [CategoryId], [SubCategoryId], [SubCategoryName], [SubCatPhoto], [ShortDescription], [Description], [Status], [Remark] FROM [TblSubCategory] where SubCategoryName like '%" + TextSearch.Text + "%'  or SubCategoryId='"+ TextSearch1.Text+"'";
    }
    }