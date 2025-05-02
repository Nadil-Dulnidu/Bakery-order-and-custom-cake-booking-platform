package com.usermanagement.root.controller;

import com.usermanagement.root.model.User;
import com.usermanagement.root.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebServlet("/delete")
public class UserDeleteAccountServlet extends HttpServlet {

    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null  && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            boolean isDeleted = userService.deleteUser(user.getUserId());
            session.invalidate();

            if (isDeleted) {
                response.sendRedirect("index.jsp");
            }else{
                request.setAttribute("error", "Failed to delete account!");
                doGet(request, response);
            }
        }else {
            response.sendRedirect("login.jsp");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
