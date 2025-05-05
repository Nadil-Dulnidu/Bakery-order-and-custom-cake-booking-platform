package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.models.CustomCake;
import com.dreamydelights.root.services.CustomCakeService;

import java.io.IOException;

@WebServlet("/cake-order-enquiry")
public class CustomCakeDetailsServlet extends HttpServlet {
    private CustomCakeService customCakeService;

    @Override
    public void init() throws ServletException {
        customCakeService = new CustomCakeService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cakeId = request.getParameter("cakeId");
        CustomCake cake = customCakeService.getCakeOrderById(cakeId);

        if(cake != null){
            request.setAttribute("cake", cake);
            request.getRequestDispatcher("/custom-cake-request-details.jsp").forward(request, response);
        }
    }
}
