package com.dreamydelights.root.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.User;

import java.io.IOException;


@WebServlet("/status-filter")
public class OrderDisplayUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        String status = request.getParameter("filter");
        request.setAttribute("status", status);

        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }
}
