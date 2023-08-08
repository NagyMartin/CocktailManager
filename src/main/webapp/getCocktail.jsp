<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcCocktailRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/cocktail-with-lime-lemon-mint-freshness-generative-ai_188544-12148.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
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
    <div class="main" style="text-align: center;">
<h1><strong> 🌴 <%= cocktail.getName() %> 🌴 </strong></h1>
<br>
</br>
    <table border="1" class = "table w-50 p-3" style="margin: 0 auto;text-align:center;">
        <tr>
            <th>🍸 Ingredient </th>
            <th>📐 Measurement in order of ingredient </th>
            <th>😎 Looking good! </th>
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
            <td>
                <img src=<%= cocktail.getCocktailImage()%> height="150" width="150">
            </td>
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
      <input type="submit" value="Add to favorites!🌟" class="btn btn-success">
    </form>
    <br>
    </br>
    <input type="button" value="Back 🔙" class="btn btn-secondary" onclick="history.go(-1)" </button>
    </div>
</body>
</html>