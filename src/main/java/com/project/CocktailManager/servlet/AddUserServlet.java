package com.project.CocktailManager.servlet;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.repository.JdbcUserRepository;
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
        String userName = request.getParameter("user_name");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String emailAddress = request.getParameter("email_address");
        String password = request.getParameter("password");
        User user = new User(userName, firstName, lastName, emailAddress, password);
        repository.addUser(user);
        response.getOutputStream().println("User created!");
    }
}
