package com.project.CocktailManager.repositoryDao;

import com.project.CocktailManager.model.Cocktail;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class JdbcCocktailRepository {

    public JdbcCocktailRepository() {
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

    public List<Cocktail> getAllCocktails() {
        List<Cocktail> cocktailList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM cocktails")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Cocktail cocktail = new Cocktail(id, name);
                cocktailList.add(cocktail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cocktailList;
    }

    public Cocktail getCocktail(int id) {
        Cocktail cocktail = new Cocktail();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM cocktails WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String baseIngredient = resultSet.getString("base_ingredient");
                String additionalIngredient1 = resultSet.getString("additional_ingredient1");
                String additionalIngredient2 = resultSet.getString("additional_ingredient2");
                String additionalIngredient3 = resultSet.getString("additional_ingredient3");
                String additionalIngredient4 = resultSet.getString("additional_ingredient4");
                String additionalIngredient5 = resultSet.getString("additional_ingredient5");
                String measureBaseIngredient = resultSet.getString("measure_base_ingredient");
                String measureAdditionalIngredient1 = resultSet.getString("measure_additional_ingredient1");
                String measureAdditionalIngredient2 = resultSet.getString("measure_additional_ingredient2");
                String measureAdditionalIngredient3 = resultSet.getString("measure_additional_ingredient3");
                String measureAdditionalIngredient4 = resultSet.getString("measure_additional_ingredient4");
                String measureAdditionalIngredient5 = resultSet.getString("measure_additional_ingredient5");
                String instructions = resultSet.getString("instructions");
                String[] ingredients = {baseIngredient, additionalIngredient1, additionalIngredient2, additionalIngredient3,
                        additionalIngredient4, additionalIngredient5};
                String[] measurements = {measureBaseIngredient, measureAdditionalIngredient1, measureAdditionalIngredient2, measureAdditionalIngredient3,
                        measureAdditionalIngredient4, measureAdditionalIngredient5};
                cocktail = new Cocktail(id, name, ingredients, measurements, instructions);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cocktail;
    }

    public List<Cocktail> getCocktailByBaseIngredient(String baseIngredient){
        List<Cocktail> cocktailList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM cocktails WHERE base_ingredient = ?")) {
            preparedStatement.setString(1, baseIngredient);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int id = resultSet.getInt("id");
                String additionalIngredient1 = resultSet.getString("additional_ingredient1");
                String additionalIngredient2 = resultSet.getString("additional_ingredient2");
                String additionalIngredient3 = resultSet.getString("additional_ingredient3");
                String additionalIngredient4 = resultSet.getString("additional_ingredient4");
                String additionalIngredient5 = resultSet.getString("additional_ingredient5");
                String measureBaseIngredient = resultSet.getString("measure_base_ingredient");
                String measureAdditionalIngredient1 = resultSet.getString("measure_additional_ingredient1");
                String measureAdditionalIngredient2 = resultSet.getString("measure_additional_ingredient2");
                String measureAdditionalIngredient3 = resultSet.getString("measure_additional_ingredient3");
                String measureAdditionalIngredient4 = resultSet.getString("measure_additional_ingredient4");
                String measureAdditionalIngredient5 = resultSet.getString("measure_additional_ingredient5");
                String instructions = resultSet.getString("instructions");
                Cocktail cocktail = new Cocktail();
                cocktail.setId(id);
                cocktail.setName(name);
                cocktail.setBaseIngredient(baseIngredient);
                cocktail.setAdditionalIngredient1(additionalIngredient1);
                cocktail.setAdditionalIngredient2(additionalIngredient2);
                cocktail.setAdditionalIngredient3(additionalIngredient3);
                cocktail.setAdditionalIngredient4(additionalIngredient4);
                cocktail.setAdditionalIngredient5(additionalIngredient5);
                cocktail.setInstructions(instructions);
                cocktail.setMeasureBaseIngredient(measureBaseIngredient);
                cocktail.setMeasureAdditionalIngredient1(measureAdditionalIngredient1);
                cocktail.setMeasureAdditionalIngredient2(measureAdditionalIngredient2);
                cocktail.setMeasureAdditionalIngredient3(measureAdditionalIngredient3);
                cocktail.setMeasureAdditionalIngredient4(measureAdditionalIngredient4);
                cocktail.setMeasureAdditionalIngredient5(measureAdditionalIngredient5);
                cocktailList.add(cocktail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return cocktailList;
    }

}
