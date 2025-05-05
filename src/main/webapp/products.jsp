<%@ page import="com.dreamydelights.root.models.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dreamydelights.root.utilities.PriceString" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Dreamy Delights">
  <title>Product</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/slider.css">
    <link rel="stylesheet" href="assets/css/admin-general.css">
    <link rel="stylesheet" href="assets/css/products.css">
    <link rel="icon" type="image/x-icon" href="icon.ico">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin-login.jsp");
    }
    List<Product> products = (List<Product>) request.getAttribute("products");
    String category = (String) request.getAttribute("category");

%>
    <div class="container">
        <div class="sidebar">
            <div class="logo">Dreamy Delights</div>
            <ul>
                <li><a href="dashboard.jsp" >
                    <div class="slide-nav-1">
                        <div><i class="ri-dashboard-line"></i></div>
                        <div><span>Dashboard</span></div>
                    </div>
                </a></li>
                <li><a href="orders">
                    <div class="slide-nav-1">
                        <div><i class="ri-shopping-cart-2-fill"></i></div>
                        <div><span>Orders</span></div>
                    </div>
                </a></li>
                <li><a href="custom-cake-requests">
                    <div class="slide-nav-1">
                        <div><i class="ri-cake-2-fill"></i></div>
                        <div><span>Custom Cakes</span></div>
                    </div>
                </a></li>
                <li><a href="products" class="active">
                    <div class="slide-nav-1">
                        <div><i class="fas fa-box"></i></div>
                        <div><span>Products</span></div>
                    </div>
                </a></li>
                <li><a href="users">
                    <div class="slide-nav-1">
                        <div><i class="ri-team-fill"></i></div>
                        <div><span>Users</span></div>
                    </div>
                </a></li>
                <li><a href="admins" >
                    <div class="slide-nav-1">
                        <div><i class="fas fa-user-shield"></i></div>
                        <div><span>Admins</span></div>
                    </div>
                </a></li>
                <li><a href="reviews">
                    <div class="slide-nav-1">
                        <div><i class="ri-star-smile-fill"></i></div>
                        <div><span>Reviews</span></div>
                    </div>
                </a></li>
            </ul>
            <div class="logout">
                <a href="admin-logout" onclick="return confirm('Are you sure you want to logout?')"><i class="fas fa-sign-out-alt"></i><span>Log out</span></a>
            </div>
        </div>
        <div class="main-content">
            <div class="header-title">Products</div>
            <div class="products">
                <div class="filters">
                    <h2>Product List</h2>
                    <div>
                        <form method="get">
                            <select id="filter" name="category">
                                <option value="all"<%="all".equalsIgnoreCase(category)?"selected":""%>>All Categories</option>
                                <option value="bread" <%="bread".equalsIgnoreCase(category)?"selected":""%>>Bread</option>
                                <option value="cake" <%="cake".equalsIgnoreCase(category)?"selected":""%>>Cake</option>
                                <option value="pastry" <%="pastry".equalsIgnoreCase(category)?"selected":""%>>Pastry</option>
                                <option class="cookie" <%="cookie".equalsIgnoreCase(category)?"selected":""%>>Cookie</option>
                                <option value="pie" <%="pie".equalsIgnoreCase(category)?"selected":""%>>Pie</option>
                                <option value="croissant" <%="croissant".equalsIgnoreCase(category)?"selected":""%>>Croissant</option>
                                <option value="dessert" <%="dessert".equalsIgnoreCase(category)?"selected":""%>>Dessert</option>
                                <option value="beverage" <%="beverage".equalsIgnoreCase(category)?"selected":""%>>beverage</option>
                            </select>
                            <button class="filter-btn" type="submit">Filter</button>
                        </form>
                        <button class="js-add-new-product">Add New Product</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>CATEGORY</th>
                            <th>PRICE</th>
                            <th>DESCRIPTION</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if(products != null){
                            for(Product product : products){
                    %>
                        <tr>
                            <td><%=product.getProductId()%></td>
                            <td><%=product.getProductName()%></td>
                            <td><%=product.getProductCategory()%></td>
                            <td><%=PriceString.StringFormat(product.getProductPrice())%></td>
                            <td><%=product.getDescription()%></td>
                            <td class="action">
                                <div><a href="edit-product?id=<%=product.getProductId()%>"><button class="edit-btn js-edit-btn" data-id="<%=product.getProductId()%>">Edit</button></a></div>
                                <div><a href="delete-product?id=<%=product.getProductId()%>"><button class="edit-btn remove">Remove</button></a></div>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal" id="addProductModal">
        <div class="modal-content">
            <span class="close js-close">&times;</span>
            <h2>Add New Product</h2>
            <form action="add-product" method="post">
                <label for="productId">Product ID</label>
                <input type="text" id="productId" name="id" placeholder="Eg. P0001" required>
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="name" placeholder="Enter product name" required>
                <label for="category">Category</label>
                <select id="category" name="category" required>
                    <option value="">Select Category</option>
                    <option value="bread">Bread</option>
                    <option value="cake">Cake</option>
                    <option value="pastry">Pastry</option>
                    <option class="cookie">Cookie</option>
                    <option value="pie">Pie</option>
                    <option value="croissant">Croissant</option>
                    <option value="dessert">Dessert</option>
                    <option value="beverage">beverage</option>
                </select>
                <label for="price">Price</label>
                <input type="number" id="price" name="price" placeholder="Enter price" step="0.01" required>
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Enter product description" required></textarea>
                <label for="productImage">Product Image</label>
                <div class="file-input-wrapper">
                    <input type="file" id="productImage" name="image" accept="image/*" required>
                    <label for="productImage" class="file-input-label">
                        <i class="fas fa-image"></i> Add Image
                    </label>
                    <span class="file-name" id="fileName">No file chosen</span>
                </div>
                <button type="submit">Add Product</button>
            </form>
        </div>
    </div>
    <script src="assets/js/products.js"></script>
</body>
</html>