<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repository.JdbcUserRepository" %>
<%@ page import="com.project.CocktailManager.repository.JdbcUsersCocktailsRepository" %>
<html>
<head>
<title>Cocktail Manager User Page</title>
</head>
<body>
<h1>Welcome to the mix!</h1>
    <%  JdbcUserRepository userRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userRepository.getUser(id);
        session.setAttribute("userId",id);
        %>
    <p> Hello there,
        <%= user.getUserName() %>
    </p>
    <br></br>
    <p> Favorite Cocktails </p>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
            <th>Cocktail Name</th>
            <th>Remove from Favorites</th>
        </tr>
        <% JdbcUsersCocktailsRepository userCocktailsRepository = new JdbcUsersCocktailsRepository();
           List<Cocktail> cocktailList = userCocktailsRepository.showCocktailsFromUserList(id);
           for (Cocktail cocktail : cocktailList){
        %>
        <tr>
        <td><%= cocktail.getId() %></td>
        <td><%= cocktail.getName() %></td>
        <td><input type="button" value="Remove"
            onclick=<%= userCocktailsRepository.removeCocktailFromUserList(id, cocktail.getId())%>
        </td>
        </tr>
        <% } %>
    </table>
    <br></br>
    <input type="button" value="Cocktails list!" onclick="window.location='getAllCocktails.jsp'" >
    <br>
    </br>
    <input type="button" value="Return to main page!" onclick="window.location='index.jsp'">
</body>
</html>
