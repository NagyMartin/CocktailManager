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
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/colorful-cocktail-with-straw-it-rainbow-colored-liquid-background_1340-34267.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
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
<title> Cocktail Manager - Cocktails By Base Ingredient </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
<div style="text-align: center;" class="main">
<h1><strong>🥥 Delicious Cocktails 🥥</strong></h1>
    <br></br>
    <table border="1" class = "table w-50 p-3" style="margin: 0 auto;text-align:center">
        <tr>
            <th>Nº</th>
            <th>Base Ingredient</th>
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
                <td><%= cocktail.getBaseIngredient() %></td>
                <td><%= cocktail.getName() %></td>
                <td><form action ="getCocktail.jsp">
                    <input type="hidden" id="userId" name="userId" value= <%= id %>>
                    <input type="hidden" id="cocktailId" name="cocktailId" value= <%= cocktail.getId() %>>
                    <input type="submit" value="🍊Start" class="btn btn-success">
                    </form>
                </td>
            </tr>
            <% } %>
    </table>
    <br></br>
    <input type="button" value="Back 🔙" class="btn btn-secondary" onclick="history.go(-1)" </button>
</div>
</body>
</html>