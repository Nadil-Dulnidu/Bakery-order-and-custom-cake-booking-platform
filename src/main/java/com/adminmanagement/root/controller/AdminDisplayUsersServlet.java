package com.adminmanagement.root.controller;

import com.adminmanagement.root.model.User;
import com.adminmanagement.root.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/users")
public class AdminDisplayUsersServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
