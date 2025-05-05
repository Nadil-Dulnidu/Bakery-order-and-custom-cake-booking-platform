<%@ page import="com.dreamydelights.root.services.ReviewService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.models.Review" %>
<%@ page import="com.dreamydelights.root.models.User" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<%@ page import="com.dreamydelights.root.services.ReviewService" %>
<%@ page import="models.*" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="com.dreamydelights.root.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dreamy Delights">
<head>
    <title>Dreamy Delights | Product</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/product-card.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
    <%
        Product product = (Product) request.getAttribute("product");
        String productId = request.getParameter("id");

        HttpSession session1 = request.getSession(false);
        User user = (User) session1.getAttribute("user");

        ReviewService reviewService = new ReviewService();
        ArrayList<Review> reviews = reviewService.displayReviews(productId);

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
        <section class="main-container">
            <div class="product-img">
                <img src="<%=product.getProductImage()%>" alt="<%=product.getProductName()%>">
                <div class="img-outline"></div>
                <div class="img-outline-2"></div>
            </div>

            <div class="product-info">
                <div class="product-main-text">
                    <p class="product-name"><%=product.getProductName()%></p>
                    <p class="product-description"><%=product.getDescription()%></p>
                </div>
                <p class="product-price"><%=PriceString.StringFormat(product.getProductPrice())%></p>
                <div class="action-btn">
                    <div class="add-to-cart-btn"><button class="js-add-to-cart" data-id="<%=product.getProductId()%>">Add to Cart</button></div>
                    <div class="buy-now-btn"><button class="js-buy-now-btn" data-id="<%=product.getProductId()%>">Buy Now</button></div>
                </div>
            </div>
        </section>
        <section class="display-review-container">
            <div class="customer-reviews">Our Customer Reviews</div>
            <div class="review-box">

                <%
                    if(reviews != null && !reviews.isEmpty()){
                        for(Review review : reviews){
                %>
                <div class="user-pic">
                    <div class="user-icon" ><i class="ri-user-line"></i></div>
                </div>
                <div class="review-content">
                    <div class="display-name"><%=user != null && review.getUserId().equals(user.getUserId())?review.getName()+" (You)":review.getName()%></div>
                    <%
                        if(review.getRating() == 5.0){
                    %>
                    <div class="rate-stars">
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                    </div>
                    <%
                    }else if(review.getRating() == 4.0){
                    %>
                    <div class="rate-stars">
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                    </div>
                    <%
                    }else if(review.getRating() == 3.0){
                    %>
                    <div class="rate-stars">
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                    </div>
                    <%
                    }else if(review.getRating() == 2.0){
                    %>

                    <div class="rate-stars">
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                    </div>
                    <%
                    }else{
                    %>
                    <div class="rate-stars">
                        <i class="ri-star-fill"></i>
                    </div>
                    <%
                        }
                    %>
                    <div class="display-message"><%=review.getMessage()%></div>
                    <%
                        if (user != null && user.getUserId().equals(review.getUserId())) {
                    %>
                    <p>${message}</p>
                    <div class="edit-buttons">
                        <div class="review-edit-btn"><a><button id="open-btn">Edit</button></a></div>
                        <div class="review-delete-btn"><a href="delete-review?userId=<%=review.getUserId()%>&productId=<%=review.getProductId()%>"><button>Delete</button></a></div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                        }
                    }else{
                %>
                <p class="empty-review-message">There are no reviews to display yet. Be the first to leave one!</p>
                <%
                    }
                %>
            </div>
        </section>
        <section class="add-review-container" id="add-review">
            <div class="main-title">Submit your Review</div>
            <form class="review-form" action="submit-review" method="post">
                <input type="hidden" name="id" value="<%=product.getProductId()%>">
                <p class="msg-area">${error}</p>
                <div class="rate-label"> Add Your Rating <span>*</span></div>
                <div class="rating">
                    <input type="radio" name="rate" value="5" required id="star5">
                    <label for="star5"><i class="ri-star-fill"></i></label>
                    <input type="radio" name="rate" value="4" id="star4">
                    <label for="star4"><i class="ri-star-fill"></i></label>
                    <input type="radio" name="rate" value="3" id="star3">
                    <label for="star3"><i class="ri-star-fill"></i></label>
                    <input type="radio" name="rate" value="2" id="star2">
                    <label for="star2"><i class="ri-star-fill"></i></label>
                    <input type="radio" name="rate" value="1" id="star1">
                    <label for="star1"><i class="ri-star-fill"></i></label>
                </div>
                <div class="name-input">
                    <label for="name">Name <span>*</span></label>
                    <input type="text" id="name" name="name" placeholder="John Doe" required>
                </div>
                <div class="message-area">
                    <label for="message">Write Your Review</label><br>
                    <textarea placeholder="Write here..." id="message" name="message"></textarea>
                </div>
                <div class="button-area">
                    <button class="submit-btn" type="submit">Submit Review</button>
                    <button class="reset-btn" type="reset">Reset</button>
                </div>
            </form>
            <div class="model" id="review-edit-container">
                <div class="review-edit-container" >
                    <div class="edit-review-header">
                        <div class="title">Edit Review</div>
                        <div class="close-btn"><button id="close-btn"><i class="ri-close-line"></i></button></div>
                    </div>
                   <%
                       if(user != null){
                           Review editReview = reviewService.displayReviews(user.getUserId(),productId);
                           if(editReview != null){
                   %>
                    <form class="review-form edit-review" action="edit-review" method="post">
                        <input type="hidden" name="productId" value="<%=product.getProductId()%>">
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>">
                        <p class="msg-area">${error}</p>
                        <div class="rate-label"> Add Your Rating</div>
                        <div class="rating">
                            <input type="radio" name="rate" value="5" <%=editReview.getRating() == 5.0?"checked":""%> id="stare5">
                            <label for="stare5"><i class="ri-star-fill"></i></label>
                            <input type="radio" name="rate" value="4" <%=editReview.getRating() == 4.0?"checked":""%> id="stare4">
                            <label for="stare4"><i class="ri-star-fill"></i></label>
                            <input type="radio" name="rate" value="3" <%=editReview.getRating() == 3.0?"checked":""%> id="stare3">
                            <label for="stare3"><i class="ri-star-fill"></i></label>
                            <input type="radio" name="rate" value="2" <%=editReview.getRating() == 2.0?"checked":""%> id="stare2">
                            <label for="stare2"><i class="ri-star-fill"></i></label>
                            <input type="radio" name="rate" value="1" <%=editReview.getRating() == 1.0?"checked":""%> id="stare1">
                            <label for="stare1"><i class="ri-star-fill"></i></label>
                        </div>
                        <div class="name-input">
                            <label for="name2">Name</label>
                            <input type="text" id="name2" name="name" value="<%=editReview.getName()%>">
                        </div>
                        <div class="message-area">
                            <label for="message2">Write Your Review</label><br>
                            <textarea id="message2" name="message"><%=editReview.getMessage()%></textarea>
                        </div>
                        <div class="button-area">
                            <button class="submit-btn" type="submit">Save</button>
                        </div>
                    </form>
                    <%
                            }
                        }
                    %>
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
                    <p><a href="">Bread</a></p>
                    <p><a href="">Cake</a></p>
                    <p><a href="">Beverage</a></p>
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
    <script src="assets/js/cart.js"></script>
    <script src="assets/js/product-card.js"></script>
</body>
</html>
