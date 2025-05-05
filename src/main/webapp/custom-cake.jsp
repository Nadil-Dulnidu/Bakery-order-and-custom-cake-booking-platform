<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Custom Cakes</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/custom-cake.css">
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
        <section class="section-1">
            <div class="sec-1-title">Custom Cakes</div>
            <div class="sec-1-para">We love to have a bit of fun with our custom cakes! Send us your craziest themes and inspirational photos and we will help create an entirely unique and delicious centrepiece for your event or birthday celebration.</div>
            <div class="sec-1-btn"><a href="custom-cake-enquiry.jsp"><button>Enquire Now</button></a></div>
        </section>
        <section class="image-gallery" id="image-gallery">
            <div class="gallery-title">Our Cake Creations</div>
            <div class="gallery-container">
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-1.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-2.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-3.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-4.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-5.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-6.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-7.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-8.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-9.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-10.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-11.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-12.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-13.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-14.webp" alt="cuscake-1"></div>
                <div class="gallery-item"><img class="image" src="assets/images/cuscake-15.webp" alt="cuscake-1"></div>
            </div>
            <div class="popup">
                <div class="top-bar">
                    <i class="close-btn ri-close-line"></i>
                </div>
                <button class="arrow-btn left-arrow"><i class="ri-arrow-left-line"></i></button>
                <button class="arrow-btn right-arrow"><i class="ri-arrow-right-line"></i></button>
                <img src="assets/images/cuscake-1.webp" class="large-image" alt="">
            </div>
            <div class="sec-1-btn btn-2"><a href="custom-cake-enquiry.jsp"><button>Enquire Now</button></a></div>
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
    <script src="assets/js/date.js"></script>
    <script src="assets/js/custom-cake.js"></script>
</body>
</html>
