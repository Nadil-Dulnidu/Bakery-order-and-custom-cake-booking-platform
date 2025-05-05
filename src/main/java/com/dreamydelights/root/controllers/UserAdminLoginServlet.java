package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.services.UserService;

import java.io.IOException;

@WebServlet("/admin-login")
public class UserAdminLoginServlet extends HttpServlet {

    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = userService.loginAdmin(username, password);

        if(admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("dashboard.jsp");
        }else{
            request.setAttribute("error", "Invalid username or password");
            doGet(request,response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/admin-login.jsp").forward(request, response);
    }
}
