package com.project.CocktailManager.servlet;

import com.project.CocktailManager.repositoryDao.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/getUser")
public class GetUserServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        JdbcUserRepository userRepository = new JdbcUserRepository();
        String userName = request.getParameter("user_name");
        String password = request.getParameter("password");
        userRepository.getUser(userName, password);
    }
}
