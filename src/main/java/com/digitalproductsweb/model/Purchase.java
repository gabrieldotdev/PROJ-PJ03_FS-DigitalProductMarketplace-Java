package com.digitalproductsweb.model;

import java.sql.Date;

public class Purchase {
    private int id;
    private User user;
    private Image image;
    private Album album;
    private Date created_at;

    // Constructors
    public Purchase() {}

    public Purchase(int id, User user, Image image, Album album, Date created_at) {
        this.id = id;
        this.user = user;
        this.image = image;
        this.album = album;
        this.created_at = created_at;
    }

    public Purchase(User user, Image image, Album album, Date created_at) {
        this.user = user;
        this.image = image;
        this.album = album;
        this.created_at = created_at;
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

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id=" + id +
                ", user=" + user +
                ", image=" + image +
                ", album=" + album +
                ", created_at=" + created_at +
                '}';
    }
}
