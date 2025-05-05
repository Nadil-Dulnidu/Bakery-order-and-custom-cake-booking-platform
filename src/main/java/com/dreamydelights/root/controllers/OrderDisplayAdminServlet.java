package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Queue;
import com.dreamydelights.root.services.OrderService;

import java.io.IOException;

@WebServlet("/orders")
public class OrderDisplayAdminServlet extends HttpServlet {

    private final OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }

        String status = request.getParameter("status");
        if(status == null){
            status = "all";
        }
        request.setAttribute("status", status);

        Queue queue = orderService.getAllOrders(status);
        request.setAttribute("orders", queue);
        request.getRequestDispatcher("orders.jsp").forward(request, response);

    }
}