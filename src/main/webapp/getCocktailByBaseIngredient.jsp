<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcCocktailRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title> Cocktail Manager - Cocktails By Base Ingredient </title>
</head>
<body>
<h1>Delicious Cocktails</h1>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Start the mix</th>
        </tr>
        <% JdbcCocktailRepository repository = new JdbcCocktailRepository();
            int id = Integer.parseInt(request.getParameter("userId"));
            String cocktailBaseIngredient = request.getParameter("cocktailBaseIngredient");
            List<Cocktail> cocktails = repository.getCocktailByBaseIngredient(cocktailBaseIngredient);
            for (Cocktail cocktail: cocktails){
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
            </tr>
            <% } %>
    </table>
</body>
</html>