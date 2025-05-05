package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.models.Product;
import com.dreamydelights.root.services.ProductService;

import java.io.IOException;

@WebServlet("/update-product")
public class ProductUpdateServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");
        String newProductName = request.getParameter("name");
        double newProductPrice = Double.parseDouble(request.getParameter("price"));
        String NewProductCategory = request.getParameter("category");
        String NewProductDescription = request.getParameter("description");
        String ProductImage = request.getParameter("image");

        Product updateProduct = new Product(productId,newProductName,newProductPrice,NewProductDescription,NewProductCategory,ProductImage);
        productService.updateProduct(updateProduct);

        response.sendRedirect("/products");
    }
}
