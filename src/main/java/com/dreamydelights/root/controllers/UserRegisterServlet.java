package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.UserService;
import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String username = request.getParameter("uname");
        String password = request.getParameter("pwd");
        String email = request.getParameter("email");

        boolean isLengthError = userService.passwordValidation(password).contains("length");
        boolean isRegexError = userService.passwordValidation(password).contains("regex");

        if(isLengthError){
            request.setAttribute("error","Password should be at least 6 characters");
            doGet(request,response);
        }else if(isRegexError){
            request.setAttribute("error","Password must contain at least one uppercase letter and one number.");
            doGet(request,response);
        }else{
            if(userService.isUserExist(email)){
                request.setAttribute("error","Email already exist");
                doGet(request,response);
            }else{
                userService.getRegisterDetails(name, username, email, password);
                response.sendRedirect("login.jsp");
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);
    }
}
