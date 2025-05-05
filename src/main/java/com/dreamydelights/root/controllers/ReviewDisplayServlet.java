package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.BubbleSort;
import com.dreamydelights.root.models.Review;
import com.dreamydelights.root.services.ReviewService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/reviews")
public class ReviewDisplayServlet extends HttpServlet {

    private final ReviewService reviewService = new ReviewService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session.getAttribute("admin") == null){
            resp.sendRedirect("admin-login.jsp");
        }

        String sort = req.getParameter("sort");
        if(sort == null){
            sort = "normal";
        }
        req.setAttribute("sort", sort);

        if(sort.equals("normal")) {
            ArrayList<Review> reviews = reviewService.displayReviews();
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("reviews.jsp").forward(req, resp);
        }else if(sort.equals("rateAs")){
            ArrayList<Review> reviews = BubbleSort.ascendingRate(reviewService.displayReviews());
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("reviews.jsp").forward(req, resp);
        }else if(sort.equals("rateDs")){
            ArrayList<Review> reviews = BubbleSort.descendingRate(reviewService.displayReviews());
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("reviews.jsp").forward(req, resp);
        }



    }
}
