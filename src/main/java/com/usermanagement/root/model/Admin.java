package com.usermanagement.root.model;

public class Admin extends User {

    public Admin(String username, String password) {
        super(username, password, "admin");
    }

    @Override
    public String getRole() {
        return "admin";
    }
}
