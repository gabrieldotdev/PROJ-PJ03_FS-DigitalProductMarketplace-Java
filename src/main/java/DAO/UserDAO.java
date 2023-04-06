package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbContext.ConnectDB;
import model.User;

public class UserDAO {

    // Create a new user in the database
    public void createUser(User user) {
        String sql = "INSERT INTO users (username, email, password, phone, location, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getLocation());
            stmt.setDate(6, new java.sql.Date(user.getCreated_at().getTime()));
            stmt.setDate(7, new java.sql.Date(user.getUpdated_at().getTime()));
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Retrieve a user by their ID
    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Update a user's information
    public void updateUser(User user) {
        String sql = "UPDATE users SET username = ?, email = ?, password = ?, phone = ?, location = ?, updated_at = ? WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getLocation());
            stmt.setDate(6, new java.sql.Date(user.getUpdated_at().getTime()));
            stmt.setInt(7, user.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Delete a user from the database
    public void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Get a list of all users in the database
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection con = ConnectDB.getInstance().openConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = mapResultSetToUser(rs);
                users.add(user);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    // Map a ResultSet to a User object
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String username = rs.getString("username");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String phone = rs.getString("phone");
        String location = rs.getString("location");
        Date created_at = rs.getDate("created_at");
        Date updated_at = rs.getDate("updated_at");
        return new User(id, username, email, password, phone, location, created_at, updated_at);
    }
}
