<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="AddNewCategory.aspx.cs" Inherits="Admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Add New Category from here..</h1>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    Enter Category Name
                </td>
                <td>
                    <asp:TextBox ID="txtcategory" runat="server" Width="154px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Short Description
                </td>
                <td>
                    <asp:TextBox ID="txtshortdesc" runat="server" Height="19px" Width="155px"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td>
                     Description
                </td>
                <td>
                    <asp:TextBox ID="TxtCatDesc" runat="server" Height="19px" Width="155px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Photo
                </td>
                <td>
                    <asp:FileUpload ID="FileUploadPhoto" runat="server" />
                </td>
                  <td>
                <asp:Image ID="Imagecat" runat="server" Width="180px" Height="179px" />
            </td>
            <td>
                <asp:Label ID="lblimg" runat="server" Visible="false" Text=""></asp:Label>
            </td>
            </tr>
            <tr>
                <td>
                    Status
                </td>
                <td>
                    <asp:DropDownList ID="DropDownCat" runat="server" Height="23px" Width="103px">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Deactive</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCategoryId" runat="server" Visible="false" Text=""></asp:Label>
                    <asp:Label ID="lbluid" runat="server" Visible="false" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Button ID="BtnSave" runat="server" Text="Save" ForeColor="White" BackColor="black"
                        OnClick="Btnsave_click" Height="29px" Width="63px" />
                    <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click"
                        Width="62px" Style="height: 26px" />
                    <asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click"
                        Width="61px" />
                </td>
            </tr>
        </table>
        <br />
        <h2>
            Category Details..</h2>
        <br />
        <table>
            <tr>
                <td>
                    Search by Name & Category
                </td> <td></td>
                <td>
                    <asp:TextBox ID="TextSearch" runat="server"></asp:TextBox> 
                    <asp:TextBox ID="TextSearch1" runat="server">
                    </asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" 
                        OnClick="btnSearch_Click" Height="40px" Width="72px" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="AddNewCategory.aspx?cid=<%#Eval("CategoryId") %>">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" ReadOnly="True" SortExpression="CategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
                <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" SortExpression="ShortDescription" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
            DeleteCommand="DELETE FROM [TblCategory] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [TblCategory] ([CategoryId], [Name], [Photo], [ShortDescription], [Description], [Status], [Remark]) VALUES (@CategoryId, @Name, @Photo, @ShortDescription, @Description, @Status, @Remark)"
            ProviderName="<%$ ConnectionStrings:db_EcomConnectionString.ProviderName %>"
            SelectCommand="SELECT [CategoryId], [Name], [Photo], [ShortDescription], [Description], [Status], [Remark] FROM [TblCategory]"
            UpdateCommand="UPDATE [TblCategory] SET [Name] = @Name, [Photo] = @Photo, [ShortDescription] = @ShortDescription, [Description] = @Description, [Status] = @Status, [Remark] = @Remark WHERE [CategoryId] = @CategoryId">
            <DeleteParameters>
                <asp:Parameter Name="CategoryId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="ShortDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="ShortDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
                <asp:Parameter Name="CategoryId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
