
package dao;

import java.sql.*;
import dto.User;

public class UserDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/fooddb";
    private final String dbUser = "root";
    private final String dbPass = "your_password";

    public boolean register(User user) {
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass)) {
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean login(User user) {
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass)) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
