<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Register</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/register.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
    <section class="reg-container">
        <div class="reg-image">
            <img src="assets/images/high-angle-shot-cheese-cupcakes-with-fruit-jelly-fruits-wooden-plate.jpg" alt="cheese-cupcakes">
        </div>
        <div class="reg-section">
            <div class="reg-main-title">
                <p><a href="index.jsp">Dreamy Delights</a></p>
            </div>
            <div class="reg-box">
                <div class="reg-form">
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
                </div>
            </div>
        </div>
    </section>
</body>
</html>
