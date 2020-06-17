<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="AddNewSubCategory.aspx.cs" Inherits="Admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Add New Sub category Category from here..</h1>
    <div>
        <table>
            
        <tr>
        <td>
        Category Name
        
        </td>
        <td>
           <asp:DropDownList ID="DropDownListcat" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>" 
                SelectCommand="SELECT [CategoryId], [Name] FROM [TblCategory]">
            </asp:SqlDataSource>
        </td>
        </tr>
            <tr>
                <td>
                    Enter Sub Category Name
                </td>
                <td>
                    <asp:TextBox ID="TxtSubCat" runat="server" Width="154px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Sub Category Photo
                </td>
                <td>
                    <asp:FileUpload ID="FileUploadPhoto" runat="server" />
                </td>
                <td>
                    <asp:Image ID="ImageSubCat" runat="server" Width="200px" Height="200px" />
                </td>
                <td>
                    <asp:Label ID="lblimgid" runat="server" Visible="false" Text=""></asp:Label>
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
                    Description
                </td>
                <td>
                    <asp:TextBox ID="TxtDesc" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Status
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
                    Remark
                </td>
                <td>
                    <asp:TextBox ID="Txtremark" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSubCategoryId" runat="server" Visible="false" Text="Label"></asp:Label>
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
        <br />
        <h2>
            Sub Category Details..</h2>
        <table>
            <tr>
                <td>
                    Search by Sub Category Name & Id
                </td>
                <td>
                    
                   
                    <asp:TextBox ID="TextSearch" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextSearch1" runat="server">
                    </asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        
         
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="SubCategoryId" 
                        DataSourceID="SqlDataSource2" 
                        EmptyDataText="There are no data records to display.">
                        <Columns>
                        <asp:TemplateField>
                        <ItemTemplate>
                         <a href="AddNewSubCategory.aspx?cid=<%#Eval("SubCategoryId") %>">Edit</a>
                        </ItemTemplate>
                        </asp:TemplateField>
                            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
                                SortExpression="CategoryId" />
                            <asp:BoundField DataField="SubCategoryId" HeaderText="SubCategoryId" 
                                ReadOnly="True" SortExpression="SubCategoryId" />
                            <asp:BoundField DataField="SubCategoryName" HeaderText="SubCategoryName" 
                                SortExpression="SubCategoryName" />
                            <asp:BoundField DataField="SubCatPhoto" HeaderText="SubCatPhoto" 
                                SortExpression="SubCatPhoto" />
                            <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" 
                                SortExpression="ShortDescription" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:BoundField DataField="Status" HeaderText="Status" 
                                SortExpression="Status" />
                            <asp:BoundField DataField="Remark" HeaderText="Remark" 
                                SortExpression="Remark" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>" 
                        DeleteCommand="DELETE FROM [TblSubCategory] WHERE [SubCategoryId] = @SubCategoryId" 
                        InsertCommand="INSERT INTO [TblSubCategory] ([CategoryId], [SubCategoryName], [SubCatPhoto], [ShortDescription], [Description], [Status], [Remark]) VALUES (@CategoryId, @SubCategoryName, @SubCatPhoto, @ShortDescription, @Description, @Status, @Remark)" 
                        ProviderName="<%$ ConnectionStrings:db_EcomConnectionString.ProviderName %>" 
                        SelectCommand="SELECT [CategoryId], [SubCategoryId], [SubCategoryName], [SubCatPhoto], [ShortDescription], [Description], [Status], [Remark] FROM [TblSubCategory]" 
                        UpdateCommand="UPDATE [TblSubCategory] SET [CategoryId] = @CategoryId, [SubCategoryName] = @SubCategoryName, [SubCatPhoto] = @SubCatPhoto, [ShortDescription] = @ShortDescription, [Description] = @Description, [Status] = @Status, [Remark] = @Remark WHERE [SubCategoryId] = @SubCategoryId">
                        <DeleteParameters>
                            <asp:Parameter Name="SubCategoryId" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CategoryId" Type="Decimal" />
                            <asp:Parameter Name="SubCategoryName" Type="String" />
                            <asp:Parameter Name="SubCatPhoto" Type="Object" />
                            <asp:Parameter Name="ShortDescription" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CategoryId" Type="Decimal" />
                            <asp:Parameter Name="SubCategoryName" Type="String" />
                            <asp:Parameter Name="SubCatPhoto" Type="Object" />
                            <asp:Parameter Name="ShortDescription" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="SubCategoryId" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                    
    </div>
</asp:Content>
