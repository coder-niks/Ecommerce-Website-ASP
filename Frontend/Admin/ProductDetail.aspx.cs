using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT [ProductId], [SubCategoryId], [Title], [ProductPhoto], [ShortDescription], [Description], [Price], [Discount], [ActualPrice], [Status], [Remark] FROM [TblProduct]  Where Title like '%" + TextSearch.Text + "%'  or ProductId='"+ TextSearch1.Text+"'";
    }
    }