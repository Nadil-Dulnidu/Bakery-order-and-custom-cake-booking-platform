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

@WebServlet("/update")
public class UserEditAccountServlet extends HttpServlet {

    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("user") != null) {

            User oldUser = (User) session.getAttribute("user");

            String newName = request.getParameter("name");
            String newUserName = request.getParameter("uname");
            String newPassword = request.getParameter("pwd");

            boolean isLengthError = userService.passwordValidation(newPassword).contains("length");
            boolean isRegexError = userService.passwordValidation(newPassword).contains("regex");

            if(isLengthError){
                request.setAttribute("error","Password should be at least 6 characters");
                doGet(request,response);
            }else if(isRegexError){
                request.setAttribute("error","Password must contain at least one uppercase letter and one number.");
                doGet(request,response);
            }else{

                boolean isUpdated = userService.updateUser(oldUser.getEmail(), newName, newUserName, newPassword);

                if (isUpdated) {
                    User updateUser = new User(oldUser.getUserId(), newName, newUserName, oldUser.getEmail(), newPassword);
                    session.setAttribute("user", updateUser);
                    response.sendRedirect("profile.jsp?success=Account updated successfully!");
                }else{
                    request.setAttribute("error", "Failed to update account.");
                    doGet(request, response);
                }
            }

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
