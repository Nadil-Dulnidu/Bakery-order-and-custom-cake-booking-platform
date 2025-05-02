package com.adminmanagement.root.controller;

import com.adminmanagement.root.model.Admin;
import com.adminmanagement.root.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-admin")
public class AdminAddAdminsServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = new Admin(userName, password);

        boolean isAdded = adminService.addNewAdmin(admin);

        if(isAdded) {
            response.sendRedirect("admins?message=Admin+Added+success");
        }else{
            response.sendRedirect("admins?message=Admin+Added+failed");
        }
    }
}
