<%@ page import="java.util.List" %>
<%@ page import="com.productmanagemnt.root.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dreamy Delights">
<head>
    <title>Dreamy Delights | Catalog</title>

</head>
<body>
    <main>
        <section class="products-grid">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if(products != null && !products.isEmpty()){
                    for(Product product : products){
            %>
                    <div class="product-card">
                        <a class="product-link" href="product?id=<%=product.getProductId()%>">
                        <div class="product-details">
                            <div class="product-text">
                                <p class="name"><%= product.getProductName()%></p>
                                <p class="price"><%=product.getProductPrice()%></p>
                            </div>
                        </div>
                        <div class="product-img">
                            <img src="<%= product.getProductImage()%>" alt="<%= product.getProductName() %> " width="150px">
                            <a class="cart-btn"><button class="js-add-to-cart" data-id="<%=product.getProductId()%>">add to cart</button></a>
                        </div>
                        </a>
                    </div>
            <%
                }
            }else{
            %>
            <p>No products available.</p>
            <%
                }
            %>
        </section>
    </main>
</body>
</html>
