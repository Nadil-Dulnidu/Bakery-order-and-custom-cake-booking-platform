package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.BubbleSort;
import com.dreamydelights.root.models.CustomCake;
import com.dreamydelights.root.services.CustomCakeService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/custom-cake-requests")
public class CustomCakeDisplayServlet extends HttpServlet {

    private final CustomCakeService customCakeService = new CustomCakeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
        }

        String sort = request.getParameter("sort");
        if(sort == null){
            sort = "normal";
        }
        request.setAttribute("sort", sort);

        String status = request.getParameter("status");
        if(status == null){
            status = "all";
        }
        request.setAttribute("status", status);

        if(sort.equals("dateAs")) {
            ArrayList<CustomCake> customCakes = BubbleSort.ascendingDate(customCakeService.displayAllOrder(status));
            request.setAttribute("customCakes", customCakes);
        }else if(sort.equals("dateDs")) {
            ArrayList<CustomCake> customCakes = BubbleSort.descendingDate(customCakeService.displayAllOrder(status));
            request.setAttribute("customCakes", customCakes);
        }else{
            ArrayList<CustomCake> customCakes = customCakeService.displayAllOrder(status);
            request.setAttribute("customCakes", customCakes);
        }

        request.getRequestDispatcher("custom-cake-requests.jsp").forward(request, response);

    }
}
