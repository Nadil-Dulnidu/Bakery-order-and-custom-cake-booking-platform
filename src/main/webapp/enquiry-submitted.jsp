<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Enquiry Submitted</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/general.css">
    <link rel="stylesheet" href="assets/css/enquiry-submitted.css">
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
        <div><img src="assets/images/ChatGPT%20Image%20Apr%207,%202025,%2007_54_16%20PM.png" alt="image"></div>
        <div>Thanks for your Request</div>
        <div>Our manager will get back to you today to clarify the details</div>
        <div><a href="index.jsp"><button>Go To Home</button></a></div>
    </main>
</body>
</html>
