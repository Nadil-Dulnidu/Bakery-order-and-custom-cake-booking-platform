<%@ page import="com.dreamydelights.root.models.CustomCake" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Dreamy Delights">
  <title>Custom Cake Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
  <link rel="stylesheet" href="assets/css/custom-cake-request-details.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">

</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }
    CustomCake cake = (CustomCake) request.getAttribute("cake");
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
                <div><span>Custom Cake</span></div>
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
                  <div><span>Admin</span></div>
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
            <div class="header-title">Request Details</div>
            <div class="breadcrumb">
                <a href="custom-cake-requests">Custom Cake Requests</a> / <%=cake != null ? cake.getFirstName()+" "+cake.getLastName():""%>
            </div>
            <%
                if(cake != null){
            %>
            <div class="details">
                <div class="section">
                    <h2>Customer Information</h2>
                    <p><strong>Name:</strong> <%=cake.getFirstName()%> <%=cake.getLastName()%></p>
                    <p><strong>Email:</strong> <%=cake.getEmail()%></p>
                    <p><strong>Phone:</strong> <%=cake.getPhone()%></p>
                </div>

                <div class="section">
                    <h2>Cake Details</h2>
                    <p><strong>Type:</strong> <%=cake.getCakeType()%></p>
                    <p><strong>Details:</strong> <%=cake.getCakeDetails()%></p>
                    <p><strong>Budget:</strong> <%=cake.getBudgetDetails()%></p>
                    <%
                        if (cake.getImagePath() != null && !cake.getImagePath().isEmpty()) {
                            for (String image : cake.getImagePath().split(";")) {
                    %>
                        <div class="customer-image">
                            <img src="images/<%=image%>" alt="Cake Image">
                        </div>
                    <%
                        }
                    } else {
                    %>
                        <p>No images uploaded</p>
                    <%
                        }
                    %>
                </div>

                <div class="section">
                    <h2>Order Information</h2>
                    <p><strong>Request Date:</strong> May 28, 2023</p>
                    <p><strong>Location: </strong> <%=cake.getDeliveryLocation()%></p>
                </div>

                <div class="section">
                    <h2>Actions</h2>
                    <div class="actions">
                        <form action="update-enq-status" method="post">
                            <input type="hidden" name="enquiryId" value="<%=cake.getCakeId()%>">
                            <select  name="status" id="status">
                                <option value="pending" <%=cake.getEnquiryStatus().equalsIgnoreCase("pending")? "selected": ""%>>Pending</option>
                                <option value="Reviewed" <%=cake.getEnquiryStatus().equalsIgnoreCase("reviewed")? "selected": ""%>>Reviewed</option>
                                <option value="awaiting" <%=cake.getEnquiryStatus().equalsIgnoreCase("awaiting")? "selected": ""%>>Awaiting Customer Response</option>
                                <option value="processing" <%=cake.getEnquiryStatus().equalsIgnoreCase("processing")? "selected": ""%>>Processing</option>
                                <option value="completed" <%=cake.getEnquiryStatus().equalsIgnoreCase("completed")? "selected": ""%>>Completed</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                        <a href="delete-cake-enquiry?id=<%=cake.getCakeId()%>"><button class="contact">Remove</button></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>