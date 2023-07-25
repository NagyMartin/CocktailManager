package com.project.CocktailManager.servlet;


import com.project.CocktailManager.model.User;
import com.project.CocktailManager.repository.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
        try {
            User user = jdbcUserRepository.getUser(id, password);
            String userName = request.getParameter("user_name");
            String emailAddress = request.getParameter("email_address");
            user.setUserName(userName);
            user.setEmailAddress(emailAddress);
            jdbcUserRepository.updateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
