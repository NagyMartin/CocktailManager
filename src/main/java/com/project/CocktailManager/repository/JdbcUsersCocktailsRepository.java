package com.project.CocktailManager.repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.project.CocktailManager.model.Cocktail;

public class JdbcUsersCocktailsRepository {
    public JdbcUsersCocktailsRepository() {
        getConnection();
    }

    public static final String JDBC_Driver = "org.postgresql.Driver";
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/cocktailDb";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "root";

    public Connection getConnection() {
        try {
            Class.forName(JDBC_Driver);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException("Cannot connect to the database" + e.getMessage());
        }
    }

    public void addCocktailToUsersList(int userID, int cocktailId) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users_cocktails (users_id, " +
                     "cocktails_id) VALUES (?, ?)")) {
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, cocktailId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean removeCocktailFromUserList(int userID, int cocktailID) {
        boolean deleteIsMade = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM users_cocktails WHERE " +
                     "users_id = ? AND cocktails_id = ?")) {
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, cocktailID);
            preparedStatement.executeUpdate();
            deleteIsMade = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleteIsMade;
    }

    public List<Cocktail> showCocktailsFromUserList(int userID) {
        List<Cocktail> cocktailList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT users_cocktails.cocktails_id, cocktails.name " +
                     "FROM users_cocktails " +
                     "JOIN cocktails ON users_cocktails.cocktails_id = cocktails.id " +
                     "WHERE users_cocktails.users_id = ? ")) {
            preparedStatement.setInt(1, userID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int cocktailID = resultSet.getInt("cocktails_id");
                String cocktailName = resultSet.getString("name");
                Cocktail cocktail = new Cocktail(cocktailID, cocktailName);
                cocktailList.add(cocktail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cocktailList;
    }
}
