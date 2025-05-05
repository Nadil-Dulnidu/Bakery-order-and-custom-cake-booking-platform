<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<html>
<head>
    <title>Dreamy Delights | Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/cart.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    CartService cartService = new CartService();
    ArrayList<Cart> cartItems = cartService.getCartItems(request);

    double subTotal = cartService.getSubtotal(cartItems);
    double totalPrice = cartService.calculateTotalPrice(cartItems);

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
        <section class="cart-section">
            <div class="cart-title">Shopping Cart</div>
            <div class="cart-container">
                <div class="cart-header" style="<%=cartItems== null || cartItems.isEmpty()?"display:none":""%>">
                    <div class="header-product">Product</div>
                    <div class="header-remove">Remove</div>
                    <div class="header-quantity">Quantity</div>
                    <div class="header-total">Total</div>
                </div>
                <%
                    if (cartItems!= null && !cartItems.isEmpty()) {
                        for (Cart cart : cartItems) {
                %>
                        <div class="cart-body">
                            <div class="product-info">
                                <div class="image-box"><img src="<%=cart.getProductImage() %>" alt="<%= cart.getProductName() %>"></div>
                                <div class="product-details">
                                    <div class="product-name"><%= cart.getProductName()%></div>
                                    <div class="product-category"><%=cart.getProductCategory()%></div>
                                    <div class="product-price"><%=PriceString.StringFormat(cart.getProductPrice())%></div>
                                </div>
                            </div>
                            <div class="remove-sec">
                                <button class="remove-btn js-remove-item-btn" data-id="<%=cart.getProductId()%>"><i class="ri-delete-bin-6-fill"></i></button>
                            </div>
                            <div class="quantity-box">
                                <div class="q-min-btn"><button class="quantity-btn js-item-decrease" data-id="<%=cart.getProductId()%>"><i class="ri-subtract-fill"></i></button></div>
                                <div class="quantity-num"> <%=cart.getCartQuantity()%></div>
                                <div class="q-max-btn"><button class="quantity-btn js-item-increase" data-id="<%=cart.getProductId()%>"><i class="ri-add-line"></i></button></div>
                            </div>
                            <div class="total-box">
                                <%=PriceString.StringFormat(cart.getProductPrice() * cart.getCartQuantity())%>
                            </div>
                        </div>
                        <%
                            }
                        } else{
                        %>
                            <div class="cart-empty-msg">
                                <div>You don't have any items in your cart.</div>
                                <div><a href="catalog?name=bread"><button>Shop Now</button></a></div>
                            </div>
                        <%
                            }
                        %>
            </div>
        </section>
        <section>
            <div class="total-container">
                <div class="total-header">
                    <div class="subtotal">Subtotal</div>
                    <div class="subtotal-value"><%=PriceString.StringFormat(subTotal)%></div>
                </div>
                <div class="total-header">
                    <div class="delivery-charge">Delivery Charge</div>
                    <div class="delivery-charge-value"><%=cartItems == null || cartItems.isEmpty()?"Rs.0.00":PriceString.StringFormat(cartService.getDeliveryCost())%></div>
                </div>
                <div class="total-header">
                    <div class="total">Total</div>
                    <div class="total-value"><%=PriceString.StringFormat(totalPrice)%></div>
                </div>
            </div>
        </section>
        <section>
            <div class="cart-bottom-btn" >
                <div>
                    <a href="catalog?name=bread">
                        <button class="back-btn">
                            <span class="ri-arrow-left-s-line"></span>
                            <span>Back to Catalog</span>
                        </button>
                    </a>
                </div>
                <div style="<%=cartItems== null || cartItems.isEmpty()?"pointer-events: none; opacity: 0.7":""%>">
                    <a href="checkout.jsp">
                        <button class="continue-btn">
                            <span>Checkout</span>
                            <span class="ri-arrow-right-s-line"></span>
                        </button>
                    </a>
                </div>
            </div>
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
    <script src="assets/js/cart.js"></script>
</body>
</html>
