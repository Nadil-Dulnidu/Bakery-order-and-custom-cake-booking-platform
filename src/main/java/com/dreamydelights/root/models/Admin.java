package com.dreamydelights.root.models;

public class Admin extends User {

    public Admin(String username, String password) {
        super(username, password, "admin");
    }

    @Override
    public String getRole() {
        return "admin";
    }
}
