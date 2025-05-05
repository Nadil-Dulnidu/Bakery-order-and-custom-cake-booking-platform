package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.AdminService;

import java.io.IOException;

@WebServlet("/remove-user")
public class AdminRemoveUsersServlet extends HttpServlet {

    private final AdminService adminService = new AdminService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("id");
        boolean isRemoved = adminService.removeUser(userId);

        if (isRemoved) {
            response.sendRedirect("users?user+removed+successfully");
        }else{
            response.sendRedirect("users?user+remove+failed");
        }
    }
}
