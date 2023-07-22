<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.CocktailManager.model.Cocktail" %>
<%@ page import="com.project.CocktailManager.repository.JdbcCocktailRepository" %>
<%@ page session="true"%>
<html>
<head>
<title> Cocktail Manager Cocktails </title>
</head>
<body>
<h1>Delicious Cocktails</h1>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        <% JdbcCocktailRepository repository = new JdbcCocktailRepository();
            List<Cocktail> cocktails = repository.getAllCocktails();
            for (Cocktail cocktail: cocktails){
            %>
            <tr>
                <td><%= cocktail.getId() %></td>
                <td><%= cocktail.getName() %></td>
            </tr>
            <% } %>
    </table>
    <form action ="getCocktail.jsp" <label>Insert the cocktail ID </label>
            <div class ="form-outline mb-4">
                <input type="text" name="id" value="Cocktail ID" onclick="this.value=''"/><br/>
            </div>
        <br/>
        <input type="submit" value="Start the mix!" class="btn btn-primary btn-block"/>
        </form>
</body>
</html>