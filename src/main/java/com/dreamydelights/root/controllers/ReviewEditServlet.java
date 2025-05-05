package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.ReviewService;
import com.dreamydelights.root.utilities.Date;

import java.io.IOException;

@WebServlet("/edit-review")
public class ReviewEditServlet extends HttpServlet {
    private final ReviewService reviewService = new ReviewService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String productId = request.getParameter("productId");
        String userId = request.getParameter("userId");
        String message = request.getParameter("message");
        double rating = Double.parseDouble(request.getParameter("rate"));
        String newDate = Date.getDate();

        if (productId == null || userId == null) {
            request.setAttribute("message", "something went wrong");
            request.getRequestDispatcher("product?id="+productId).forward(request, response);
        }else{
            reviewService.updateReview(productId, userId, name,message, rating,newDate);
        }
        response.sendRedirect("product?id="+productId);
    }
}

