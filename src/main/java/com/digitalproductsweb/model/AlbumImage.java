package com.digitalproductsweb.model;

public class AlbumImage {
    private int id;
    private int album_id;
    private int image_id;

    // Constructor
    public AlbumImage(int id, int album_id, int image_id) {
        this.id = id;
        this.album_id = album_id;
        this.image_id = image_id;
    }
    public AlbumImage(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(int album_id) {
        this.album_id = album_id;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    @Override
    public String toString() {
        return "AlbumImage{" +
                "id=" + id +
                ", album_id=" + album_id +
                ", image_id=" + image_id +
                '}';
    }
}

