package com.dreamydelights.root.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Product;
import com.dreamydelights.root.services.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductDisplayAdminServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }

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
