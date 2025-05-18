<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dreamydelights.root.services.ProductService" %>
<%@ page import="com.dreamydelights.root.services.AdminService" %>
<%@ page import="com.dreamydelights.root.services.CustomCakeService" %>
<%@ page import="com.dreamydelights.root.services.OrderService" %>
<%@ page import="com.dreamydelights.root.models.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Bakery Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }

    OrderService orderService = new OrderService();
    CustomCakeService customCakeService = new CustomCakeService();
    ProductService productService = new ProductService();
    AdminService adminService = new AdminService();

    ArrayList<Order> allOrders = orderService.getAllOrders();
    ArrayList<Order> recentOrders = orderService.getRecentOrders(allOrders);

    ArrayList<CustomCake> allRequests = customCakeService.displayAllOrder();
    ArrayList<CustomCake> recentRequests = customCakeService.getRecentRequests(allRequests);

    List<Product> products = productService.displayProduct();
    ArrayList<User> users = adminService.getAllUsers();
%>
    <div class="container">
        <div class="sidebar">
            <div class="logo">Dreamy Delights</div>
            <ul>
                <li><a href="dashboard.jsp" class="active">
                    <div class="slide-nav-1">
                      <div><i class="ri-dashboard-line"></i></div>
                      <div><span>Dashboard</span></div>
                    </div>
                </a></li>
                <li><a href="orders">
                  <div class="slide-nav-1">
                    <div><i class="ri-shopping-cart-2-fill"></i></div>
                    <div><span>Orders</span></div>
                  </div>
                </a></li>
                <li><a href="custom-cake-requests">
                  <div class="slide-nav-1">
                    <div><i class="ri-cake-2-fill"></i></div>
                    <div><span>Custom Cakes</span></div>
                  </div> 
                </a></li>
                <li><a href="products">
                  <div class="slide-nav-1">
                    <div><i class="fas fa-box"></i></div>
                    <div><span>Products</span></div>
                  </div>
                </a></li>
                <li><a href="users">
                    <div class="slide-nav-1">
                      <div><i class="ri-team-fill"></i></div>
                      <div><span>Users</span></div>
                    </div>
                  </a></li>
                <li><a href="admins">
                    <div class="slide-nav-1">
                      <div><i class="fas fa-user-shield"></i></div>
                      <div><span>Admins</span></div>
                    </div>
                  </a></li>
                <li><a href="reviews">
                    <div class="slide-nav-1">
                        <div><i class="ri-star-smile-fill"></i></div>
                        <div><span>Reviews</span></div>
                    </div>
                </a></li>
            </ul>
            <div class="logout">
                <a href="admin-logout" onclick="return confirm('you want to logout?')"><i class="fas fa-sign-out-alt"></i><span>Log out</span></a>
            </div>
        </div>
        <div class="main-content">
            <div class="header-title">Dashboard</div>
            <div></div>
            <div class="stats">
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-truck"></i></div>
                    <div class="info">
                        <h3><%=!allOrders.isEmpty()? allOrders.size():"0"%></h3>
                    </div>
                    <span>Total Orders</span>
                </div>
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-birthday-cake"></i></div>
                    <div class="info">
                        <h3><%=!allRequests.isEmpty()? allRequests.size():"0"%></h3>
                    </div>
                    <span>Custom Cake Requests</span>
                </div>
                <div class="stat-card">
                    <div class="icon"><i class="fas fa-box"></i></div>
                    <div class="info">
                        <h3><%=!products.isEmpty()? products.size():"0"%></h3>
                    </div>
                    <span>Total Products</span>
                </div>
                <div class="stat-card">
                    <div class="icon"><i class="ri-team-fill"></i></div>
                    <div class="info">
                        <h3><%=!users.isEmpty()?users.size():"0"%></h3>
                    </div>
                    <span>Total Users</span>
                </div>
            </div>
            <div class="content">
                <div class="orders">
                    <div class="filters">
                        <h2>Recent Orders</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>CUSTOMER</th>
                                <th>ITEMS</th>
                                <th>TOTAL</th>
                                <th>STATUS</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            if(recentOrders != null){
                                for (Order order : recentOrders){
                        %>
                                <tr>
                                    <td><%=order.getOrderId()%></td>
                                    <td><%=order.getCustomerFirstName()%> <%=order.getCustomerLastName()%></td>
                                    <td>
                                        <%ArrayList<Cart> cartItems = order.getProducts();
                                            for(Cart cartItem : cartItems){%>
                                            <span><%=cartItem.getProductName()%></span>,
                                        <%}%>
                                    </td>
                                    <td><%=PriceString.StringFormat(order.getTotalPrice())%></td>
                                    <td>
                                        <%if(order.getOrderStatus().equalsIgnoreCase("pending")){%>
                                            <span class="status pending">Pending</span>
                                        <%}else if (order.getOrderStatus().equalsIgnoreCase("processing")) {%>
                                            <span class="status processing">Processing</span>
                                        <%}else{%>
                                            <span class="status completed">Completed</span>
                                        <%}%>
                                    </td>
                                    <td class="view-ord">
                                        <a href="order-details?id=<%=order.getOrderId()%>">View Order</a>
                                    </td>
                                </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="view-all">
                        <a href="orders"><button>View All Orders</button></a>
                    </div>
                </div>
                <div class="requests">
                    <h2>Recent Cake Requests</h2>
                    <%
                        if(recentRequests != null){
                            for(CustomCake cake : recentRequests){
                    %>
                    <div class="request">
                        <div class="info">
                            <h4><%=cake.getFirstName()%> <%=cake.getLastName()%></h4>
                            <p><%=cake.getCakeType()%></p>
                            <%
                                if(cake.getEnquiryStatus().equalsIgnoreCase("pending")){
                            %>
                            <td><span class="status pending">Pending</span></td>
                            <%
                            }else if(cake.getEnquiryStatus().equalsIgnoreCase("reviewed")){
                            %>
                            <td><span class="status reviewed">Reviewed</span></td>
                            <%
                            }else if(cake.getEnquiryStatus().equalsIgnoreCase("awaiting")){
                            %>
                            <td><span class="status awaiting">Awaiting Customer Response</span></td>
                            <%
                            }else if(cake.getEnquiryStatus().equalsIgnoreCase("processing")){
                            %>
                            <td><span class="status processing">Processing</span></td>
                            <%
                            }else{
                            %>
                            <td><span class="status completed">Completed</span></td>
                            <%
                                }
                            %>
                        </div>
                        <div class="date"><%=cake.getDate()%></div>
                        <a href="cake-order-enquiry?cakeId=<%=cake.getCakeId()%>">View Details</a>
                    </div>
                    <%
                            }
                        }
                    %>
                    <div class="view-all view-all-req">
                        <a href="custom-cake-requests"><button>View All Requests</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>