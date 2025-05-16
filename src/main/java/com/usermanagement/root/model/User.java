package com.usermanagement.root.model;

public class User {
    private String userId;
    private String name;
    protected String username;
    private String email;
    protected String password;
    protected String role;

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
        return "user";
    }

    public User(String userId, String name, String username, String email, String password) {
        this.userId = userId;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = "user";
    }

    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }
}
