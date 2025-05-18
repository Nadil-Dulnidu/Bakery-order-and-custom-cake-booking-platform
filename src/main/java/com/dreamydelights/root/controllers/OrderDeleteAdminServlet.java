package com.dreamydelights.root.controllers;

import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.services.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-admin-order")
public class OrderDeleteAdminServlet extends HttpServlet {

    private final OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Admin admin = (Admin) session.getAttribute("admin");
        if(session.getAttribute("admin") == null){
            response.sendRedirect("/admin-login.jsp");
            return;
        }
        String orderId = request.getParameter("id");

        boolean isCancelled = orderService.cancelOrder(orderId);

        if (isCancelled) {
            response.sendRedirect("orders?message=Order%20Cancelled%20Successfully");
        } else {
            response.sendRedirect("orders?message=Order%20Cancelled%20Failed");
        }
    }
}
