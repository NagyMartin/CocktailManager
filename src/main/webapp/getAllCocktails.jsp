<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcCocktailRepository" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> Cocktail Manager Cocktails </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
<div style="text-align: center;">
<h1><strong>🥥 Delicious Cocktails 🥥</strong></h1>
    <br></br>
    <table border="1" class = "table table-striped table-hover w-50 p-3" style="margin: 0 auto;text-align:center">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Start the mix</th>
        </tr>
        <% JdbcCocktailRepository repository = new JdbcCocktailRepository();
            int id = Integer.parseInt(request.getParameter("userId"));
            List<Cocktail> cocktails = repository.getAllCocktails();
            for (Cocktail cocktail: cocktails){
            %>
            <tr>
                <td><%= cocktail.getId() %></td>
                <td>🍹 <%= cocktail.getName() %></td>
                <td><form action ="getCocktail.jsp">
                    <input type="hidden" id="userId" name="userId" value= <%= id %>>
                    <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
                    <input type="submit" value="🍊Start" class="btn btn-outline-success">
                    </form>
                </td>
            </tr>
            <% } %>
    </table>
</div>
</body>
</html>