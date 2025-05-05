package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Review;
import com.dreamydelights.root.models.User;
import com.dreamydelights.root.services.ReviewService;
import com.dreamydelights.root.utilities.Date;

import java.io.IOException;
@WebServlet("/submit-review")
public class ReviewSubmitServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("user") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double rate = Double.parseDouble(request.getParameter("rate"));
        String message = request.getParameter("message");

        String date = Date.getDate();

        Review review = new Review(id,user.getUserId(),name,message,rate,date);

        if(!reviewService.isExistingReview(id, user.getUserId())){
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
