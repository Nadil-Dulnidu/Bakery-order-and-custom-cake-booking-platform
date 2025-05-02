package com.reviewmanagemnt.root.model;

public class Review extends Product{

    private final String userId;
    private final String name;
    private final String message;
    private final double rating;
    private final String date;

    public Review(String productId, String userId, String name, String message, double rating, String date) {
        super(productId);
        this.userId = userId;
        this.name = name;
        this.message = message;
        this.rating = rating;
        this.date = date;
    }

    public String getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getMessage() {
        return message;
    }

    public double getRating() {
        return rating;
    }

    public String getDate() {
        return date;
    }
}
