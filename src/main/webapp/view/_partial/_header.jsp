<%-- 
    Document   : _header.jsp
    Created on : Sep 17, 2016, 4:21:10 PM
    Author     : daudau
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--setup scope session-->
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/select2/css/select2.min.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/jquery.bxslider/jquery.bxslider.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/owl.carousel/owl.carousel.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/lib/jquery-ui/jquery-ui.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/css/animate.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${root}/assets/css/responsive.css" />

        <link rel="stylesheet" href="${root}/assets/js/jqwidgets/styles/jqx.base.css" type="text/css" />
        <link rel="stylesheet" href="${root}/assets/js/jqwidgets/styles/jqx.bootstrap.css" type="text/css" />
        <title>${title} - hnashop</title>
    </head>

    <body class="<% if (request.getServletPath().equals("/view/home.jsp")) {
            out.print("home");
        } else {
            out.print("category-page");
        } %>">
        <!-- HEADER -->
        <div id="header" class="header">
            <div class="top-header">
                <div class="container">
                    <div class="nav-top-links">
                        <a class="first-item" href="#"><img alt="phone" src="${root}/assets/images/phone.png" />088-888-888-888</a>
                        <a href="#"><img alt="email" src="${root}/assets/images/email.png" />Contact us today!</a>
                    </div>
                    <!--                    <div class="currency ">
                                            <div class="dropdown">
                                                <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">USD</a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Dollar</a></li>
                                                    <li><a href="#">Euro</a></li>
                                                </ul>
                                            </div>
                                        </div>-->
                    <!--                    <div class="language ">
                                            <div class="dropdown">
                                                <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                                                    <img alt="email" src="${root}/assets/images/fr.jpg" />French
                                                </a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#"><img alt="email" src="${root}/assets/images/en.jpg" />English</a></li>
                                                    <li><a href="#"><img alt="email" src="${root}/assets/images/vn.jpg" />VietNamese</a></li>
                                                </ul>
                                            </div>
                                        </div>-->
                    <div class="support-link">
                        <a href="#">Services</a>
                        <a href="#">Support</a>                                        
                    </div>
                    <div id="user-info-top" class="user-info pull-right">
                        <div class="dropdown">
                            <%
                                User currentUser = (User) session.getAttribute("user");
                                if (currentUser != null) {%>                                
                            <c:set var="currentUser" value="${currentUser}" scope="session" />
                            <input type="hidden" id="dsaccsacsagsagsdwefe" value="<%=currentUser.getId()%>">
                            <input type="hidden" id="bgfsbafdsafdsafd" value="<%=currentUser.getUsername()%>">
                            <input type="hidden" id="cdavassacsc" value="<%=currentUser.getAddress()%>">
                            <input type="hidden" id="vsavsadadeadsa" value="<%=currentUser.getEmail()%>">
                            <input type="hidden" id="vsavscssaadadeadsa" value="<%=currentUser.getName()%>">
                            <input type="hidden" id="cscacsasadsad" value="<%=currentUser.getPhone()%>">
                            <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                                <span><%=currentUser.getName()%></span>
                            </a>
                            <ul class="dropdown-menu mega_dropdown" role="menu">
                                <li><a href="${root}/setting/profile">Profile Setting</a></li>
                                <li>
                                    <form action="${root}/product/shop" method="post" style="margin-left: 10px;">
                                        <button type="submit" id="" name="abbbbb" value="<%=currentUser.getId()%>">Shop manager</button>
                                    </form>
                                </li>
                                <li class="btnShopOrder"><a href="${root}/shoporder">Shop Order</a></li>
                                <li class="btnManageProduct"><a href="${root}/product/create">Manage Product</a></li>
                                <li><a href="${root}/myorder">My Order</a></li>
                                <li><a href="${root}/auth/logout">Logout</a></li>
                            </ul>

                            <% } else { %>
                            <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><span>My Account</span></a>
                            <ul class="dropdown-menu mega_dropdown" role="menu">
                                <li><a href="${root}/auth/login?backurl=">Login/Register</a></li>
                            </ul>
                            <% }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.top-header -->
            <!-- MAIN HEADER -->
            <div class="container main-header">
                <div class="row">
                    <div class="col-xs-12 col-sm-3 logo">
                        <a href="${root}"><img alt="Home page" src="${root}/assets/images/logo.png" /></a>
                    </div>
                    <div class="col-xs-7 col-sm-7 header-search-box">
                        <form class="form-inline">
                            <div class="form-group form-category">
                                <select id="categorySearch" class="select-category">
                                </select>
                            </div>
                            <div class="form-group input-serach">
                                <input id="keywordSearch" type="text"  placeholder="Keyword here...">
                            </div>
                            <button type="button" id="SearchItem" class="pull-right btn-search"></button>
                        </form>
                    </div>
                    <div id="cart-block" class="col-xs-5 col-sm-2 shopping-cart-box" style="display: inherit">
                        <!--<a class="cart-link" href="order.html">
                            <span class="title">Shopping cart1  </span>
                            <span class="total">1 items - 0 VND</span>
                            <span class="notify notify-left">1</span>
                        </a>
                        <div class="cart-block">
                            <div class="cart-block-content">
                                <h5 class="cart-title">0 Items in my cart</h5>
                                <div class="cart-block-list">
                                    <ul>
                                        <li class="product-info">
                                            <div class="p-left">
                                                <a href="#" class="remove_link"></a>
                                                <a href="#">
                                                    <img width="100" height="150" src="${root}/assets/data/product-100x122.jpg" alt="p10">
                                                </a>
                                            </div>
                                            <div class="p-right">
                                                <p class="p-name">Donec Ac Tempus</p>
                                                <p class="p-rice">0 VND</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="toal-cart">
                                    <span>Total</span>
                                    <span class="toal-price pull-right">0 VND</span>
                                </div>
                                <div class="cart-buttons">
                                    <a href="order.html" class="btn-check-out">Checkout</a>
                                </div>
                            </div>
                        </div>
                        -->
                    </div>                     
                </div>
            </div>

            <!-- END MANIN HEADER -->
            <div id="nav-top-menu" class="nav-top-menu">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3" id="box-vertical-megamenus">
                            <div class="box-vertical-megamenus">
                                <h4 class="title">      
                                    <span class="title-menu">Category</span>
                                    <span class="btn-open-mobile pull-right"><i class="fa fa-bars"></i></span>
                                </h4>
                                <div class="vertical-menu-content is-home">
                                    <ul class="vertical-menu-list">
                                        <%
                                            CategoryDAO categoryDAO = new CategoryDAO();
                                            List<Category> categoryList = categoryDAO.getListCatActive();
                                            for (Category parentNull : categoryList) {
                                                if (parentNull.getParentId() == 0) {%>
                                        <li>
                                            <a class="parent" href="${root}/category/<%=parentNull.getId()%>"><img class="icon-menu" alt="<%=parentNull.getName()%>" src="<%=parentNull.getIcon()%>"><%=parentNull.getName()%></a>
                                            <div class="vertical-dropdown-menu" style="width: 900px;">
                                                <div class="vertical-groups col-sm-12">
                                                    <%
                                                        for (Category catLv2 : categoryList) {
                                                            if (catLv2.getParentId() == parentNull.getId()) {%>
                                                    <div class="mega-group col-sm-4">
                                                        <h4 class="mega-group-header"><a href="${root}/category/<%=catLv2.getId()%>"><span><%=catLv2.getName()%></span></a></h4>
                                                        <ul class="group-link-default">
                                                            <%
                                                                for (Category catLv3 : categoryList) {
                                                                    if (catLv3.getParentId() == catLv2.getId()) {%>
                                                            <li><a href="${root}/category/<%=catLv3.getId()%>"><%=catLv3.getName()%></a></li>
                                                                <% }
                                                                    }
                                                                %>                                                                       
                                                        </ul>
                                                    </div>
                                                    <% }

                                                        } %>                                                                                                                                               
                                                </div>
                                            </div>
                                        </li>
                                        <% }
                                            }%>

                                    </ul>
                                    <div class="all-category"><span class="open-cate">All Categories</span></div>
                                </div>
                            </div>
                        </div>   
                        <div id="main-menu" class="col-sm-9 main-menu">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                            <i class="fa fa-bars"></i>
                                        </button>
                                        <a class="navbar-brand" href="#">MENU</a>
                                    </div>
                                    <div id="navbar" class="navbar-collapse collapse">
                                        <ul class="nav navbar-nav">
                                            <li class="active"><a href="#">Home</a></li>
                                            <!--
                                            <li class="dropdown">
                                                <a href="${root}/category" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                                                <ul class="dropdown-menu mega_dropdown" role="menu" style="width: 830px;">
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="img_container">
                                                                <a href="#">
                                                                    <img class="img-responsive" src="${root}/assets/data/men.png" alt="sport">
                                                                </a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">MEN'S</a>
                                                            </li>
                                                            <li class="link_container"><a href="#">Skirts</a></li>
                                                            <li class="link_container"><a href="#">Jackets</a></li>
                                                            <li class="link_container"><a href="#">Tops</a></li>
                                                            <li class="link_container"><a href="#">Scarves</a></li>
                                                            <li class="link_container"><a href="#">Pants</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="img_container">
                                                                <a href="#">
                                                                    <img class="img-responsive" src="${root}/assets/data/women.png" alt="sport">
                                                                </a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">WOMEN'S</a>
                                                            </li>
                                                            <li class="link_container"><a href="#">Skirts</a></li>
                                                            <li class="link_container"><a href="#">Jackets</a></li>
                                                            <li class="link_container"><a href="#">Tops</a></li>
                                                            <li class="link_container"><a href="#">Scarves</a></li>
                                                            <li class="link_container"><a href="#">Pants</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="img_container">
                                                                <a href="#">
                                                                    <img class="img-responsive" src="${root}/assets/data/kid.png" alt="sport">
                                                                </a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">Kids</a>
                                                            </li>
                                                            <li class="link_container"><a href="#">Shoes</a></li>
                                                            <li class="link_container"><a href="#">Clothing</a></li>
                                                            <li class="link_container"><a href="#">Tops</a></li>
                                                            <li class="link_container"><a href="#">Scarves</a></li>
                                                            <li class="link_container"><a href="#">Accessories</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="img_container">
                                                                <a href="#">
                                                                    <img class="img-responsive" src="${root}/assets/data/trending.png" alt="sport">
                                                                </a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">TRENDING</a>
                                                            </li>
                                                            <li class="link_container"><a href="#">Men's Clothing</a></li>
                                                            <li class="link_container"><a href="#">Kid's Clothing</a></li>
                                                            <li class="link_container"><a href="#">Women's Clothing</a></li>
                                                            <li class="link_container"><a href="#">Accessories</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Sports</a></li>
                                            <li class="dropdown">
                                                <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Foods</a>
                                                <ul class="mega_dropdown dropdown-menu" style="width: 830px;">
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="link_container group_header">
                                                                <a href="#">Asian</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Vietnamese Pho</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Noodles</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Seafood</a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">Sausages</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Meat Dishes</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Desserts</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="link_container group_header">
                                                                <a href="#">European</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Greek Potatoes</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Famous Spaghetti</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Famous Spaghetti</a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">Chicken</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Italian Pizza</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">French Cakes</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="link_container group_header">
                                                                <a href="#">FAST</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Hamberger</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Pizza</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Noodles</a>
                                                            </li>
                                                            <li class="link_container group_header">
                                                                <a href="#">Sandwich</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Salad</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Paste</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                            <li class="link_container">
                                                                <a href="#">Tops</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="block-container col-sm-3">
                                                        <ul class="block">
                                                            <li class="img_container">
                                                                <img src="${root}/assets/data/banner-topmenu.jpg" alt="Banner">
                                                            </li>
                                                        </ul>
                                                    </li>

                                                </ul>
                                            </li>
                                            <li class="dropdown">
                                                <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Digital</a>
                                                <ul class="dropdown-menu container-fluid">
                                                    <li class="block-container">
                                                        <ul class="block">
                                                            <li class="link_container"><a href="#">Mobile</a></li>
                                                            <li class="link_container"><a href="#">Tablets</a></li>
                                                            <li class="link_container"><a href="#">Laptop</a></li>
                                                            <li class="link_container"><a href="#">Memory Cards</a></li>
                                                            <li class="link_container"><a href="#">Accessories</a></li>
                                                        </ul>
                                                    </li>
                                                </ul> 
                                            </li>
                                            <li><a href="category.html">Furniture</a></li>
                                            <li><a href="category.html">Jewelry</a></li>
                                            <li><a href="category.html">Blog</a></li>
                                            -->
                                        </ul>
                                    </div><!--/.nav-collapse -->
                                </div>
                            </nav>
                        </div>
                    </div>
                    <!-- userinfo on top-->
                    <div id="form-search-opntop">
                    </div>
                    <!-- userinfo on top-->
                    <div id="user-info-opntop">
                    </div>
                    <!-- CART ICON ON MMENU -->
                    <div id="shopping-cart-box-ontop">
                        <i class="fa fa-shopping-cart"></i>
                        <div class="shopping-cart-box-ontop-content"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->