package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.models.Product;
import com.dreamydelights.root.services.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet("/catalog")
public class ProductCategoryServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String category = request.getParameter("name");
        List<Product> products = productService.displayProductByCategory(category);

        request.setAttribute("category", category);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/catalog.jsp").forward(request, response);
    }

}
