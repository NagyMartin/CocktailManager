<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User, com.project.CocktailManager.repository.JdbcUserRepository" %>
<%@ page session="true"%>
<html>
<head>
<title>Cocktail Manager Delete User</title>
</head>
<body>
<script> alert("User is deleted!") </script>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = (Integer)session.getAttribute("id");
                try{
                jdbcUserRepository.deleteUser(id);
                } catch (Exception e){
                        e.printStackTrace();
                }
        response.sendRedirect("index.jsp");
        %>
</body>
</html>
