<%@ page import="com.dreamydelights.root.models.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dreamy Delights">
<head>
    <title>Dreamy Delights | Catalog</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/catalog.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">

</head>
<body>
<%
    CartService cartService = new CartService();
    ArrayList<Cart> cartItems = cartService.getCartItems(request);

    int quantity = cartService.getCartQuantity(cartItems);
%>
<header class="header">
    <div class="nav-bar">
        <p class="bakery-logo"><a class="bakery-logo-a" href="index.jsp">Dreamy Delights</a></p>
        <div class="nav-content">
            <div class="nav-items">
                <a href="catalog?name=bread">Bread</a>
            </div>
            <div class="nav-items">
                <a href="catalog?name=pastry">Pastry</a>
            </div>
            <div class="nav-items">
                <a href="login.jsp">Sign in</a>
            </div>
            <div class="nav-items">
                <a href="profile.jsp"><i class="ri-user-fill"></i></a>
            </div>
            <div class="nav-items">
                <a href="cart.jsp" class="cart-icon">
                    <i class="ri-shopping-cart-2-fill"></i>
                    <span class="cart-item-display" style="<%=cartItems == null || cartItems.isEmpty()? "display:none;":""%>"><%=quantity%></span>
                </a>
            </div>
        </div>
    </div>
</header>
    <main>
        <section class="catalog">
            <p class="main-title">${category}</p>
            <div class="category-nav-bar">
                <div class="cat-item default-btn">
                    <a href="catalog?name=bread">
                        <button>Bread</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=croissants">
                        <button>Croissants</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=pastry">
                        <button>Pastry</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=cakes">
                        <button>Cakes</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=cookies">
                        <button>Cookies</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=dessert">
                        <button>Dessert</button>
                    </a>
                </div>
                <div class="cat-item">
                    <a href="catalog?name=beverages">
                        <button>Beverages</button>
                    </a>
                </div>
            </div>
        </section>
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
                                <p class="price"><%=PriceString.StringFormat(product.getProductPrice())%></p>
                            </div>
                        </div>
                        <div class="product-img">
                            <img src="<%= product.getProductImage()%>" alt="<%= product.getProductName() %>">
                            <a class="cart-btn"><button class="js-add-to-cart" data-id="<%=product.getProductId()%>"><i class="ri-shopping-cart-2-fill shopping-cart-icon"></i></button></a>
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
<footer>
    <div class="footer-container">
        <div class="footer-sec-1">
            <p>Dreamy Delights</p>
        </div>
        <div class="footer-sec-2">
            <div class="sec-2-text">
                <p><a href="catalog?name=bread">Bread</a></p>
                <p><a href="catalog?name=pastry">Pastry</a></p>
                <p><a href="catalog?name=beverages">Beverage</a></p>
            </div>
            <div class="sec-2-icons">
                <p><a href=""><i class="ri-facebook-circle-fill"></i></a></p>
                <p><a href=""><i class="ri-instagram-fill"></i></a></p>
                <p><a href=""><i class="ri-whatsapp-fill"></i></a></p>
            </div>
            <p class="copyright">Dreamy Delights &copy; <span id="copy-year"></span></p>
        </div>
        <div class="footer-sec-3">
            <p>Contact Us</p>
            <p>011-7544801</p>
            <p>Pittugala</p>
        </div>
    </div>
</footer>
    <script src="assets/js/catalog.js"></script>
    <script src="assets/js/date.js"></script>
    <script src="assets/js/cart.js"></script>
</body>
</html>
