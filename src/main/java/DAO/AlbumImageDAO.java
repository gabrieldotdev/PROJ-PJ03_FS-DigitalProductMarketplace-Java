package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbContext.ConnectDB;
import model.AlbumImage;

public class AlbumImageDAO {
    // Create a new album image in the database
    public void createAlbumImage(AlbumImage albumImage) {
        String sql = "INSERT INTO album_image (album_id, image_id) VALUES (?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, albumImage.getAlbum_id());
            stmt.setInt(2, albumImage.getImage_id());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Retrieve a list of album images by album ID
    public List<AlbumImage> getAlbumImagesByAlbumId(int albumId) {
        List<AlbumImage> albumImages = new ArrayList<>();
        String sql = "SELECT * FROM album_image WHERE album_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, albumId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AlbumImage albumImage = mapResultSetToAlbumImage(rs);
                    albumImages.add(albumImage);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albumImages;
    }

    // Retrieve a list of album images by image ID
    public List<AlbumImage> getAlbumImagesByImageId(int imageId) {
        List<AlbumImage> albumImages = new ArrayList<>();
        String sql = "SELECT * FROM album_image WHERE image_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, imageId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AlbumImage albumImage = mapResultSetToAlbumImage(rs);
                    albumImages.add(albumImage);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return albumImages;
    }

    // Delete album images by album ID
    public void deleteAlbumImagesByAlbumId(int albumId) {
        String sql = "DELETE FROM album_image WHERE album_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, albumId);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Delete album images by image ID
    public void deleteAlbumImagesByImageId(int imageId) {
        String sql = "DELETE FROM album_image WHERE image_id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, imageId);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Map a ResultSet to an AlbumImage object
    private AlbumImage mapResultSetToAlbumImage(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int albumId = rs.getInt("album_id");
        int imageId = rs.getInt("image_id");
        return new AlbumImage(id, albumId, imageId);
    }
}
