package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.services.AdminService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admins")
public class AdminDisplayAdminsServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }

        ArrayList<Admin> admins = adminService.getAllAdmins();

        if(admins.isEmpty()){
            request.setAttribute("message", "No Admins Found");
            request.getRequestDispatcher("admins.jsp").forward(request, response);
        }else{
            request.setAttribute("admins", admins);
            request.getRequestDispatcher("admins.jsp").forward(request, response);
        }
    }
}
