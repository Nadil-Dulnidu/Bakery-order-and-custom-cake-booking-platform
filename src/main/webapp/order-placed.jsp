<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Order Placed</title>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/order-placed.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <main>
        <div class="image">
            <img src="assets/images/ChatGPT%20Image%20Apr%205,%202025,%2012_25_35%20AMhhh.png" alt="Order Placed">
        </div>
        <div class="text">
            <div class="main-text">Successfully Placed Order!</div>
            <div class="sub-text">Thank you for your order!</div>
        </div>
        <div class="buttons">
            <div class="order-btn"><a href="profile.jsp"><button>View Order</button></a></div>
            <div class="catalog-btn"><a href="index.jsp"><button>Back to Home</button></a></div>
        </div>
    </main>
</body>
</html>
