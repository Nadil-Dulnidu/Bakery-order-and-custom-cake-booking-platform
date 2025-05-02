package com.productmanagemnt.root.controller;

import com.productmanagemnt.root.model.Product;
import com.productmanagemnt.root.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/edit-product")
public class ProductGetEditServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        Product product = productService.getProductById(productId);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("update-product.jsp").forward(request, response);
        }else{
            response.sendRedirect("/products.jsp?message=Product-not-found");
        }
    }
}
