<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProductDetail.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div>
            <h1>
                Product Details..</h1>
        </div>
        <table>
            <tr>
                <td>
                    Search By Title
                </td>
                <td>
                    <asp:TextBox ID="TextSearch" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextSearch1" runat="server">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId"
            DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." Width="914px">
            <Columns>

             <asp:TemplateField>
                    <ItemTemplate>
                        <a href="AddNewProduct.aspx?cid=<%#Eval("productId") %>">Edit</a>
                    </ItemTemplate>
                     </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                <asp:BoundField DataField="SubCategoryId" HeaderText="SubCategoryId" SortExpression="SubCategoryId" />
                <asp:BoundField DataField="ProductPhoto" HeaderText="ProductPhoto" SortExpression="ProductPhoto" />
                <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" SortExpression="ShortDescription" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                <asp:BoundField DataField="ActualPrice" HeaderText="ActualPrice" SortExpression="ActualPrice" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
            DeleteCommand="DELETE FROM [Tblproduct] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Tblproduct] ([Title], [SubCategoryId], [ProductPhoto], [ShortDescription], [Description], [Price], [Discount], [ActualPrice], [Status], [Remark]) VALUES (@Title, @SubCategoryId, @ProductPhoto, @ShortDescription, @Description, @Price, @Discount, @ActualPrice, @Status, @Remark)"
            ProviderName="<%$ ConnectionStrings:db_EcomConnectionString.ProviderName %>"
            SelectCommand="SELECT [Title], [ProductId], [SubCategoryId], [ProductPhoto], [ShortDescription], [Description], [Price], [Discount], [ActualPrice], [Status], [Remark] FROM [Tblproduct]"
            UpdateCommand="UPDATE [Tblproduct] SET [Title] = @Title, [SubCategoryId] = @SubCategoryId, [ProductPhoto] = @ProductPhoto, [ShortDescription] = @ShortDescription, [Description] = @Description, [Price] = @Price, [Discount] = @Discount, [ActualPrice] = @ActualPrice, [Status] = @Status, [Remark] = @Remark WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="SubCategoryId" Type="Decimal" />
                <asp:Parameter Name="ProductPhoto" Type="Object" />
                <asp:Parameter Name="ShortDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Discount" Type="String" />
                <asp:Parameter Name="ActualPrice" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="SubCategoryId" Type="Decimal" />
                <asp:Parameter Name="ProductPhoto" Type="Object" />
                <asp:Parameter Name="ShortDescription" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Discount" Type="String" />
                <asp:Parameter Name="ActualPrice" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
                <asp:Parameter Name="ProductId" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
