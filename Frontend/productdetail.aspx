<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="productdetail.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb prod">
        <li><a href="index.aspx">Home</a> <span class="divider"></span></li>
        <li class="active">Product</li>
         <asp:Label ID="lblproductId" runat="server" Text="Label"></asp:Label><br />
    </ul>
    <div class="row product-info">
        <div class="col-md-6">
            <div class="image">
                <a class="cloud-zoom" rel="adjustX: 0, adjustY:0" id='zoom1' href="index.aspx"
                    title="Nano">

                    <img runat="server" src="" title="Shoppingkart.com" alt="Nano" id="image" /></a></div>
           
        </div>
        <div class="col-md-6">
            <h1>
                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h1>
            <div class="line">
            </div>
            <ul>
                <li><span>Category:</span> <a href="#">
                    <asp:Label ID="lblCategory" runat="server" Text=""></asp:Label></a></li>
            
                <li><span>Availability: </span>In Stock</li>
            </ul>
            <div class="price">
                Price <span class="strike"> <asp:Label ID="lblActualPrice" runat="server" Text="Label"></asp:Label> <br /></span> <strong>  <b>Rs.</b>&nbsp;<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label><br /></strong>
            </div>
          
                <div class="line">
            </div>
            <div class="form-inline">
            <button class="btn btn-primary" type="button">
                Buy</button>
            <label>
                Qty:</label>
            <input type="text" placeholder="1" class="col-md-1">
            <div><br /> <h2>Cash On Delivery</h2> <br /> </div>
            </div>
            <div class="tabs">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#home">Product Details</a></li>
                  
                   
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="home">

                        <asp:Label ID="lblshortDesc" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                    </div>
                   
                    
                </div>
            </div>
        </div>
    </div>
    <h3 class="related">
        Related products</h3>
    <div class="row">
        <div class="col-md-12">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
            <div class="col-md-3">
                <div class="product">
                    <div class="product_sale">
                        Sale</div>
                    <a href="productdetail.aspx?pid=<%#Eval("ProductId")%>">
                        <img alt="dress1home" src="photo/Product/<%#Eval("ProductPhoto") %>.jpg"></a>
                    <div class="name">
                        <a href="productdetail.aspx?pid=<%#Eval("ProductId")%>"><%#Eval("Title") %></a>
                    </div>
                    <div class="price">
                        <p>
                            <%#Eval("Price")%></p>
                    </div>
                </div>
            </div>
           </ItemTemplate>
                    </asp:Repeater>
	     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>" 
                        SelectCommand="">
                    </asp:SqlDataSource>
		    			
		    		
        </div>
    </div>
    
</asp:Content>
