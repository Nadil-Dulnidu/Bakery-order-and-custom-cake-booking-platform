package com.reviewmanagemnt.root.model;

public class Product {

    private String productId;
    private String productName;
    private double productPrice;
    private String description;
    private String productCategory;
    private String productImage;

    public String getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public String getDescription() {
        return description;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public String getProductImage() {
        return productImage;
    }

    public Product(String productId, String productName, double productPrice, String description, String productCategory, String productImage) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.description = description;
        this.productCategory = productCategory;
        this.productImage = productImage;
    }

    public Product() {
        super();
    }

    public Product(String productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return productId+","+productName+","+productPrice+","+description+","+productCategory+","+productImage;
    }
}
