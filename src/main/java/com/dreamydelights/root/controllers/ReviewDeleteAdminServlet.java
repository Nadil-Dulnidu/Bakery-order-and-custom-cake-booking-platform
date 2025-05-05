package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dreamydelights.root.services.ReviewService;

import java.io.IOException;

@WebServlet("/review-delete")
public class ReviewDeleteAdminServlet extends HttpServlet {
    private final ReviewService reviewService = new ReviewService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("uid");
        String productId = request.getParameter("pid");

        if(reviewService.deleteAReview(userId, productId)) {
            response.sendRedirect("reviews?message=delete+success");
        }else{
            response.sendRedirect("reviews?message=delete+failure");
        }
    }
}
