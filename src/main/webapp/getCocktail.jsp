<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcCocktailRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title> Cocktail Manager - Cocktail Detail </title>
</head>
<body>
    <%
    JdbcCocktailRepository repository = new JdbcCocktailRepository();
    int userId = Integer.parseInt(request.getParameter("userId"));
    int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
    Cocktail cocktail = repository.getCocktail(cocktailId);
    String[] ingredients = cocktail.getIngredients();
    String[] measurements = cocktail.getMeasurements();
    %>
<h1> 🌴 <%= cocktail.getName() %> 🌴 </h1>
<br>
</br>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>🍸 Ingredient </th>
            <th>📐 Measurement in order of ingredient </th>
        </tr>
        <tr>
            <td>
            <%  for (String ingredient : ingredients)
                     if(ingredient!=null){
                     out.print(" 🍹 " + ingredient + ". ");
                }
            %></td>
            <td>
            <% for (String measurement : measurements)
                    if(measurement!=null){
                    out.print(" ⚖️ " + measurement + ". ");
               }
            %></td>
        </tr>
    </table>
    <br>
    </br>
    <h2> Follow the below instructions to build the cocktail 👀</h2>
    <p> <%= cocktail.getInstructions() %> </p>
    <br>
    </br>
    <form action ="addCocktailToUserList.jsp">
      <input type="hidden" id="userId" name="userId" value= <%= userId %>>
      <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktailId %>>
      <input type="submit" value="Add to favorites!🌟">
    </form>
    <br>
    </br>
    <form action ="getAllCocktails.jsp">
    <input type="hidden" id="userId" name="userId" value= <%= userId %>>
    <input type="submit" value="Back to list!🔙">
    </form>
</body>
</html>