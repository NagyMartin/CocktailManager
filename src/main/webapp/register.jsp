<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="error.jsp"%>

<html>
<body>
<h1>📋 Complete the below form to create a profile 📋</h1>
<p>❗️ Rows marked with an asterisk symbol(*), have conditions, press them in order to be displayed ❗️</p>
    <form action="addUser.jsp">
        <div class="form-outline mb-4">
        <input type="button" value="User Name" >
        <input type="text" name="userName" placeholder="Enter User Name" onclick="this.value=''"/><br/>
        <div class="form-outline mb-4">
        <input type="button" value="First Name*" onclick="nameCondition();" >
        <input type="text" name="firstName" placeholder="Enter First Name" onclick="this.value=''"/><br/>
        <div class="form-outline mb-4">
        <input type="button" value="Last Name*" onclick="nameCondition();" >
        <input type="text" name="lastName" placeholder="Enter Last Name" onclick="this.value=''"/><br/>
        <div class="form-outline mb-4">
        <input type="button" value="Email" >
        <input type="email" name="emailAddress" placeholder="Enter Email" onclick="this.value=''"/><br/>
        <div class="form-outline mb-4">
        <input type="button" value="Password*" onclick="passCondition();">
        <input type="password" name="password" placeholder="Enter Password" onclick="this.value=''"/><br/>
        <input type="button" value="Repeat Password*" onclick="passCondition();">
        <input type="password" name="rePassword" placeholder="Repeat Password" onclick="this.value=''"/><br/>
        <br/>
        <input type="submit" value="Create profile 🎉" class="btn btn-primary btn-block"/>
    </form>
    <input type="button" value="Return 🔙" onclick="window.location='index.jsp'">
    <script type="text/javascript">
    function passCondition() {
    alert("Password must contain: A capital(uppercase) & lowercase letter; A number; A special character. "
            + "The length should be between 5-20 characters.");
    }
    function nameCondition() {
    alert("Name must begin with a capital(uppercase) letter, Length of name must be in between 3-29 characters.");
    }
    </script>
</body>
</html>