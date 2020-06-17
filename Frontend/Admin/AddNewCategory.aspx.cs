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
    DataSet1TableAdapters.TblCategoryTableAdapter cat = new DataSet1TableAdapters.TblCategoryTableAdapter();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCategoryId.Visible = false;
        if (!IsPostBack)
        {
            if (Request.Url.Query.Contains("cid"))
            {
                SqlCommand cmd = new SqlCommand("Select * from TblCategory where CategoryId='" + Request.QueryString["cid"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        txtcategory.Text = dr["Name"].ToString();
                        lblCategoryId.Text = Request.QueryString["cid"];
                        Imagecat.ImageUrl="../photo/category/"+dr["Photo"].ToString()+".jpg";
                        lbluid.Text = dr["Photo"].ToString();
                        txtshortdesc.Text = dr["ShortDescription"].ToString();
                        TxtCatDesc.Text = dr["Description"].ToString();
                        DropDownCat.SelectedValue = dr["Status"].ToString();
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
        Guid gd = Guid.NewGuid();

        if (FileUploadPhoto.HasFile)
        {
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/category/" + gd + ".jpg").ToString());
        }
        cat.Insert(txtcategory.Text, gd, txtshortdesc.Text, txtshortdesc.Text, DropDownCat.SelectedValue, null);
        Response.Write("<Script>alert('Save...')</Script>");
        
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        Guid uid = new Guid(lbluid.Text);
        if (FileUploadPhoto.HasFile)
        {
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/category/" + uid + ".jpg").ToString());
        }
        cat.Update(txtcategory.Text, uid, txtshortdesc.Text,txtshortdesc.Text, DropDownCat.SelectedValue, null,Convert.ToDecimal(lblCategoryId.Text));
        Response.Write("Update Sucessfully..");
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        cat.Delete(Convert.ToInt32(lblCategoryId.Text));
        Response.Write("Delete Sucessfully..");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT [CategoryId], [Name], [Photo], [ShortDescription], [Description], [Status], [Remark] FROM [TblCategory] Where (CategoryId='" + TextSearch1.Text + "') and( Name like '" + TextSearch.Text + "%') ";
    }
}

