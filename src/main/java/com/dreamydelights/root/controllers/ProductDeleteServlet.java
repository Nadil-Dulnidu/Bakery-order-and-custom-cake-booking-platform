package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.ProductService;

import java.io.IOException;

@WebServlet("/delete-product")
public class ProductDeleteServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        if(productId != null){
            productService.deleteProduct(productId);
        }

        response.sendRedirect("/products?message=successfullyRemoved");
    }
}
