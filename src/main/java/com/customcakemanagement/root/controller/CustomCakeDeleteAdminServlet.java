package com.customcakemanagement.root.controller;

import com.customcakemanagement.root.service.CustomCakeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-cake-enquiry")
public class CustomCakeDeleteAdminServlet extends HttpServlet {

    private CustomCakeService cakeDao;

    @Override
    public void init() throws ServletException {
        cakeDao = new CustomCakeService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cakeId = request.getParameter("cakeId");

        if(cakeId != null){
            cakeDao.deleteCakeOrder(cakeId);
        }

        response.sendRedirect("/custom-cake-enquiries");
    }
}
