<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="AddNewProduct.aspx.cs" Inherits="Admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Add New Product from here..</h1>
    <table>
        <tr>
            <td>
                Sub Category Name
            </td>
            <td>
                <asp:DropDownList ID="DropDownListsubcat" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="SubCategoryName" DataValueField="SubCategoryId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
                    SelectCommand="SELECT [SubCategoryId], [SubCategoryName] FROM [TblSubCategory]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Title
            </td>
            <td>
                <asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Photo
            </td>
            <td>
                <asp:FileUpload ID="FileUploadPhoto" runat="server" />
            </td>
            <td>
                <asp:Image ID="ImageProduct" runat="server" Width="180px" Height="179px" />
            </td>
            <td>
                <asp:Label ID="lblimg" runat="server" Visible="false" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Short Description
            </td>
            <td>
                <asp:TextBox ID="TxtShortdesc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Desc
            </td>
            <td>
                <asp:TextBox ID="txtdes" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Price
            </td>
            <td>
                <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Discount
            </td>
            <td>
                <asp:TextBox ID="TxtDiscount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Actual Price
            </td>
            <td>
                <asp:TextBox ID="txtActualPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                status
            </td>
            <td>
                <asp:DropDownList ID="DropDownListStatus" runat="server">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Deactive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                remark
            </td>
            <td>
                <asp:TextBox ID="txtremark" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblProductId" runat="server" Visible="false" Text=""></asp:Label>
                <asp:Label ID="lbluid" runat="server" Visible="false" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="BtnSave" runat="server" Text="Save" ForeColor="White" BackColor="black"
                    OnClick="Btnsave_click" />
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click"
                    Width="62px" Style="height: 26px" />
                <asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click"
                    Width="61px" />
            </td>
        </tr>
    </table>
</asp:Content>
