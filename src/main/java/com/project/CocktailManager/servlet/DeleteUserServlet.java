package com.project.CocktailManager.servlet;


import com.project.CocktailManager.repository.JdbcUserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response) {
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
            int id = Integer.parseInt(request.getParameter("id"));
            try{
                jdbcUserRepository.deleteUser(id);
            } catch (Exception e){
                e.printStackTrace();
            }
        }
}
