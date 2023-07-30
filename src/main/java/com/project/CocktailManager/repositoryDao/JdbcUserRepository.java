package com.project.CocktailManager.repositoryDao;

import com.project.CocktailManager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JdbcUserRepository {
    public JdbcUserRepository() {
        getConnection();
    }

    public static final java.lang.String JDBC_Driver = "org.postgresql.Driver";
    private static final java.lang.String DB_URL = "jdbc:postgresql://localhost:5432/cocktailDb";
    private static final java.lang.String DB_USER = "postgres";
    private static final java.lang.String DB_PASSWORD = "root";

    public Connection getConnection() {
        try {
            Class.forName(JDBC_Driver);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException("Cannot connect to the database" + e.getMessage());
        }
    }

    public void addUser(User user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users " +
                     "(user_name, first_name, last_name, email_address, password, user_type) VALUES (?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getFirstName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getEmailAddress());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, "USER");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUser(String userName, String password) {
        User user = new User();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE user_name = ? AND password = ?")) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String emailAddress = resultSet.getString("email_address");
                String userType = resultSet.getString("user_type");
                user.setId(id);
                user.setUserName(userName);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmailAddress(emailAddress);
                user.setPassword(password);
                user.setUserType(userType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByID(int id) {
        User user = new User();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String emailAddress = resultSet.getString("email_address");
                String password = resultSet.getString("password");
                String userType = resultSet.getString("user_type");
                user.setUserName(userName);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmailAddress(emailAddress);
                user.setPassword(password);
                user.setUserType(userType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("user_name");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String emailAddress = resultSet.getString("email_address");
                String password = resultSet.getString("password");
                String userType = resultSet.getString("user_type");
                User user = new User(id, userName, firstName, lastName, emailAddress, password, userType);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public boolean updateUser(User user) {
        boolean updateIsMade = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET user_name = ?, " +
                     "email_address = ?, password = ? WHERE id = ?")) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getEmailAddress());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
            updateIsMade = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updateIsMade;
    }
    public boolean updateUserTypeByAdmin(User user) {
        boolean updateIsMade = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET user_type = ? WHERE id = ?")) {
            preparedStatement.setString(1, user.getUserType());
            preparedStatement.setInt(2, user.getId());
            preparedStatement.executeUpdate();
            updateIsMade = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updateIsMade;
    }

    public boolean deleteUser(int id) {
        boolean deleteIsMade = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE from users WHERE id =?")) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            deleteIsMade = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleteIsMade;
    }
}
