package model;

import java.sql.Date;

public class Image {
    private int id;
    private int user_id;
    private String title;
    private String file_path;
    private String description;
    private double price;
    private Date created_at;
    private Date updated_at;

    // Constructor
    public Image(int id, int user_id, String title, String file_path, String description, double price, Date created_at, Date updated_at) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.file_path = file_path;
        this.description = description;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Image(int user_id, String title, String file_path, String description, double price, Date created_at, Date updated_at) {
        this.user_id = user_id;
        this.title = title;
        this.file_path = file_path;
        this.description = description;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Image(int id, String title, String file_path, String description, double price, Date updated_at) {
        this.id = id;
        this.title = title;
        this.file_path = file_path;
        this.description = description;
        this.price = price;
        this.updated_at = updated_at;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFile_path() {
        return file_path;
    }

    public void setFile_path(String file_path) {
        this.file_path = file_path;
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

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", title='" + title + '\'' +
                ", file_path='" + file_path + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
