package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.User;
import com.dreamydelights.root.services.AdminService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/users")
public class AdminDisplayUsersServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }

        ArrayList<User> users = adminService.getAllUsers();

        if(!users.isEmpty()){
            request.setAttribute("users", users);
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }else{
            request.setAttribute("message", "No users found");
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }

    }
}
