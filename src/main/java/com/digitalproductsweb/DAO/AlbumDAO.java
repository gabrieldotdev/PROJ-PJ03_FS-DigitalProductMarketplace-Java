package com.digitalproductsweb.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.digitalproductsweb.dbContext.ConnectDB;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.User;

public class AlbumDAO {
    // Create a new album in the database
    public void createAlbum(Album album) {
        String sql = "INSERT INTO albums (user_id, title, description, price, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, album.getUser().getId());
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

    public List<Integer> getAlbumImageIds() throws SQLException {
        List<Integer> albumImageIds = new ArrayList<>();
        String sql = "SELECT image_id FROM album_images";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("image_id");
                albumImageIds.add(id);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albumImageIds;
    }
    // Get album cover image
    public Image getAlbumCoverImage(int albumId) throws SQLException{
        Image albumCoverImage  = null;
        String sql = "SELECT i.* FROM images i INNER JOIN album_images ai ON i.id = ai.image_id WHERE ai.album_id = ? LIMIT 1";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, albumId);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                int user_id = resultSet.getInt("user_id");
                String title = resultSet.getString("title");
                String filePath = resultSet.getString("file_path");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                Date created_at = resultSet.getDate("created_at");
                Date updated_at = resultSet.getDate("updated_at");
                User user = new User();
                user.setId(user_id);
                albumCoverImage = new Image(id, user, title, filePath, description, price, created_at, updated_at);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albumCoverImage;
    }
    public List<Album> getAlbumsByUserId(int userId) {
        List<Album> albums = new ArrayList<>();
        String sql = "SELECT * FROM albums WHERE user_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Album album = mapResultSetToAlbum(rs);
                    albums.add(album);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albums;
    }


    // Map a ResultSet to an Album object
    private Album mapResultSetToAlbum(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserById(rs.getInt("user_id"));
        user.setId(rs.getInt("user_id"));
        String title = rs.getString("title");
        String description = rs.getString("description");
        double price = rs.getDouble("price");
        Date created_at = rs.getDate("created_at");
        Date updated_at = rs.getDate("updated_at");
        return new Album(id, user, title, description, price, created_at, updated_at);
    }
}
