package com.project.CocktailManager.servlet;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.repositoryDao.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JdbcUserRepository repository = new JdbcUserRepository();
        java.lang.String userName = request.getParameter("user_name");
        java.lang.String firstName = request.getParameter("first_name");
        java.lang.String lastName = request.getParameter("last_name");
        java.lang.String emailAddress = request.getParameter("email_address");
        java.lang.String password = request.getParameter("password");
        String string = String.valueOf(request.getParameter("user_type"));
        User user = new User(userName, firstName, lastName, emailAddress, password, string);
        repository.addUser(user);
        response.getOutputStream().println("User created!");
    }
}
