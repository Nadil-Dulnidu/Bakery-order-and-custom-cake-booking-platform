package com.ordermanagement.root.controller;

import com.ordermanagement.root.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/cancel-order")
public class OrderCancelServlet extends HttpServlet {

    private final OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderId = request.getParameter("id");

        boolean isCancelled = orderService.cancelOrder(orderId, "user123");


        if (isCancelled) {
            response.sendRedirect("profile.jsp?message=Order%20Cancelled%20Successfully");
        } else {
            response.sendRedirect("profile.jsp?message=Order%20Cancelled%20Failed");
        }

    }
}
