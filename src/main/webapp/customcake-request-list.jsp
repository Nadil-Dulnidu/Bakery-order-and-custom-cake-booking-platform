<%@ page import="com.customcakemanagement.root.modal.CustomCake" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.customcakemanagement.root.service.CustomCakeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="cus-cake-container">
    <%
        CustomCakeService customCakeService = new CustomCakeService();
        ArrayList<CustomCake> customCake = customCakeService.displayAllOrder();
        if(customCake != null && !customCake.isEmpty()){
            for(CustomCake cake : customCake){
    %>
    <div class="enquiry-box">
        <div class="cake-details">
            <div>
                <span>Enquiry Number:</span>
                <span><%=cake.getCakeId()%></span>
            </div>
            <div>
                <span>Delivery to:</span>
                <span><%=cake.getDeliveryLocation()%></span>
            </div>
            <div>
                <span>Delivery Date:</span>
                <span><%=cake.getDate()%></span>
            </div>
            <div>
                <span>Enquiry Status:</span>
                <span><%=cake.getEnquiryStatus()%></span>
            </div>
        </div>
        <div class="enquiry-order-cancel">
            <%if("Pending".equalsIgnoreCase(cake.getEnquiryStatus())){ %>
            <a href="" onclick="return confirm('Are you sure you want cancel this enquiry?')" class="cancel-link">Cancel Enquiry</a>
            <%}else{%>
            <p class="cannot-cancel-msg">Enquiry cannot be cancelled</p>
            <%}%>
        </div>
    </div>
    <%
        }
    }else{
    %>
    <p>Empty Enquiries</p>
    <%
        }
    %>
</div>
</body>
</html>
