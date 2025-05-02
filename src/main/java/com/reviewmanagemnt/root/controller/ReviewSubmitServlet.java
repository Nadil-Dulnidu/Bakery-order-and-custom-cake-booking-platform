package com.reviewmanagemnt.root.controller;

import com.reviewmanagemnt.root.model.Review;
import com.reviewmanagemnt.root.service.ReviewService;
import com.reviewmanagemnt.root.utility.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/submit-review")
public class ReviewSubmitServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double rate = Double.parseDouble(request.getParameter("rate"));
        String message = request.getParameter("message");

        String userId = "user-123"; // this id must get from the session
        String date = Date.getDate();

        Review review = new Review(id,userId,name,message,rate,date);

        if(!reviewService.isExistingReview(id, userId)){
            if(!reviewService.saveFeedback(review)) {
                System.out.println("Something went wrong");
            }else{
                System.out.println("Review saved");
            }
        }else{
            System.out.println("review already exists");
        }
        response.sendRedirect("/product?id="+id);
    }
}
