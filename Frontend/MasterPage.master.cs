using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["db_EcomConnectionString"].ToString());
       if(!IsPostBack)
       {
            if (Request.Url.Query.Contains("id"))
            {
                SqlCommand cmd = new SqlCommand("Select * from TblSubCategory where SubCategoryId='" + Request.QueryString["id"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                  

                       
                    }

                }

        }

    }
}
}