<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUsersCocktailsRepository" %>
<%@ page errorPage="error.jsp"%>

<script> alert("Cocktail added, click Return and Refresh the page!") </script>
      <% JdbcUsersCocktailsRepository linkedRepository = new JdbcUsersCocktailsRepository();
         int userId = Integer.parseInt(request.getParameter("userId"));
         int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
         linkedRepository.addCocktailToUsersList(userId, cocktailId);
      %>
      <input type="button" value="Return" onclick="history.go(-3)" </button>
