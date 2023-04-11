package com.digitalproductsweb.model;

import java.sql.Date;

public class Purchase {
    private int id;
    private int user_id;
    private int image_id;
    private int album_id;
    private Date created_at;

    // Constructor

    public Purchase() {
    }

    public Purchase(int id, int user_id, int image_id, int album_id, Date created_at) {
        this.id = id;
        this.user_id = user_id;
        this.image_id = image_id;
        this.album_id = album_id;
        this.created_at = created_at;
    }

    public Purchase(int user_id, int image_id, int album_id, Date created_at) {
        this.user_id = user_id;
        this.image_id = image_id;
        this.album_id = album_id;
        this.created_at = created_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public int getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(int album_id) {
        this.album_id = album_id;
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
                ", user_id=" + user_id +
                ", image_id=" + image_id +
                ", album_id=" + album_id +
                ", created_at=" + created_at +
                '}';
    }
}
