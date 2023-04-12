package com.digitalproductsweb.model;

import java.sql.Date;

public class Image {
    private int id;
    private User user;
    private String title;
    private String filePath;
    private String description;
    private double price;
    private Date createdAt;
    private Date updatedAt;

    // Constructors
    public Image() {}

    public Image(int id, User user, String title, String filePath, String description, double price, Date createdAt, Date updatedAt) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.filePath = filePath;
        this.description = description;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Image(User user, String title, String filePath, String description, double price, Date createdAt, Date updatedAt) {
        this.user = user;
        this.title = title;
        this.filePath = filePath;
        this.description = description;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Image(User user, String title, String filePath, String description, double price) {
        this.user = user;
        this.title = title;
        this.filePath = filePath;
        this.description = description;
        this.price = price;
    }

    public Image(int id, String title, String filePath, String description, double price, Date updatedAt) {
        this.id = id;
        this.title = title;
        this.filePath = filePath;
        this.description = description;
        this.price = price;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    // toString method
    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", user=" + user +
                ", title='" + title + '\'' +
                ", filePath='" + filePath + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
