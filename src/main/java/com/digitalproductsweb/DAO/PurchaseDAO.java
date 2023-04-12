package com.digitalproductsweb.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.digitalproductsweb.dbContext.ConnectDB;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.Purchase;
import com.digitalproductsweb.model.User;

public class PurchaseDAO {
    public void createPurchase(Purchase purchase) {
        String sql = "INSERT INTO purchases (user_id, image_id, album_id, created_at) VALUES (?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, purchase.getUser().getId());
            stmt.setInt(2, purchase.getImage().getId());
            stmt.setInt(3, purchase.getAlbum().getId());
            stmt.setDate(4, new java.sql.Date(purchase.getCreated_at().getTime()));
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Retrieve a purchase by its ID
    public Purchase getPurchaseById(int id) {
        String sql = "SELECT * FROM purchases WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToPurchase(rs);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Retrieve a list of purchases by user ID
    public List<Purchase> getPurchasesByUserId(int userId) {
        List<Purchase> purchases = new ArrayList<>();
        String sql = "SELECT * FROM purchases WHERE user_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Purchase purchase = mapResultSetToPurchase(rs);
                    purchases.add(purchase);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return purchases;
    }

    // Delete a purchase from the database
    public void deletePurchase(int id) {
        String sql = "DELETE FROM purchases WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Get a list of all purchases in the database
    public List<Purchase> getAllPurchases() {
        List<Purchase> purchases = new ArrayList<>();
        String sql = "SELECT * FROM purchases";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Purchase purchase = mapResultSetToPurchase(rs);
                purchases.add(purchase);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return purchases;
    }

    // Map a ResultSet to a Purchase object
    private Purchase mapResultSetToPurchase(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int userId = rs.getInt("user_id");
        int imageId = rs.getInt("image_id");
        int albumId = rs.getInt("album_id");
        Date createdAt = rs.getDate("created_at");

        Image image = null;
        Album album = null;
        String sql = "SELECT * FROM images WHERE id = ?";
        User user = new UserDAO().getUserById(userId);
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, imageId);
            try (ResultSet rs2 = stmt.executeQuery()) {
                if (rs2.next()) {
                    int imageId2 = rs2.getInt("id");
                    int userId2 = rs2.getInt("user_id");
                    String title = rs2.getString("title");
                    String filePath = rs2.getString("file_path");
                    String description = rs2.getString("description");
                    double price = rs2.getDouble("price");
                    Date createdAt2 = rs2.getDate("created_at");
                    Date updatedAt = rs2.getDate("updated_at");
                    image = new Image(imageId2, new UserDAO().getUserById(userId2), title, filePath, description, price, createdAt2, updatedAt);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        // Get the Album object associated with the Purchase
        sql = "SELECT * FROM albums WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, albumId);
            try (ResultSet rs2 = stmt.executeQuery()) {
                if (rs2.next()) {
                    int albumId2 = rs2.getInt("id");
                    int userId2 = rs2.getInt("user_id");
                    String title = rs2.getString("title");
                    String description = rs2.getString("description");
                    double price = rs2.getDouble("price");
                    Date createdAt2 = rs2.getDate("created_at");
                    Date updatedAt = rs2.getDate("updated_at");
                    album = new Album(albumId2, new UserDAO().getUserById(userId2), title, description, price, createdAt2, updatedAt);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return new Purchase(id, user, image, album, createdAt);
    }
}
