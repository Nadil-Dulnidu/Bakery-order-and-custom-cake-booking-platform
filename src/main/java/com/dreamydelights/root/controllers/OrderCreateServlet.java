package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.dreamydelights.root.models.Cart;
import com.dreamydelights.root.models.User;
import com.dreamydelights.root.services.CartService;
import com.dreamydelights.root.services.OrderService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/OrderServlet")
public class OrderCreateServlet extends HttpServlet {

    private CartService cartService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
        orderService = new OrderService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        String customerFirstName = (String) session.getAttribute("customerFirstName");
        String customerLastName = (String) session.getAttribute("customerLastName");
        String customerAddress = (String) session.getAttribute("customerAddress");
        String customerPhone = (String) session.getAttribute("customerPhone");
        String customerEmail = (String) session.getAttribute("customerEmail");
        String customerCity = (String) session.getAttribute("customerCity");
        String customerPostalCode = (String) session.getAttribute("customerPostalCode");

        ArrayList<Cart> cartArrayList = cartService.getCartItems(request);
        double totalPrice = cartService.calculateTotalPrice(cartArrayList);

        if(cartArrayList == null || cartArrayList.isEmpty() || customerAddress == null){
            response.sendRedirect("cart.jsp");
            return;
        }

        String action = request.getParameter("action");

        if(action.equalsIgnoreCase("place")){
            orderService.createOrder(userId,totalPrice,cartArrayList,customerEmail,customerFirstName,customerLastName,customerPhone,customerAddress,customerCity,customerPostalCode);
            cartService.clearCart(request);
            response.sendRedirect("order-placed.jsp");
        }else if(action.equalsIgnoreCase("cancel")){
            cartService.clearCart(request);
            response.sendRedirect("index.jsp");
        }

    }
}
