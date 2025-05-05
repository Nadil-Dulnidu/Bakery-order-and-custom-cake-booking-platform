package com.ordermanagement.root.service;

import com.ordermanagement.root.modal.Product;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public static final String filePath = "D:\\Java Programming\\Cruds\\order-management\\data\\product.txt";

    //get product details by id
    public Product getProductById(String productId) {
        List<Product> products = displayProduct();
        for (Product product : products) {
            if (product.getProductId().equals(productId)) {
                return product;
            }
        }
        return null;
    }

    public List<Product> displayProduct() {
        List<Product> products = new ArrayList<>();
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] productData = line.split(",");
                if(productData.length == 6){
                    Product product = new Product(productData[0], productData[1], Double.parseDouble(productData[2]), productData[3], productData[4], productData[5]);
                    products.add(product);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return products;
    }
}
