<%@ page import="java.util.ArrayList" %>
<%@ page import="com.adminmanagement.root.model.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Admins</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<%
    ArrayList<Admin> admins = (ArrayList<Admin>) request.getAttribute("admins");
    String message = (String) request.getAttribute("message");
%>
    <div class="container">
        <div class="main-content">
            <div class="header-title">Admins</div>
            <div class="admins">
                <div class="filters">
                    <h2>Admin List</h2>
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
</body>
</html>