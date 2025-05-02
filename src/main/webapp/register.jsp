<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Register</title>
</head>
<body>
    <p class="reg-title">Create an Account</p>
    <p class="reg-message-area">${error}</p>
    <form class="reg-form" action="register" method="post">
        <div class="reg-name">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" placeholder="John Doe" required>
        </div>
        <div class="reg-username">
            <label for="uname">Username</label>
            <input type="text" id="uname" name="uname" placeholder="john_doe" required>
        </div>
        <div class="reg-email">
            <label for="email">Email Address</label>
            <input type="email" name="email" id="email" placeholder="example@gmail.com" required>
        </div>
        <div class="reg-password">
            <label for="pass">Password</label>
            <input type="password" id="pass" name="pwd" placeholder="password" required>
        </div>
        <div class="reg-btn">
            <input type="submit" value="Create Account">
        </div>
    </form>
    <p class="sign-in-btn">Already have an account? <a href="login.jsp">Sign in</a></p>
</body>
</html>
