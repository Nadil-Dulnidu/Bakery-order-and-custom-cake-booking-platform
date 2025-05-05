package com.dreamydelights.root.models;

public class CustomCake {
    private final String cakeId;
    private final String userId;
    private final String firstName;
    private final String lastName;
    private final String email;
    private final String phone;
    private final String date;
    private final String cakeType;
    private final String cakeDetails;
    private final String budgetDetails;
    private final String enquiryStatus;
    private final String imagePath;
    private final String deliveryLocation;

    public CustomCake(String cakeId,String userId, String firstName, String lastName, String email, String phone, String date, String cakeType, String cakeDetails, String budgetDetails, String enquiryStatus, String imagePath, String deliveryLocation) {
        this.userId = userId;
        this.cakeId = cakeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.date = date;
        this.cakeType = cakeType;
        this.cakeDetails = cakeDetails;
        this.budgetDetails = budgetDetails;
        this.enquiryStatus = enquiryStatus;
        this.imagePath = imagePath;
        this.deliveryLocation = deliveryLocation;
    }

    public String getCakeId() {
        return cakeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getDate() {
        return date;
    }

    public String getCakeDetails() {
        return cakeDetails;
    }

    public String getBudgetDetails() {
        return budgetDetails;
    }

    public String getEnquiryStatus() {
        return enquiryStatus;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getDeliveryLocation() {
        return deliveryLocation;
    }

    public String getCakeType() {
        return cakeType;
    }

    public String getUserId() {
        return userId;
    }
}
