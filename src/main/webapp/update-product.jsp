<%@ page import="com.dreamydelights.root.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/update-product.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }
    Product product = (Product) request.getAttribute("product");
%>
<div class="container">
    <div class="sidebar">
        <div class="logo">Dreamy Delights</div>
        <ul>
            <li><a href="dashboard.jsp" >
                <div class="slide-nav-1">
                    <div><i class="ri-dashboard-line"></i></div>
                    <div><span>Dashboard</span></div>
                </div>
            </a></li>
            <li><a href="orders">
                <div class="slide-nav-1">
                    <div><i class="ri-shopping-cart-2-fill"></i></div>
                    <div><span>Orders</span></div>
                </div>
            </a></li>
            <li><a href="custom-cake-requests">
                <div class="slide-nav-1">
                    <div><i class="ri-cake-2-fill"></i></div>
                    <div><span>Custom Cakes</span></div>
                </div>
            </a></li>
            <li><a href="products" class="active">
                <div class="slide-nav-1">
                    <div><i class="fas fa-box"></i></div>
                    <div><span>Products</span></div>
                </div>
            </a></li>
            <li><a href="users">
                <div class="slide-nav-1">
                    <div><i class="ri-team-fill"></i></div>
                    <div><span>Users</span></div>
                </div>
            </a></li>
            <li><a href="admins">
                <div class="slide-nav-1">
                    <div><i class="fas fa-user-shield"></i></div>
                    <div><span>Admins</span></div>
                </div>
            </a></li>
            <li><a href="reviews">
                <div class="slide-nav-1">
                    <div><i class="ri-star-smile-fill"></i></div>
                    <div><span>Reviews</span></div>
                </div>
            </a></li>
        </ul>
        <div class="logout">
            <a href="admin-logout" onclick="return confirm('you want to logout?')"><i class="fas fa-sign-out-alt"></i><span>Log out</span></a>
        </div>
    </div>

    <div class="main-content">
        <div class="header-title">Edit Product</div>
        <div class="breadcrumb">
            <a href="products">Products</a> / Edit Product
        </div>

        <div class="form-container">
            <h2>Edit Product</h2>
            <form id="editProductForm" action="update-product" method="post">
                <input type="hidden" name="id" value="<%=product.getProductId()%>">
                <input type="hidden" name="image" value="<%=product.getProductImage()%>">
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="name" value="<%=product.getProductName()%>">

                <label for="category">Category</label>
                <select id="category" name="category">
                    <option value="">Select Category</option>
                    <option value="bread" <%=product.getProductCategory().equalsIgnoreCase("bread")?"selected":""%>>Bread</option>
                    <option value="cake" <%=product.getProductCategory().equalsIgnoreCase("cake")?"selected":""%>>Cake</option>
                    <option value="pastry" <%=product.getProductCategory().equalsIgnoreCase("pastry")?"selected":""%>>Pastry</option>
                    <option class="cookie" <%=product.getProductCategory().equalsIgnoreCase("cookie")?"selected":""%>>Cookie</option>
                    <option value="pie" <%=product.getProductCategory().equalsIgnoreCase("pie")?"selected":""%>>Pie</option>
                    <option value="croissant" <%=product.getProductCategory().equalsIgnoreCase("croissant")?"selected":""%>>Croissant</option>
                    <option value="dessert" <%=product.getProductCategory().equalsIgnoreCase("dessert")?"selected":""%>>Dessert</option>
                    <option value="beverage" <%=product.getProductCategory().equalsIgnoreCase("beverage")?"selected":""%>>beverage</option>
                </select>

                <label for="price">Price</label>
                <input type="number" id="price" name="price" step="0.01" value="<%=product.getProductPrice()%>">

                <label for="description">Description</label>
                <textarea id="description" name="description"><%=product.getDescription()%></textarea>

                <button type="submit">Update Product</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
