package com.productmanagemnt.root.controller;

import com.productmanagemnt.root.model.Product;
import com.productmanagemnt.root.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductDisplayAdminServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String category = request.getParameter("category");
        if(category == null){
            category = "all";
        }
        request.setAttribute("category", category);

        List<Product> products = productService.displayProduct(category);
        request.setAttribute("products", products);

        RequestDispatcher rd1 = request.getRequestDispatcher("/products.jsp");
        rd1.forward(request, response);
    }
}
