<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUsersCocktailsRepository" %>
<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/fresh-cocktails-with-lime-fruit-table-generative-ai_188544-12368.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.main{
  text-align: center;
  color: white;
}
.main .table{
 color: white;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Cocktail Manager User Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
<div class="main" style="text-align: center;">
<h3 class="text-center text-white pt-5"> </h3>
<h1>🔥 Welcome to the mix! 🔥</h1>
    <%  String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(userName == null || "".equals(userName) || password == null || "".equals(password)){
           throw new ServletException("Data entered is empty");
        }
        JdbcUserRepository userRepository = new JdbcUserRepository();
        User user = userRepository.getUser(userName, password);
        if(user.getUserName() == null){
            throw new RuntimeException("User does not exist!");
        }
        int id = user.getId();
    %>
<br></br>
<h2>👋 Hello there, USER <%= user.getUserName() %></h2>
    <br></br>
    <div class="table" style="text-align: center;color:white">
    <h2><strong>🥃 Favorite Cocktails </strong></h2>
    <table border="1" class = "table w-50 p-3" style="margin: 0 auto;text-align:center;">
        <tr>
            <th>Nº</th>
            <th>Cocktail Name</th>
            <th>Start the mix</th>
            <th>Remove from Favorites</th>
        </tr>
        <% JdbcUsersCocktailsRepository userCocktailsRepository = new JdbcUsersCocktailsRepository();
           List<Cocktail> cocktailList = userCocktailsRepository.showCocktailsFromUserList(id);
           for (Cocktail cocktail : cocktailList){
        %>
        <tr>
        <td><%= cocktail.getId() %></td>
        <td><strong>🍹<%= cocktail.getName() %></strong></td>
        <td><form action ="getCocktail.jsp">
            <input type="hidden" id="userId" name="userId" value= <%= id %>>
            <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
            <input type="submit" value="🍊 Start" class="btn btn-success">
            </form>
        </td>
        <td><form action ="deleteCocktailFromUserList.jsp">
            <input type="hidden" id="userId" name="userId" value= <%= id %>>
            <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
            <input type="hidden" id="password" name="password" value= <%= password %>>
            <input type="submit" value="💣 Remove" class="btn btn-danger">
            </form>
        </td>
        </tr>
        <% } %>
    </table>
    </div>
<div>
<h2>Cocktails List</h2>
    <form action ="getAllCocktails.jsp">
    <input type="hidden" id="userId" name="userId" value= <%= id %>>
    <input type="submit" value="📋 All Cocktails" class="btn btn-primary">
    </form>
    <form action ="getCocktailByBaseIngredient.jsp">
    <input type="hidden" id="userId" name="userId" value= <%= id %>>
    <select id="cocktailBaseIngredient" name="cocktailBaseIngredient">
        <option value="Light Rum">Light Rum</option>
        <option value="Dark Rum">Dark Rum</option>
        <option value="Coconut Rum">Coconut Rum</option>
        <option value="Vodka">Vodka</option>
        <option value="Gin">Gin</option>
        <option value="Tequila">Tequila</option>
        <option value="Whiskey">Whiskey</option>
    </select>
    <input type="submit" value="Cocktail/Ingredient Search 🔍" class="btn btn-primary">
    </form>
</div>
    <br></br>
    <form action ="updateUserForm.jsp" style="text-align: center;">
    <input type="hidden" id="id" name="id" value= <%= id %>>
    <input type="submit" value="Update user 💾" class="btn btn-secondary" >
    </form>
    <br>
    </br>
</div>
    <input type="button" value="Main page 🏡" onclick="window.location='index.jsp'" class="btn btn-success">
    <input type="button" value="Back 🔙" class="btn btn-secondary" onclick="history.go(-1)" </button>
</body>
</html>

