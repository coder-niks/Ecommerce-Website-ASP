<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <a title="Home" href="Admin.aspx"></a>
        <div style="width: 400px; border: 1px solid #dfdfdf" id="log">
            <div style="height: 40px; line-height: 40px; width: 400px; margin-bottom: 20px; margin-top: 20px;
                background-color: #fff; font-family: Arial; font-weight: bold; border-bottom: 2px solid #8E4206">
                <p style="margin-left: 10px; font-size: 18px; color: #8E4206;">
                    Admin Login Form</p>
            </div>
            <div>
                <table align="center" width="300px" style="margin: 0px auto; color: #181818;">
                    <tr>
                        <td>
                            <p style="color: #181818;">
                                UserName</p>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtUserName" runat="server" CssClass="logtxtbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p style="color: #181818;">
                                Password</p>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtPassword" runat="server" CssClass="logtxtbox" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="275" align="left" style="margin-bottom: 10px">
                    <tr>
                        <td align="right">
                            <asp:Button ID="BtnLogin" runat="server" Text="Login" Height="26px" 
                    Width="108px" onclick="BtnLogin_Click" /></td>   
                    </tr>
                    <%--   <tr>
                        
                            <td><p align="right" style="height:20px;width:300px;margin:10px auto;font-family:Arial; font-size:small"><a  style="color:black" href="Registration.aspx">New User?</a>
              <a style="color:black;margin-left:10px" href="Forgot Password.aspx">Forget Password?</a>
            </p></td>

                    </tr>--%>
                </table>
            </div>
            <div style="width: 400px; height: 30px; line-height: 30px; margin-top: 10px; color: #8E4206;
                font-family: Arial; font-size: 14px;">
                www.Shoppingkart.Com</div>
        </div>
    </center>
    </form>
</body>
</html>
