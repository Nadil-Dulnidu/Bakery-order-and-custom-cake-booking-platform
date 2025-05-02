<%@ page import="com.customcakemanagement.root.modal.CustomCake" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Dreamy Delights">
  <title>Custom Cake Details</title>

</head>
<body>
<%
    CustomCake cake = (CustomCake) request.getAttribute("cake");
%>
    <div class="container">
        <div class="main-content">
            <div class="header-title">Request Details</div>
            <div class="breadcrumb">
                <a href="custom-cake-requests">Custom Cake Requests</a> / <%=cake != null ? cake.getFirstName()+" "+cake.getLastName():""%>
            </div>
            <%
                if(cake != null){
            %>
            <div class="details">
                <div class="section">
                    <h2>Customer Information</h2>
                    <p><strong>Name:</strong> <%=cake.getFirstName()%> <%=cake.getLastName()%></p>
                    <p><strong>Email:</strong> <%=cake.getEmail()%></p>
                    <p><strong>Phone:</strong> <%=cake.getPhone()%></p>
                </div>

                <div class="section">
                    <h2>Cake Details</h2>
                    <p><strong>Type:</strong> <%=cake.getCakeType()%></p>
                    <p><strong>Details:</strong> <%=cake.getCakeDetails()%></p>
                    <p><strong>Budget:</strong> <%=cake.getBudgetDetails()%></p>
                    <%
                        if (cake.getImagePath() != null && !cake.getImagePath().isEmpty()) {
                            for (String image : cake.getImagePath().split(";")) {
                    %>
                        <div class="customer-image">
                            <img src="images/<%=image%>" alt="Cake Image">
                        </div>
                    <%
                        }
                    } else {
                    %>
                        <p>No images uploaded</p>
                    <%
                        }
                    %>
                </div>

                <div class="section">
                    <h2>Order Information</h2>
                    <p><strong>Request Date:</strong> May 28, 2023</p>
                    <p><strong>Location: </strong> <%=cake.getDeliveryLocation()%></p>
                </div>

                <div class="section">
                    <h2>Actions</h2>
                    <div class="actions">
                        <form action="update-enq-status" method="post">
                            <input type="hidden" name="enquiryId" value="<%=cake.getCakeId()%>">
                            <select  name="status" id="status">
                                <option value="pending" <%=cake.getEnquiryStatus().equalsIgnoreCase("pending")? "selected": ""%>>Pending</option>
                                <option value="Reviewed" <%=cake.getEnquiryStatus().equalsIgnoreCase("reviewed")? "selected": ""%>>Reviewed</option>
                                <option value="awaiting" <%=cake.getEnquiryStatus().equalsIgnoreCase("awaiting")? "selected": ""%>>Awaiting Customer Response</option>
                                <option value="processing" <%=cake.getEnquiryStatus().equalsIgnoreCase("processing")? "selected": ""%>>Processing</option>
                                <option value="completed" <%=cake.getEnquiryStatus().equalsIgnoreCase("completed")? "selected": ""%>>Completed</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                        <button class="contact" type="submit">Remove</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>