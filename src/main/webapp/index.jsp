<%@ page import="java.util.List" %>
<%@ page import="com.dreamydelights.root.models.Product" %>
<%@ page import="com.dreamydelights.root.services.ProductService" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dreamy Delights">
<meta name="" content="">
<head>
    <title>Dreamy Delights | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body id="home">
<%
    CartService cartService = new CartService();
    ArrayList<Cart> cartItems = cartService.getCartItems(request);

    ProductService productService = new ProductService();

    int quantity = cartService.getCartQuantity(cartItems);
%>
    <header class="header" id="header">
        <div class="nav-bar">
            <p class="bakery-logo"><a class="bakery-logo-a" href="#home">Dreamy Delights</a></p>
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
        <section class="main-container">
            <div class="text-area">
                <p class="main-title">Bread and Pastry</p>
                <p class="second-title">made with love</p>
                <p class="sub-title">Visit us or order home delivery experience the quality<br>
                    of our products and savor the taste of real bread!</p>
                <div class="btn-area">
                    <a href="catalog?name=bread"><button class="menu-btn" >Catalog</button></a>
                    <a href="https://maps.app.goo.gl/5NmoZqNGkdrbaB5i7" target="_blank"><button class="location-btn"><span>Find Our Bakery</span><i class="ri-map-pin-2-fill icon"></i></button></a>
                </div>
            </div>
            <div class="image-area">
                <img class="cover-img" src="assets/images/backgrond.jpg" alt="cake cover">
                <div class="img-outline-1"></div>
                <div class="img-outline-2"></div>
            </div>
        </section>
        <section class="item-area">
               <div class="items-header">
                   <p class="item-title">Our Clients Love</p>
                   <div class="navigation-btn">
                       <p><button id="back-btn"><i class="back-btn nav-btn ri-arrow-left-s-fill"></i></button></p>
                       <p><button id="forward-btn"><i class="forward-btn nav-btn ri-arrow-right-s-fill"></i></button></p>
                   </div>
               </div>
               <div class="product-container">
                   <%
                       Random random = new Random();
                       List<Product> products = productService.displayProduct();
                       if(!products.isEmpty()){
                           for(int i = 0; i < 8; i++){
                               int randomIndex = random.nextInt(products.size());
                               Product product = products.get(randomIndex);
                   %>
                   <a href="product?id=<%=product.getProductId()%>">
                       <div class="product-card">
                           <img src="<%= product.getProductImage() %>" alt="<%= product.getProductName() %>">
                           <div class="item-details">
                               <div class="name-price">
                                   <p class="name"><%= product.getProductName() %></p>
                                   <p class="price"><%=PriceString.StringFormat(product.getProductPrice())%></p>
                               </div>
                               <p class="add-to-cart-btn">
                                   <a><button class="js-add-to-cart" data-id="<%=product.getProductId()%>"><i class="ri-shopping-cart-2-fill shopping-cart-icon"></i></button></a>
                               </p>
                           </div>
                       </div>
                   </a>
                   <%
                       }
                   }else{
                   %>
                   <p>No products available.</p>
                   <%
                       }
                   %>
               </div>
        </section>
        <section class="info-container">
            <div class="text-area">
                <p class="info-main-title">Who We Are</p>
                <p class="info-para-1">Our bakery is the art of creating pleasure from natural ingredients.<br>
                    transforming each product into an unforgettable taste experience.</p>
                <p class="info-para-2">We pay special attention to details to ensure you have to unforgettable<br>moments.</p>
            </div>
            <div class="image-area">
                <div class="detail-card-1 block">
                    <div class="detail-card-1-text">
                        <p class="sen-1">Customer satisfaction</p>
                        <p class="sen-2">over 95%</p>
                    </div>
                    <div class="detail-card-1-img">
                        <p><i class="ri-emotion-laugh-fill face-icon"></i></p>
                    </div>
                </div>
                <div class="detail-card-2 block">
                    <p>Natural ingredients</p>
                    <p><i class="ri-leaf-fill"></i></p>
                </div>
                <div class="detail-card-3 block">
                    <p>Over 100 baked <br>
                        goods available</p>
                </div>
                <img class="info-img" src="assets/images/concentrated-man-baker-standing-bakery-near-bread.jpg" alt="baker man">
                <div class="info-img-outline-1"></div>
                <div class="info-img-outline-2"></div>

            </div>
        </section>
        <section class="ingredients-container">
            <h1>Bakes Made with All-Natural<br>Ingredients</h1>
            <div class="flex-container">
                <div class="ingredients-card">
                    <img src="assets/images/milk.png" alt="Milk">
                    <h3>Natural Milk</h3>
                    <p>At our bakery, we use fresh, natural milk in all our baked goods to ensure the best flavor and quality.</p>
                </div>
                <div class="ingredients-card">
                    <img src="assets/images/flour.png" alt="Flour">
                    <h3>Premium Flour</h3>
                    <p>Our bakery is committed to using only the finest ingredients, which is why we bake with premium flour.</p>
                </div>
                <div class="ingredients-card">
                    <img src="assets/images/butter.png" alt="Butter">
                    <h3>Butter</h3>
                    <p>Butter brings a rich, creamy flavor and perfect texture to our pastries, cookies, and cakes that margarine simply can't match.</p>
                </div>
            </div>
        </section>
        <section class="order-cake-container">
            <div class="order-cake-img-area">
                <img src="assets/images/woman-making-cheesecake-with-fruits-jam-top.jpg" alt="woman making a cake">
                <div class="order-cake-img-outline-1"></div>
                <div class="order-cake-img-outline-2"></div>
            </div>
            <div class="order-cake-text-area">
                <p class="order-cake-text-title">Order a Cake for Any Occasion</p>
                <p class="order-cake-text-para">Our team is ready to adorn any of your celebrations with a special and delicious
                    cake. We will consider all your preferences and suggest our ideas</p>
                <a href="custom-cake.jsp"><button class="order-cake-button">Order Cake</button></a>
            </div>
        </section>
        <section class="cake-gallery-container">
            <p class="cake-gallery-title">The Cakes We Made</p>
            <div class="cake-gallery" id="tranding">
                <div class="container">
                    <div class="swiper tranding-slider">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-14.webp" alt="cuscake">
                                </div>
                            </div>
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-13.webp" alt="cuscake">
                                </div>
                            </div>
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-10.webp" alt="cuscake">
                                </div>
                            </div>
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-12.webp" alt="cuscake">
                                </div>
                            </div>
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-1.webp" alt="cuscake">
                                </div>
                            </div>
                            <div class="swiper-slide tranding-slide">
                                <div class="tranding-slide-img">
                                    <img src="assets/images/cuscake-11.webp" alt="cuscake">
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-prev">
                            <i class="ri-arrow-left-circle-fill"></i>
                        </div>
                        <div class="swiper-button-next">
                            <i class="ri-arrow-right-circle-fill"></i>
                        </div>
                    </div>
                </div>
            </div>
            <button class="cake-gallery"><a href="custom-cake.jsp#image-gallery" class="cake-gallery-button">SEE MORE</a></button>
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
    <script src="assets/js/home.js"></script>
    <script src="assets/js/date.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="assets/js/swiper.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/cart.js"></script>
</body>
</html>
