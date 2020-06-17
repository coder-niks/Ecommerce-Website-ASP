using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default3 : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db_EcomConnectionString"].ToString());
    DataSet1TableAdapters.TblproductTableAdapter Product = new DataSet1TableAdapters.TblproductTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblproductId.Visible = false;
        if (!IsPostBack)
        {
            if (Request.Url.Query.Contains("pid"))
            {
                SqlCommand cmd = new SqlCommand("Select * from ViewProduct where ProductId='" + Request.QueryString["pid"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblActualPrice.Text = dr["ActualPrice"].ToString();
                       
                        lblPrice.Text = dr["Price"].ToString();
                        lblCategory.Text = dr["Name"].ToString() + " >> " + dr["SubCategoryName"].ToString();
                        lblshortDesc.Text = dr["ShortDescription"].ToString();
                        image.Src = "photo/Product/" + dr["ProductPhoto"].ToString() + ".jpg";
                       lblDesc.Text=dr["Description"].ToString();
                        lblTitle.Text = dr["Title"].ToString();

                        SqlDataSource2.SelectCommand = "SELECT top(4) * from [ViewProduct] where Name='" + dr["Name"].ToString() + "' and SubCategoryName='" + dr["SubCategoryName"].ToString() + "' and ProductId not in('" + Request.QueryString["pid"] + "') ";




                    }

                }
            }

        }
    }
}