<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUsersCocktailsRepository" %>
<%@ page errorPage="error.jsp"%>

<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/gourmet-seafood-pasta-cooked-indoors-with-freshness-generated-by-ai_24640-81569.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.main{
  text-align: center;
  color: white;
  margin:0 auto;
}
.btn {
  display: block;
  width: 100%;
  border: none;
  background-color: orange;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}
</style>
</head>
<div class="main">
<script> alert("Cocktail added, click Return and Refresh the page!") </script>
      <% JdbcUsersCocktailsRepository linkedRepository = new JdbcUsersCocktailsRepository();
         int userId = Integer.parseInt(request.getParameter("userId"));
         int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
         linkedRepository.addCocktailToUsersList(userId, cocktailId);
      %>
      <h3 class="text-center text-white pt-5"> </h3>
      <input type="button" class="btn" value="Return" onclick="history.go(-3)" </button>
</div>