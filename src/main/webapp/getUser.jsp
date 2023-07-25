<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
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
    <%  int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
        if(id == 0 || "".equals(id) || password == null || "".equals(password)){
           throw new ServletException("Data entered is empty");
        }
        JdbcUserRepository userRepository = new JdbcUserRepository();
        User user = userRepository.getUser(id, password);
        if(user.getUserName() == null){
            throw new Exception("User does not exist!");
        }
    %>
<h2> Hello there, <%= user.getUserName() %></h2>
    <br></br>
    <p> Favorite Cocktails </p>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
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
        <td><%= cocktail.getName() %></td>
        <td><form action ="getCocktail.jsp">
            <input type="hidden" id="userId" name="userId" value= <%= id %>>
            <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
            <input type="submit" value="Start!">
            </form>
        </td>
        <td><form action ="deleteCocktailFromUserList.jsp">
            <input type="hidden" id="userId" name="userId" value= <%= id %>>
            <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
            <input type="submit" value="Remove">
            </form>
        </td>
        </tr>
        <% } %>
    </table>
    <br></br>
    <form action ="getAllCocktails.jsp">
    <input type="hidden" id="userId" name="userId" value= <%= id %>>
    <input type="submit" value="Cocktail List">
    </form>
    <br>
    </br>
    <input type="button" value="Return to main page!" onclick="window.location='index.jsp'">
</body>
</html>
