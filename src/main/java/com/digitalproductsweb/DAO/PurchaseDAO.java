package com.digitalproductsweb.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.digitalproductsweb.dbContext.ConnectDB;
import com.digitalproductsweb.model.Purchase;
public class PurchaseDAO {
    public void createPurchase(Purchase purchase) {
        String sql = "INSERT INTO purchases (user_id, image_id, album_id, created_at) VALUES (?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, purchase.getUser_id());
            stmt.setInt(2, purchase.getImage_id());
            stmt.setInt(3, purchase.getAlbum_id());
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
        return new Purchase(id, userId, imageId, albumId, createdAt);
    }

}
