package com.project.CocktailManager.servlet;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.repository.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/getAllUsers")
public class GetAllUsersServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        JdbcUserRepository repository = new JdbcUserRepository();
        List<User> users = repository.getAllUsers();

    }
}
