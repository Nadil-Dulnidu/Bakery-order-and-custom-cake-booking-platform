<%@ page import="java.util.List" %>
<%@ page import="com.productmanagemnt.root.model.Product" %>
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
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
    <div class="container">
        <div class="main-content">
            <div class="header-title">Products</div>
            <div class="products">
                <div class="filters">
                    <h2>Product List</h2>
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
                            <td><%=product.getProductPrice()%></td>
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
            <h2>Add New Product</h2>
            <form action="add-product" method="post" enctype="multipart/form-data">
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
</body>
</html>