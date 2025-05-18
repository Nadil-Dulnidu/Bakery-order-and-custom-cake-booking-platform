package com.dreamydelights.root.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.dreamydelights.root.models.Product;
import com.dreamydelights.root.services.ProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet("/add-product")
public class ProductAddServlet extends HttpServlet {
    //image upload file path
    private static final String uploadDirectory = "assets/images";
    private final ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");
        String productName = request.getParameter("name");
        double productPrice = Double.parseDouble(request.getParameter("price"));
        String productDescription = request.getParameter("description");
        String productCategory = request.getParameter("category");

        //Get the upload folder path
        String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;

        //create directory is it doesn't path
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        //Get the upload file
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;

        //save the file
        filePart.write(filePath);

        //create image path
        String imagePath = uploadDirectory + "/" + fileName;

        Product product = new Product(productId, productName, productPrice, productDescription, productCategory, imagePath);
        boolean success = productService.addProduct(product);

        if (success) {
            response.sendRedirect("products?message=Product+added+successfully");
        }else{
            request.setAttribute("error", "Something went wrong! Please try again.");
            doGet(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/products.jsp").forward(request, response);
    }
}
