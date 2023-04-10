package com.digitalproductsweb.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.digitalproductsweb.dbContext.ConnectDB;
import com.digitalproductsweb.model.Album;

public class AlbumDAO {
    // Create a new album in the database
    public void createAlbum(Album album) {
        String sql = "INSERT INTO albums (user_id, title, description, price, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, album.getUser_id());
            stmt.setString(2, album.getTitle());
            stmt.setString(3, album.getDescription());
            stmt.setDouble(4, album.getPrice());
            stmt.setDate(5, new java.sql.Date(album.getCreated_at().getTime()));
            stmt.setDate(6, new java.sql.Date(album.getUpdated_at().getTime()));
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Retrieve an album by its ID
    public Album getAlbumById(int id) {
        String sql = "SELECT * FROM albums WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToAlbum(rs);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Update an album's information
    public void updateAlbum(Album album) {
        String sql = "UPDATE albums SET title = ?, description = ?, price = ?, updated_at = ? WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, album.getTitle());
            stmt.setString(2, album.getDescription());
            stmt.setDouble(3, album.getPrice());
            stmt.setDate(4, new java.sql.Date(album.getUpdated_at().getTime()));
            stmt.setInt(5, album.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Delete an album from the database
    public void deleteAlbum(int id) {
        String sql = "DELETE FROM albums WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Get a list of all albums in the database
    public List<Album> getAllAlbums() {
        List<Album> albums = new ArrayList<>();
        String sql = "SELECT * FROM albums";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Album album = mapResultSetToAlbum(rs);
                albums.add(album);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albums;
    }

    // Map a ResultSet to an Album object
    private Album mapResultSetToAlbum(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int userId = rs.getInt("user_id");
        String title = rs.getString("title");
        String description = rs.getString("description");
        double price = rs.getDouble("price");
        Date created_at = rs.getDate("created_at");
        Date updated_at = rs.getDate("updated_at");
        return new Album(id, userId, title, description, price, created_at, updated_at);
    }
}
