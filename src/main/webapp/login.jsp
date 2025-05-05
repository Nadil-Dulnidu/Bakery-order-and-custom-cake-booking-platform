<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Sign in</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<section class="login-container">
    <div class="login-image">
        <img src="assets/images/high-angle-shot-cheese-cupcakes-with-fruit-jelly-fruits-wooden-plate.jpg" alt="cheese-cupcakes">
    </div>
    <div class="login-section">
        <div class="login-main-title">
            <p><a href="index.jsp">Dreamy Delights</a></p>
        </div>
        <div class="login-box">
            <div class="login-form">
                <p class="login-title">Welcome Back</p>
                <p class="login-message-area">${error}</p>
                <form class="login-form" action="login" method="post">
                    <div class="login-username">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="login-password">
                        <label for="pass">Password</label>
                        <input type="password" id="pass" name="pwd" required>
                    </div>
                    <div class="login-btn">
                        <input type="submit" value="Sign in">
                    </div>
                </form>
                <p class="sign-up-btn">Don't have an account? <a href="register.jsp">Sign up</a></p>
            </div>
        </div>
    </div>
</section>
</body>
</html>
