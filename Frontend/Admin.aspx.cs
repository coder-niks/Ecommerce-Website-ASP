using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Net;
using System.Data.SqlClient;

using System.Net.Mail;


public partial class Admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db_EcomConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT UserName, Password, Status, Remark FROM TblAdmin where UserName=@id", con);
        cmd.Parameters.AddWithValue("@id", TxtUserName.Text);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                if (TxtPassword.Text == rdr["Password"].ToString())
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, TxtUserName.Text, System.DateTime.Now, System.DateTime.Now.AddMinutes(60), true, "Admin");
                    string hashcookies = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashcookies);
                    Response.Cookies.Add(cookie);


                    Response.Redirect("~/Admin/index.aspx");
                }

                else
                {
                    Response.Write(@"<script> alert(""Password Not Match !"");</script>");
                }
            }
            con.Close();
        }
        else
        {
            Response.Write(@"<script> alert(""Your Account is Not Found !"");</script>");
            con.Close();
        }
    }

}