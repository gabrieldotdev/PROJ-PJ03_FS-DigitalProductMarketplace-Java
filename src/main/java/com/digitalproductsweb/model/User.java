package com.digitalproductsweb.model;

import java.sql.Date;

public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String phone;
    private boolean isAdmin;
    private String location;
    private Date created_at;
    private Date updated_at;

    public User() {
    }
    public User(String username, String email, String password, String phone, String location, Date created_at, Date updated_at) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.location = location;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public User(int id, String username, String email, String password, String phone, String location,Boolean isAdmin , Date created_at, Date updated_at) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.location = location;
        this.isAdmin = isAdmin;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", isAdmin=" + isAdmin +
                ", location='" + location + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
