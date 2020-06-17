<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12 slideshow">
            <div id="slideshow0">
                <div style="display: block;" class="camera_wrap camera_emboss camera_white_skin">
                    <div class="camera_fakehover">
                        <div class="camera_src camerastarted">
                            <img src="image/sub.jpg" alt="Banner 1">
                            <div data-thumb="image/sub.jpg" data-src="image/sub.jpg" data-link="product.html">
                            </div>
                            <div data-thumb="image/sub1.jpg" data-src="image/sub1.jpg">
                            </div>
                            <div data-thumb="image/sub2.jpg" data-src="image/sub2.jpg">
                            </div>
                        </div>
                        <div class="camera_target">
                            <div class="cameraCont">
                                <div style="visibility: visible; display: none; z-index: 1; margin-left: 0px; margin-top: 0px;"
                                    class="cameraSlide cameraSlide_0">
                                    <img data-portrait="" data-alignment="" style="visibility: visible; height: 367px;
                                        margin-left: 0px; margin-right: 0px; margin-top: 0px; position: absolute; width: 940px;"
                                        class="imgLoaded" src="image/sub.jpg?1435382544749" height="367" width="940">
                                    <div style="width: 940px; height: 367px;" class="camerarelative">
                                    </div>
                                </div>
                                <div style="display: none; z-index: 1; margin-left: 0px; margin-top: 0px;" class="cameraSlide cameraSlide_1">
                                    <img data-portrait="" data-alignment="" style="visibility: visible; height: 367px;
                                        margin-left: 0px; margin-right: 0px; margin-top: 0px; position: absolute; width: 940px;"
                                        class="imgLoaded" src="image/sub.jpg?1435382554653" height="367" width="940">
                                    <div style="width: 940px; height: 367px;" class="camerarelative">
                                    </div>
                                </div>
                                <div style="display: block; z-index: 999; margin-left: 0px; margin-top: 0px;" class="cameraSlide cameraSlide_2 cameracurrent">
                                    <img data-portrait="" data-alignment="" style="visibility: visible; height: 367.188px;
                                        margin-left: 0px; margin-right: 0px; margin-top: -0.09375px; position: absolute;
                                        width: 940px;" class="imgLoaded" src="image/sub2.jpg?1435382613966" height="750"
                                        width="1920">
                                    <div style="width: 940px; height: 367px;" class="camerarelative">
                                    </div>
                                </div>
                                <div style="z-index: 1; display: none;" class="cameraSlide cameraSlide_3 cameranext">
                                    <div style="width: 940px; height: 367px;" class="camerarelative">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="camera_overlayer">
                        </div>
                        <div class="camera_target_content">
                            <div class="cameraContents">
                                <div style="display: none;" class="cameraContent">
                                    <a class="camera_link" href="product.html" target=""></a>
                                </div>
                                <div style="display: none;" class="cameraContent">
                                </div>
                                <div style="display: block;" class="cameraContent cameracurrent">
                                </div>
                            </div>
                        </div>
                        <div class="camera_pie">
                            <canvas style="position: absolute; z-index: 1002; right: 0px; top: 0px; opacity: 0.3;
                                display: block;" height="38" width="38" id="pie_0"></canvas>
                        </div>
                        <div style="opacity: 0;" class="camera_commands">
                            <div style="display: none;" class="camera_play">
                            </div>
                            <div style="display: block;" class="camera_stop">
                            </div>
                        </div>
                        <div style="opacity: 0;" class="camera_prev">
                            <span></span>
                        </div>
                        <div style="opacity: 0;" class="camera_next">
                            <span></span>
                        </div>
                    </div>
                    <div class="camera_pag">
                        <ul class="camera_pag_ul">
                            <li class="pag_nav_0" style="position: relative; z-index: 1002"><span><span>0</span></span></li><li
                                class="pag_nav_1" style="position: relative; z-index: 1002"><span><span>1</span></span></li><li
                                    class="pag_nav_2 cameracurrent" style="position: relative; z-index: 1002"><span><span>
                                        2</span></span></li></ul>
                    </div>
                    <div style="display: none; visibility: visible;" class="camera_loader">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 left-menu" style="background: #fff; border-right: 1px solid #dfdfdf;">
            <h3>
                Category</h3>
            <ul>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <li><a href="subcategory.aspx?id=<%#Eval("CategoryId") %>">
                            <%#Eval("Name")%></a> </li>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
                    SelectCommand="SELECT [CategoryId], [Name] FROM [TblCategory]"></asp:SqlDataSource>
            </ul>
            <h3>
                Sub Category</h3>
            <ul>
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <li><a href="product.aspx?id=<%#Eval("SubCategoryId") %>">
                            <%#Eval("SubCategoryName")%></a> </li>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
                    SelectCommand="SELECT [SubCategoryId], [SubCategoryName] FROM [TblSubCategory]">
                </asp:SqlDataSource>
            </ul>
            <h3>
                Products</h3>
            <ul>
                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <li><a href="productdetail.aspx?pid=<%#Eval("ProductId")%>">
                            <%#Eval("Title")%></a> </li>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
                    SelectCommand="SELECT [Title], [SubCategoryId], [ProductId], [ProductPhoto], [ShortDescription], [Price], [Description], [Discount], [ActualPrice], [Status], [Remark] FROM [Tblproduct]">
                </asp:SqlDataSource>
            </ul>
        </div>
        <div class="col-md-9 left-menu">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="col-md-4" style="display: inline-block;">
                            <div class="product">
                                <a href="productdetail.aspx?pid=<%#Eval("ProductId")%>">
                                    <img alt="" height="133px" width="200px" src="photo/Product/<%#Eval("ProductPhoto") %>.jpg"></a>
                                <a href="productdetail.aspx?pid=<%#Eval("ProductId")%>"><b>
                                    <%#Eval("Title") %></b></a>
                                <%#Eval("ShortDescription")%><br />
                                <b>Rs.<%#Eval("Price")%></b><br />
                                <div class="name">
                                    <a href=""></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_EcomConnectionString %>"
                    SelectCommand="SELECT top(18) [Title], [SubCategoryId], [ProductId], [ProductPhoto], [ShortDescription], [Price], [Description], [Discount], [ActualPrice], [Status], [Remark] FROM [Tblproduct] order by ProductId desc">
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
