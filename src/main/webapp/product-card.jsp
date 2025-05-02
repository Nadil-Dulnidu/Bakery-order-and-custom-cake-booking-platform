<%@ page import="com.productmanagemnt.root.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dreamy Delights">
<head>
    <title>Dreamy Delights | Product</title>
</head>
<body>
    <%
        Product product = (Product) request.getAttribute("product");
    %>
    <section class="main-container">
        <div class="product-img">
            <img src="<%=product.getProductImage()%>" alt="<%=product.getProductName()%>" width="200px">
            <div class="img-outline"></div>
            <div class="img-outline-2"></div>
        </div>

        <div class="product-info">
            <div class="product-main-text">
                <p class="product-name"><%=product.getProductName()%></p>
                <p class="product-description"><%=product.getDescription()%></p>
            </div>
            <p class="product-price"><%=product.getProductPrice()%></p>
            <div class="action-btn">
                <div class="add-to-cart-btn"><button class="js-add-to-cart" data-id="<%=product.getProductId()%>">Add to Cart</button></div>
                <div class="buy-now-btn"><button class="js-buy-now-btn" data-id="<%=product.getProductId()%>">Buy Now</button></div>
            </div>
        </div>
    </section>
</body>
</html>
