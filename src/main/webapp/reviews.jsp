<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.models.Review" %>
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
    <link rel="stylesheet" href="assets/css/reviews.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");

    }
    String sort = (String) request.getAttribute("sort");
    ArrayList<Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");
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
            <li><a href="reviews" class="active">
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
        <div class="header-title">Products Reviews</div>

        <div class="requests">
            <div class="filters">
                <h2>Review List</h2>
                <div>
                    <form method="get">
                        <select id="sort" name="sort">
                            <option value="normal" <%=sort.equalsIgnoreCase("normal")?"selected":""%> >Select</option>
                            <option value="rateAs" <%=sort.equalsIgnoreCase("rateAs")?"selected":""%>>Rating: Ascending</option>
                            <option value="rateDs" <%=sort.equalsIgnoreCase("rateDs")?"selected":""%>>Rating: Descending</option>
                        </select>
                        <button type="submit">Sort</button>
                    </form>
                </div>
            </div>
            <table>
                <thead>
                <tr>
                    <th>PRODUCT</th>
                    <th>NAME</th>
                    <th>RATING</th>
                    <th>MESSAGE</th>
                    <th>DATE</th>
                    <th>ACTION</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(reviews != null){
                        for (Review review: reviews){
                %>
                    <tr>
                        <td><%=review.getProductId()%></td>
                        <td><%=review.getName()%></td>
                        <%if(review.getRating() == 5.0){%>
                        <td class="rate-stars">
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                        </td>
                        <%}else if(review.getRating() == 4.0){%>
                        <td class="rate-stars">
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                        </td>
                        <%}else if(review.getRating() == 3.0){%>
                        <td class="rate-stars">
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                        </td>
                        <%}else if(review.getRating() == 2.0){%>
                        <td class="rate-stars">
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                        </td>
                        <%}else{%>
                        <td class="rate-stars">
                            <i class="ri-star-fill"></i>
                        </td>
                        <%}%>
                        <td><%=review.getMessage()%></td>
                        <td><%=review.getDate()%></td>
                        <td class="remove-btn"><a href="review-delete?uid=<%=review.getUserId()%>&pid=<%=review.getProductId()%>"><button>Remove</button></a></td>
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
<script src="assets/js/reviews.js"></script>
</body>
</html>