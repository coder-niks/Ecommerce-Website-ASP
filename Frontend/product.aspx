<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="row">
		<div class="col-md-3 left-menu">
				<div class="">
				<h3>Products</h3>
					<ul>
                        <asp:ListView ID="ListView3" runat="server"  DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                         <li><a href="SubCategory.aspx?id=<%#Eval("CategoryId") %>"><%#Eval("SubCategoryName")%></a> </li>
                        </ItemTemplate>
                        </asp:ListView>

                       
				    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>" 
                        SelectCommand="SELECT [CategoryId], [SubCategoryId], [SubCategoryName],[SubCatPhoto],[ShortDescription], [Description], [Status], [Remark] FROM [TblSubCategory]">
                    </asp:SqlDataSource>
					</ul>
				</div>
			</div>
        <div class="col-md-9">
		
		<div class="row">
        
		    
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                     <div class="col-md-4">
			    <div class="product">
                     <a href="productdetail.aspx?pid=<%#Eval("ProductId")%>"><img alt="" src="photo/Product/<%#Eval("ProductPhoto") %>.jpg"></a>
                   <p>
                   
                    <%#Eval("ShortDescription")%><br />
                     <b>Rs.&nbsp;<%#Eval("Price")%></b><br /></p>
                    </div>
                    </div>
                    </ItemTemplate>
                    </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>" 
                        
                SelectCommand="SELECT [Title], [ProductId], [SubCategoryId], [ProductPhoto], [ShortDescription], [Description], [Price], [Discount], [ActualPrice], [Status], [Remark] FROM [Tblproduct]">
                    </asp:SqlDataSource>	    
                    
		    </div>
            </div>
		</div>
			
</asp:Content>

