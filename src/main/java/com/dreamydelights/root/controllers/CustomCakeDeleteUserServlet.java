package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.CustomCakeService;

import java.io.IOException;

@WebServlet("/delete-enquiry")
public class CustomCakeDeleteUserServlet extends HttpServlet {
    private CustomCakeService cakeDao;

    @Override
    public void init() throws ServletException {
        cakeDao = new CustomCakeService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cakeId = request.getParameter("id");

        if(cakeId != null){
            cakeDao.deleteCakeOrder(cakeId);
        }

        response.sendRedirect("/profile.jsp");
    }
}
