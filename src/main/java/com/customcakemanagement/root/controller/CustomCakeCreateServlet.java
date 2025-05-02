package com.customcakemanagement.root.controller;

import com.customcakemanagement.root.service.CustomCakeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Collection;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/custom-cake-enquiry")
public class CustomCakeCreateServlet extends HttpServlet {

    private CustomCakeService customCakeService;
    private static final String uploadDirectory = "images";

    @Override
    public void init() throws ServletException {
        customCakeService = new CustomCakeService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = "example@gmail.com"; // need to get this email from the session

        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String cakeDetails = request.getParameter("cake-details");
        String BudgetDetails = request.getParameter("budget-details");
        String deliveryLocation = request.getParameter("address");
        String cakeType = request.getParameter("type");
        String userId = request.getParameter("userId");

        String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        Collection<Part> fileParts = request.getParts();
        StringBuilder uploadedFiles = new StringBuilder();

        for (Part part : fileParts) {
            if (part.getName().equals("image") && part.getSize() > 0) {
                String fileName = extractFileName(part);
                File file = new File(uploadPath, fileName);

                try (InputStream fileContent = part.getInputStream()) {
                    Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                uploadedFiles.append(fileName).append(";");
            }
        }

        boolean isSubmitted = customCakeService.createCakeOrder(userId,firstName, lastName, email, phone, date,cakeType,cakeDetails, BudgetDetails,uploadedFiles.toString(),deliveryLocation);

        if(isSubmitted){
            response.sendRedirect("index.jsp?enquiry%submitted%successfully");
        }else{
            request.setAttribute("message", "Something went wrong! Please try again");
            request.getRequestDispatcher("/custom-cake-enquiry.jsp").forward(request, response);
        }

    }
    private String extractFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "unknown";
    }
}
