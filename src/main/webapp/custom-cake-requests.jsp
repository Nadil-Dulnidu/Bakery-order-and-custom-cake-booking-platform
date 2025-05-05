<%@ page import="com.dreamydelights.root.models.CustomCake" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Dreamy Delights">
  <title>Custom Cake</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/slider.css">
  <link rel="stylesheet" href="assets/css/admin-general.css">
  <link rel="stylesheet" href="assets/css/custom-cake-requests.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }

    String status = (String) request.getAttribute("status");
    String sort = (String) request.getAttribute("sort");
    ArrayList<CustomCake> customCakes = (ArrayList<CustomCake>) request.getAttribute("customCakes");

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
            <li><a href="orders">
              <div class="slide-nav-1">
                <div><i class="ri-shopping-cart-2-fill"></i></div>
                <div><span>Orders</span></div>
              </div>
            </a></li>
            <li><a href="custom-cake-requests" class="active">
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
            <div class="header-title">Custom Cake Requests</div>

            <div class="requests">
                <div class="filters">
                    <h2>Request List</h2>
                    <div>
                        <form method="get">
                            <select id="filter" name="status">
                                <option value="all" <%=status != null && status.equalsIgnoreCase("all")?"selected":""%>>All Request</option>
                                <option value="pending" <%=status != null && status.equalsIgnoreCase("pending")?"selected":""%>>Pending</option>
                                <option value="reviewed" <%=status != null && status.equalsIgnoreCase("reviewed")?"selected":""%>>Reviewed</option>
                                <option value="awaiting" <%=status != null && status.equalsIgnoreCase("awaiting")?"selected":""%>>Awaiting</option>
                                <option value="processing" <%=status != null && status.equalsIgnoreCase("processing")?"selected":""%>>Processing</option>
                                <option value="completed" <%=status != null && status.equalsIgnoreCase("completed")?"selected":""%>>Completed</option>
                            </select>
                            <button type="submit">Filter</button>
                        </form>
                        <form method="get">
                            <select id="sort" name="sort">
                                <option value="normal" <%=sort.equalsIgnoreCase("normal")?"selected":""%> >Select</option>
                                <option value="dateAs" <%=sort.equalsIgnoreCase("dateAs")?"selected":""%>>Date: Ascending</option>
                                <option value="dateDs" <%=sort.equalsIgnoreCase("dateDs")?"selected":""%>>Date: Descending</option>
                            </select>
                            <button type="submit">Sort</button>
                        </form>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Cake Type</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if(customCakes != null ){
                            for(CustomCake customCake: customCakes){
                    %>
                        <tr>
                            <td><%=customCake.getFirstName()%> <%=customCake.getLastName()%></td>
                            <td><%=customCake.getCakeType()%></td>
                            <td><%=customCake.getDate()%></td>
                            <%
                                if(customCake.getEnquiryStatus().equalsIgnoreCase("pending")){
                            %>
                                <td><span class="status pending">Pending</span></td>
                            <%
                                }else if(customCake.getEnquiryStatus().equalsIgnoreCase("reviewed")){
                            %>
                                <td><span class="status reviewed">Reviewed</span></td>
                            <%
                                }else if(customCake.getEnquiryStatus().equalsIgnoreCase("awaiting")){
                            %>
                                <td><span class="status awaiting">Awaiting Customer Response</span></td>
                            <%
                                }else if(customCake.getEnquiryStatus().equalsIgnoreCase("processing")){
                            %>
                                <td><span class="status processing">Processing</span></td>
                            <%
                                }else{
                            %>
                                <td><span class="status completed">Completed</span></td>
                            <%
                                }
                            %>
                            <td><a href="cake-order-enquiry?cakeId=<%=customCake.getCakeId()%>">View Details</a></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script src="assets/js/custom-cake-requests.js"></script>
</body>
</html>