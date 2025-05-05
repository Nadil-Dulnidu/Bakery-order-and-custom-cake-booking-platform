<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamydelights.root.models.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Admins</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/admins.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }
    ArrayList<Admin> admins = (ArrayList<Admin>) request.getAttribute("admins");
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
                <li><a href="users" >
                    <div class="slide-nav-1">
                        <div><i class="ri-team-fill"></i></div>
                        <div><span>Users</span></div>
                    </div>
                </a></li>
                <li><a href="admins" class="active">
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
            <div class="header-title">Admins</div>
            <div class="admins">
                <div class="filters">
                    <h2>Admin List</h2>
                    <div>
                        <button onclick="openModal()">Add New Admin</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>USERNAME</th>
                            <th>PASSWORD</th>
                        </tr>
                    </thead>
                    <tbody>
                    <p><%=message != null? message : ""%></p>
                    <%
                        if(admins != null){
                            for (Admin admin : admins){
                    %>
                        <tr>
                            <td><%=admin.getUsername()%></td>
                            <td><%=admin.getPassword()%></td>
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
    <div class="modal" id="addAdminModal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Add New Admin</h2>
            <form action="add-admin" method="post">
                <label for="adminUsername">Admin Username</label>
                <input type="text" id="adminUsername" name="username" placeholder="Enter admin username" required>

                <label for="adminPassword">Password</label>
                <input type="password" id="adminPassword" name="password" placeholder="Enter password" required>

                <button type="submit">Add Admin</button>
            </form>
        </div>
    </div>
    <script src="assets/js/admins.js"></script>
</body>
</html>