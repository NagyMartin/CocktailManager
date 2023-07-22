package com.project.CocktailManager.servlet;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.repository.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/getUser")
public class GetUserServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        JdbcUserRepository userRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        userRepository.getUser(id);
    }
}
