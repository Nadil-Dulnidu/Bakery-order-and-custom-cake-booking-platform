<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="com.dreamydelights.root.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Custom Cake Enquiry</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/custom-cake-enquiry.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    HttpSession session1 = request.getSession(false);
    User user =(User) session1.getAttribute("user");
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
    <div class="main-title">Custom Cake Enquiry</div>
    <form action="custom-cake-enquiry" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="<%=user.getUserId()%>">
        <div class="input-1 input">
            <div>
                <label for="fname">First Name <span class="star">*</span></label><br>
                <input type="text" name="fname" id="fname" required>
            </div>
            <div>
                <label for="lname">Last Name <span class="star">*</span></label><br>
                <input type="text" name="lname" id="lname" required>
            </div>
        </div>
        <div class="input">
            <label for="phone">Phone Number <span class="star">*</span></label><br>
            <input type="tel" name="phone" id="phone" required>
        </div>
        <div class="input">
            <label for="address">Delivery Location <span class="star">*</span></label><br>
            <input type="text" name="address" id="address" required>
        </div>
        <div class="date input">
            <label for="date">Date Needed <span class="star">*</span></label><br>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="date input">
            <label for="type">What type of Cake <span class="star">*</span></label><br>
            <input type="text" id="type" name="type" placeholder="Eg. Birthday Cake" required>
        </div>
        <div class="input">
            <label for="textarea">Tell us what you are after! <span class="star">*</span></label><br>
            <textarea placeholder="Give us details..." name="cake-details" id="textarea"></textarea>
        </div>
        <div class="input">
            <label for="text">Do you have a budget you would like us to work within? <span class="star">*</span></label><br>
            <input type="text" id="text" name="budget-details" required>
        </div>
        <div class="image-upload">
            <label for="file">Add Images</label>
            <input type="file" id="file" name="image" multiple accept="image/*">
        </div>
        <div class="btn">
            <button class="submit-btn" type="submit">Submit</button>
        </div>
    </form>
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
</body>
</html>