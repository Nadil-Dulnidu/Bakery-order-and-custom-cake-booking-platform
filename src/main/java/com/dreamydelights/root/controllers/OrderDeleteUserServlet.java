package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.User;
import com.dreamydelights.root.services.OrderService;

import java.io.IOException;

@WebServlet("/cancel-order")
public class OrderDeleteUserServlet extends HttpServlet {

    private final OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String orderId = request.getParameter("id");

        if(user.getUserId() == null){
            response.sendRedirect("login.jsp");
            return;
        }

        boolean isCancelled = orderService.cancelOrder(orderId, user.getUserId());

        if (isCancelled) {
            response.sendRedirect("profile.jsp?message=Order%20Cancelled%20Successfully");
        } else {
            response.sendRedirect("profile.jsp?message=Order%20Cancelled%20Failed");
        }
    }
}
