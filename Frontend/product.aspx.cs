using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Url.Query.Contains("id"))
            {
                SqlDataSource1.SelectCommand = "SELECT [ProductId], [SubCategoryId], [ProductPhoto], [ShortDescription], [Description], [Price], [Discount], [ActualPrice], [Status], [Remark] FROM [Tblproduct] where SubCategoryId='" + Request.QueryString["id"] + "'";
            }

        }
    }
}