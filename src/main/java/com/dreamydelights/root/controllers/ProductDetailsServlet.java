package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.models.Product;
import com.dreamydelights.root.services.ProductService;

import java.io.IOException;

@WebServlet("/product")
public class ProductDetailsServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");
        Product product = productService.getProductById(productId);

        if(product != null){
            request.setAttribute("product", product);
            request.getRequestDispatcher("/product-card.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
