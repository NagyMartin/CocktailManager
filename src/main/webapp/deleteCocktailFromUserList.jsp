<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUsersCocktailsRepository" %>
<%@ page errorPage="error.jsp"%>

      <% JdbcUsersCocktailsRepository linkedRepository = new JdbcUsersCocktailsRepository();
         int userId = Integer.parseInt(request.getParameter("userId"));
         int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
         linkedRepository.removeCocktailFromUserList(userId, cocktailId);
      %>