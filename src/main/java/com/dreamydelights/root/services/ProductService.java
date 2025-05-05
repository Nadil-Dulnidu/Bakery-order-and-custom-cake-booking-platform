package com.dreamydelights.root.services;

import com.dreamydelights.root.models.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public static final String filePath = "D:\\Java Programming\\JSP and Servlet\\Bakery Order and Custom Cake Booking\\data\\product.txt";

    //add new products to the file
    public boolean addProduct(Product product) {
        try(FileWriter fileWriter = new FileWriter(filePath,true)) {
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            bufferedWriter.write(product.toString());
            bufferedWriter.newLine();
            bufferedWriter.close();
            return true;
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return false;
    }

    //display all products
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

    //display all products by filtering
    public List<Product> displayProduct(String status) {
        List<Product> products = new ArrayList<>();
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] productData = line.split(",");
                if(productData.length == 6 && "all".equals(status)){
                    Product product = new Product(productData[0], productData[1], Double.parseDouble(productData[2]), productData[3], productData[4], productData[5]);
                    products.add(product);
                }else if(productData.length == 6 && productData[4].equalsIgnoreCase(status)){
                    Product product = new Product(productData[0], productData[1], Double.parseDouble(productData[2]), productData[3], productData[4], productData[5]);
                    products.add(product);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
            return null;
        }
        return products;
    }

    //display products by category
    public List<Product> displayProductByCategory(String category) {
        List<Product> products = new ArrayList<>();
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] productData = line.split(",");
                if(productData.length == 6 && productData[4].equalsIgnoreCase(category)){
                    Product product = new Product(productData[0], productData[1], Double.parseDouble(productData[2]), productData[3], productData[4], productData[5]);
                    products.add(product);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return products;
    }

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

    // update a select product
    public void updateProduct(Product updatedproduct){
        List<Product> products = displayProduct();
        try(PrintWriter writer = new PrintWriter(new FileWriter(filePath,false))) {
            for(Product product : products){
                if(product.getProductId().equals(updatedproduct.getProductId())){
                    writer.println(updatedproduct);
                }else{
                    writer.println(product);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
    }

    //delete a select product
    public void deleteProduct(String productId){
        List<Product> products = displayProduct();
        try(PrintWriter writer = new PrintWriter(new FileWriter(filePath,false))) {
            for(Product product : products){
                if(!product.getProductId().equals(productId)){
                    writer.println(product);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
    }
}
