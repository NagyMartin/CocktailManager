<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUsersCocktailsRepository" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page errorPage="error.jsp"%>

      <% JdbcUsersCocktailsRepository linkedRepository = new JdbcUsersCocktailsRepository();
         int userId = Integer.parseInt(request.getParameter("userId"));
         int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
         linkedRepository.removeCocktailFromUserList(userId, cocktailId);
         JdbcUserRepository userRepo = new JdbcUserRepository();
         String password = request.getParameter("password");
         User user = userRepo.getUserByID(userId);
         String userName = user.getUserName();
         String userType = user.getUserType();
      %>

      <meta http-equiv="Refresh" content="0; url=/CocktailManager/getAdmin.jsp?userName=<%= userName %>&password=<%= password %>" />