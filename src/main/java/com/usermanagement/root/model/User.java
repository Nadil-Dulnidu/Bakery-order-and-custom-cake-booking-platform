package com.usermanagement.root.model;

public class User {
    private  String userId;
    private  String name;
    private  String username;
    private  String email;
    private  String password;
    private  String role;

    public String getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public User(String userId, String name, String username, String email, String password, String role) {
        this.userId = userId;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

}
