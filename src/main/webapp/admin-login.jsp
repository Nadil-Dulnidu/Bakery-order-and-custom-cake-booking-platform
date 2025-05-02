<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Admin Login - Bakery Admin</title>
</head>
<body>
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
</body>
</html>