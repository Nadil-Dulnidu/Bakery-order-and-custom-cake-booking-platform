package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.services.AdminService;

import java.io.IOException;

@WebServlet("/add-admin")
public class  AdminAddAdminsServlet extends HttpServlet {
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
