<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcCocktailRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> Cocktail Manager - Cocktail Detail </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
    <%
    JdbcCocktailRepository repository = new JdbcCocktailRepository();
    int userId = Integer.parseInt(request.getParameter("userId"));
    int cocktailId = Integer.parseInt(request.getParameter("cocktailId"));
    String password = request.getParameter("password");
    Cocktail cocktail = repository.getCocktail(cocktailId);
    String[] ingredients = cocktail.getIngredients();
    String[] measurements = cocktail.getMeasurements();
    %>
    <div style="text-align: center;">
<h1><strong> 🌴 <%= cocktail.getName() %> 🌴 </strong></h1>
<br>
</br>
    <table border="1" class = "table table-striped table-hover w-50 p-3" style="margin: 0 auto;text-align:center">
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
      <input type="submit" value="Add to favorites!🌟" class="btn btn-outline-success">
    </form>
    <br>
    </br>
    <form action ="getAllCocktails.jsp">
    <input type="hidden" id="userId" name="userId" value= <%= userId %>>
    <input type="submit" value="Return 🔙" class="btn btn-outline-secondary">
    </form>
    </div>
</body>
</html>