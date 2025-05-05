<%@ page import="com.dreamydelights.root.models.User" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.services.CartService" %>
<%@ page import="com.dreamydelights.root.models.Order" %>
<%@ page import="com.dreamydelights.root.services.OrderService" %>
<%@ page import="com.dreamydelights.root.services.CustomCakeService" %>
<%@ page import="com.dreamydelights.root.models.CustomCake" %>
<%@ page import="com.dreamydelights.root.services.CustomCakeService" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/profile.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        User user = (User)session.getAttribute("user");
        OrderService orderService = new OrderService();
        CartService cartService = new CartService();
        CustomCakeService customCakeService = new CustomCakeService();

        if(session.getAttribute("user") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        ArrayList<Cart> cartItems = cartService.getCartItems(request);
        String status = (String) request.getAttribute("status");

        if(status == null){
            status = "all";
        }
        ArrayList<Order> orders = orderService.getAllOrdersByUser(user.getUserId(),status);
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
        <section class="profile-header">
            <div class="profile-info">
                <div><i class="ri-user-line avatar"></i></div>
                <div>
                    <h2 class="user-name"><%=user.getName()%></h2>
                    <p class="status"><%=user.getUsername()%></p>
                </div>
            </div>
            <div class="profile-actions">
                <button class="edit-btn" onclick="openModal()">Settings</button>
                <a href="logout"><button class="logout-btn">Log Out</button></a>
            </div>
        </section>
        <section class="tabs">
            <a class="js-tab-btn active" data-section="order-history" onclick="showSection('order-history')">Orders History</a>
            <a class="js-tab-btn"  data-section="custom-cake" onclick="showSection('custom-cake')">Custom Cake Enquiries</a>
        </section>
        <section class="content">
            <div class="section active" id="order-history">
                <div class="order-history-header">
                    <div class="content-title">Order History</div>
                    <form class="filter-form" action="status-filter"  method="get" id="order-form">
                        <label for="filter"></label>
                        <select name="filter" id="filter">
                            <option value="all" <%=status.equalsIgnoreCase("all")?"selected":""%> >All</option>
                            <option value="pending" <%=status.equalsIgnoreCase("Pending")?"selected":""%>>Pending</option>
                            <option value="Processing" <%=status.equalsIgnoreCase("Processing")?"selected":""%>>Processing</option>
                            <option value="completed" <%=status.equalsIgnoreCase("completed")?"selected":""%>>Completed</option>
                        </select>
                        <button type="submit">Filter</button>
                    </form>
                </div>
                <%
                    if (orders != null && !orders.isEmpty()) {
                        for (Order order : orders) {
                %>
                <div class="order-box">
                    <div class="order-details">
                        <div>
                            <span class="label">Order Number</span><br/>
                            <strong><%=order.getOrderId()%></strong>
                        </div>
                        <div>
                            <span class="label">Order Date</span><br/>
                            <strong><%=order.getOrderDate()%></strong>
                        </div>
                        <div>
                            <span class="label">Order Status</span><br/>
                            <strong><%=order.getOrderStatus()%></strong>
                        </div>
                        <div>
                            <span class="label">Ship To</span><br/>
                            <strong><%=order.getCustomerAddress()%></strong>
                        </div>
                    </div>
                    <hr>
                    <%
                        ArrayList<Cart> cartList = order.getProducts();
                        for (Cart item : cartList) {
                    %>
                        <div class="product">
                            <img src="<%=item.getProductImage()%>" alt="<%=item.getProductName()%>"/>
                            <div class="product-info">
                                <h4><%=item.getProductName()%></h4>
                                <p>Category: <%=item.getProductCategory()%></p>
                                <p>Quantity: <%=item.getCartQuantity()%></p>
                                <a href="product?id=<%=item.getProductId()%>#add-review" class="rate-link">★ Rate Now</a>
                            </div>
                            <div class="price"><%=PriceString.StringFormat(item.getProductPrice())%></div>
                        </div>
                    <%
                        }
                    %>
                    <div class="summary">
                        <span>Total Amount: <strong><%=PriceString.StringFormat(order.getTotalPrice())%></strong></span>
                        <%if("Pending".equalsIgnoreCase(order.getOrderStatus())){ %>
                            <a href="cancel-order?id=<%=order.getOrderId()%>" onclick="return confirm('Are you sure you want cancel this order?')" class="cancel-link">Cancel Order</a>
                        <%}else{%>
                            <p class="cannot-cancel-msg">Order cannot be cancelled</p>
                        <%}%>
                    </div>
                </div>
                <%
                        }
                    }else{
                %>
                    <p>Empty Orders</p>
                <%
                    }
                %>
            </div>
            <div class="section" id="custom-cake">
                <div class="content-title">Custom Cake Enquiries</div>
                <div class="cus-cake-container">
                    <%
                        ArrayList<CustomCake> customCake = customCakeService.displayOrderByUser(user.getUserId());
                        if(customCake != null && !customCake.isEmpty()){
                            for(CustomCake cake : customCake){
                    %>
                    <div class="enquiry-box">
                        <div class="cake-details">
                            <div>
                                <span>Enquiry Number:</span>
                                <span><%=cake.getCakeId()%></span>
                            </div>
                            <div>
                                <span>Delivery to:</span>
                                <span><%=cake.getDeliveryLocation()%></span>
                            </div>
                            <div>
                                <span>Delivery Date:</span>
                                <span><%=cake.getDate()%></span>
                            </div>
                            <div>
                                <span>Enquiry Status:</span>
                                <span><%=cake.getEnquiryStatus()%></span>
                            </div>
                        </div>
                        <div class="enquiry-order-cancel">
                            <%if("Pending".equalsIgnoreCase(cake.getEnquiryStatus())){ %>
                            <a href="delete-enquiry?id=<%=cake.getCakeId()%>" onclick="return confirm('Are you sure you want cancel this enquiry?')" class="cancel-link">Cancel Enquiry</a>
                            <%}else{%>
                            <p class="cannot-cancel-msg">Enquiry cannot be cancelled</p>
                            <%}%>
                        </div>
                    </div>
                    <%
                        }
                    }else{
                    %>
                    <p>Empty Enquiries</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
        <section>
            <div id="editModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" onclick="closeModal()"><i class="ri-close-line"></i></span>
                    <div class="acc-settings">Account Settings</div>
                    <div class="edit-acc">Edit Account</div>
                    <form class="edit-form" action="update" id="editForm" method="POST">
                        <p>${error}</p>
                        <label>
                            Name
                            <input type="text" name="name" value="<%=user.getName()%>" />
                        </label>
                        <label>
                            Username
                            <input type="text" name="uname" value="<%=user.getUsername()%>" />
                        </label>
                        <label>
                            Email
                            <input type="email" name="email" disabled value="<%=user.getEmail()%>" />
                        </label>
                        <label>
                            Password
                            <input type="password" name="pwd" value="<%=user.getPassword()%>" />
                        </label>
                        <button type="submit">Save Changes</button>
                    </form>
                    <div class="delete-acc">Delete Account</div>
                    <div class="delete-acc-btn"><a href="delete"><button onclick="return confirm('Are you sure you want to delete your account?')">Delete Account</button></a></div>
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
    <script src="assets/js/profile.js"></script>
    <script src="assets/js/date.js"></script>
</body>
</html>
