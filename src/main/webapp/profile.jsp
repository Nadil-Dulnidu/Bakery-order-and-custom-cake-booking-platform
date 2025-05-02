<%@ page import="com.usermanagement.root.model.User" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        User user = (User)session.getAttribute("user");

        if(session.getAttribute("user") == null){
            response.sendRedirect("login.jsp");
            return;
        }

    %>
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
                <a href="logout"><button class="logout-btn">Log Out</button></a>
            </div>
        </section>
        <section>
            <div id="editModal" class="modal">
                <div class="modal-content">
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
</body>
</html>
