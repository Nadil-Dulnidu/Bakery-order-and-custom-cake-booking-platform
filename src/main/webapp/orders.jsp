<%@ page import="com.dreamydelights.root.services.OrderService" %>
<%@ page import="com.dreamydelights.root.models.Queue" %>
<%@ page import="com.dreamydelights.root.models.Order" %>
<%@ page import="com.dreamydelights.root.models.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Dreamy Delights">
  <title>Bakery Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/admin-general.css">
  <link rel="stylesheet" href="assets/css/orders.css">
  <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }
        String status = (String) request.getAttribute("status");
        Queue orders = (Queue) request.getAttribute("orders");
    %>
    <div class="container">
      <div class="sidebar">
        <div class="logo">Dreamy Delights</div>
        <ul>
            <li><a href="dashboard.jsp" >
                <div class="slide-nav-1">
                  <div><i class="ri-dashboard-line"></i></div>
                  <div><span>Dashboard</span></div>
                </div>
            </a></li>
            <li><a href="orders" class="active">
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
            <div class="header-title">All Order</div>
            <div class="orders">
                <div class="filters">
                    <h2>Order List</h2>
                    <form method="get">
                        <select name="status" id="filter">
                            <option value="all" <%=status != null && status.equalsIgnoreCase("all")?"selected":""%> >All</option>
                            <option value="pending" <%=status != null && status.equalsIgnoreCase("Pending")?"selected":""%>>Pending</option>
                            <option value="processing" <%=status != null && status.equalsIgnoreCase("Processing")?"selected":""%>>Processing</option>
                            <option value="completed" <%=status != null && status.equalsIgnoreCase("completed")?"selected":""%>>Completed</option>
                        </select>
                        <button type="submit">Filter</button>
                    </form>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>CUSTOMER</th>
                            <th>ITEMS</th>
                            <th>DATE</th>
                            <th>TOTAL</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if(orders != null){
                            while (!orders.isEmpty()){
                                Order order = orders.remove();
                                assert order != null;%>
                    <tr>
                        <td><%=order.getOrderId()%></td>
                        <td><%=order.getCustomerFirstName()%> <%=order.getCustomerLastName()%></td>
                        <td>
                            <%
                                ArrayList<Cart> cartItems = order.getProducts();
                                for(Cart cartItem : cartItems){
                            %>
                            <span><%=cartItem.getProductName()%></span>,
                            <%
                                }
                            %>
                        </td>
                        <td><%=order.getOrderDate()%></td>
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
                        <td class="view"><a href="order-details?id=<%=order.getOrderId()%>">View order</a></td>
                    </tr>
                        <%}
                    }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="assets/js/orders.js"></script>
</body>
</html>