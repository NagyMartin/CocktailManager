<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User, com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<body>
<script> alert("User is deleted!") </script>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
                try{
                jdbcUserRepository.deleteUser(id);
                } catch (Exception e){
                        e.printStackTrace();
                }
        %>
        <input type="button" value="Return" onclick="history.go(-2)" </button>
</body>
</html>
