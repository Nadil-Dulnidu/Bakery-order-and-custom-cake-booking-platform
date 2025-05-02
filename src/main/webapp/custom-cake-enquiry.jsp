<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Dreamy Delights">
    <title>Dreamy Delights | Custom Cake Enquiry</title>
</head>
<body>
<main>
    <div class="main-title">Custom Cake Enquiry</div>
    <form action="custom-cake-enquiry" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="<%="user-123"%>"> <%-- need to get seesion user id --%>
        <div class="input-1 input">
            <div>
                <label for="fname">First Name <span class="star">*</span></label><br>
                <input type="text" name="fname" id="fname" required>
            </div>
            <div>
                <label for="lname">Last Name <span class="star">*</span></label><br>
                <input type="text" name="lname" id="lname" required>
            </div>
        </div>
        <div class="input">
            <label for="phone">Phone Number <span class="star">*</span></label><br>
            <input type="tel" name="phone" id="phone" required>
        </div>
        <div class="input">
            <label for="address">Delivery Location <span class="star">*</span></label><br>
            <input type="text" name="address" id="address" required>
        </div>
        <div class="date input">
            <label for="date">Date Needed <span class="star">*</span></label><br>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="date input">
            <label for="type">What type of Cake <span class="star">*</span></label><br>
            <input type="text" id="type" name="type" placeholder="Eg. Birthday Cake" required>
        </div>
        <div class="input">
            <label for="textarea">Tell us what you are after! <span class="star">*</span></label><br>
            <textarea placeholder="Give us details..." name="cake-details" id="textarea"></textarea>
        </div>
        <div class="input">
            <label for="text">Do you have a budget you would like us to work within? <span class="star">*</span></label><br>
            <input type="text" id="text" name="budget-details" required>
        </div>
        <div class="image-upload">
            <label for="file">Add Images</label>
            <input type="file" id="file" name="image" multiple accept="image/*">
        </div>
        <div class="btn">
            <button class="submit-btn" type="submit">Submit</button>
        </div>
    </form>
</main>
</body>
</html>