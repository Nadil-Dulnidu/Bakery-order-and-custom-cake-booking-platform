<%@ page import="java.util.ArrayList" %>
<%@ page import="com.adminmanagement.root.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Users</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
<%
    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
    String message = (String) request.getAttribute("message");

%>
    <div class="container">
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