<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.models.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Users</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/users.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }

    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
    String message = (String) request.getAttribute("message");

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
                <li><a href="products" >
                    <div class="slide-nav-1">
                        <div><i class="fas fa-box"></i></div>
                        <div><span>Products</span></div>
                    </div>
                </a></li>
                <li><a href="users" class="active">
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
            <div class="header-title">Users</div>

            <div class="users">
                <div class="filters">
                    <h2>User List</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>USERNAME</th>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>PASSWORD</th>
                            <th>ROLE</th>
                            <th>REMOVE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <p><%=message != null? message : ""%></p>
                        <%
                            if(users != null){
                                for(User user: users){
                        %>
                        <tr>
                            <td><%=user.getUserId()%></td>
                            <td><%=user.getUsername()%></td>
                            <td><%=user.getName()%></td>
                            <td><%=user.getEmail()%></td>
                            <td><%=user.getPassword()%></td>
                            <td><%=user.getRole()%></td>
                            <td class="remove"><a href="remove-user?id=<%=user.getUserId()%>"><button onclick="return confirm('Are you sure tou want to remove this user!')">Remove</button></a></td>
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
</body>
</html>