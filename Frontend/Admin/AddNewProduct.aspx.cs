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
    DataSet1TableAdapters.TblproductTableAdapter Product = new DataSet1TableAdapters.TblproductTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblProductId.Visible = false;
        if (!IsPostBack)
        {
            if (Request.Url.Query.Contains("cid"))
            {
                SqlCommand cmd = new SqlCommand("Select * from TblProduct where ProductId='" + Request.QueryString["cid"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        DropDownListsubcat.SelectedValue = dr["SubCategoryId"].ToString();
                        lblProductId.Text = Request.QueryString["cid"];
                        TxtTitle.Text = dr["Title"].ToString();
                        TxtShortdesc.Text = dr["ShortDescription"].ToString();
                        ImageProduct.ImageUrl = "../photo/Product/" + dr["ProductPhoto"].ToString() + ".jpg";
                        txtdes.Text = dr["Description"].ToString();
                        txtremark.Text = dr["Remark"].ToString();
                        TxtPrice.Text = dr["Price"].ToString();
                        TxtDiscount.Text = dr["Discount"].ToString();
                        txtActualPrice.Text = dr["ActualPrice"].ToString();
                        DropDownListStatus.SelectedValue = dr["Status"].ToString();
                        lbluid.Text = dr["ProductPhoto"].ToString();
                        

                       
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
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/Product/" + uid + ".jpg").ToString());

        }

        Product.Insert(TxtTitle.Text, Convert.ToDecimal(DropDownListsubcat.SelectedValue), uid, TxtShortdesc.Text, txtdes.Text, TxtPrice.Text, TxtDiscount.Text, txtActualPrice.Text, DropDownListStatus.SelectedValue, txtremark.Text);
        Response.Write("Save Sucessfully..");
    }
    
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
            
        Guid uid = new Guid(lbluid.Text);

        if (FileUploadPhoto.HasFile)
        {
            FileUploadPhoto.SaveAs(Server.MapPath("~/photo/Product/" + uid + ".jpg").ToString());
        }

        Product.Update(TxtTitle.Text, Convert.ToDecimal(DropDownListsubcat.SelectedValue), uid, TxtShortdesc.Text, txtdes.Text, TxtPrice.Text, TxtDiscount.Text, txtActualPrice.Text, DropDownListStatus.SelectedValue, txtremark.Text, Convert.ToDecimal(lblProductId.Text));
        Response.Write("Update Sucessfully..");
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        Product.Delete(Convert.ToDecimal(lblProductId.Text));
        Response.Write("Delete Sucessfully..");
    }
  

}