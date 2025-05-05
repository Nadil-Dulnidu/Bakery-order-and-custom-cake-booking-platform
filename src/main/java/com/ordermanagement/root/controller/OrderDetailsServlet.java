package com.ordermanagement.root.controller;

import com.ordermanagement.root.modal.Order;
import com.ordermanagement.root.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderId = request.getParameter("id");
        Order orders = orderService.getOrderByOrderId(orderId);

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/order-details.jsp").forward(request, response);

    }
}
