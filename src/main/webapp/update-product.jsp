<%@ page import="com.productmanagemnt.root.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Product</title>
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
%>
<div class="container">
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
