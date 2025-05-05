package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.CustomCakeService;

import java.io.IOException;
@WebServlet("/update-enq-status")
public class CustomCakeStatusServlet extends HttpServlet {
    private CustomCakeService customCakeService;

    @Override
    public void init() throws ServletException {
        customCakeService = new CustomCakeService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enquiryId = request.getParameter("enquiryId");
        String status = request.getParameter("status");

        boolean isUpdated = customCakeService.changeEnquiryStatus(enquiryId,status);

        if(isUpdated){
            request.setAttribute("status", status);
            response.sendRedirect("cake-order-enquiry?cakeId="+enquiryId+"&message=Order%20Updated%20Successfully");
        }else{
            response.sendRedirect("cake-order-enquiry?cakeId="+enquiryId+"&message=Order%20Updated%20Failed");
        }

    }
}
