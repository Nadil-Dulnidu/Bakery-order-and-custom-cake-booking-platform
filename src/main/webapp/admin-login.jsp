<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Admin Login - Bakery Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/admin-login.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
    <div class="login-container">
        <div class="logo">Dreamy Delights</div>
        <h2>Admin Login</h2>
        <p class="error-message">${error}</p>
        <form method="post" action="admin-login">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Admin Username" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>