package com.reviewmanagemnt.root.controller;

import com.reviewmanagemnt.root.service.ReviewService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/delete-review")
public class ReviewDeleteServlet extends HttpServlet {

    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String productId = request.getParameter("productId");

        if(reviewService.deleteAReview(userId, productId)) {
            return;

        }else{
            request.setAttribute("message", "something went wrong");
        }

        request.getRequestDispatcher("/product?id="+productId).forward(request, response);
        response.sendRedirect("/product?id="+productId);
    }
}
