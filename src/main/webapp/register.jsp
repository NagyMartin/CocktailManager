<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="error.jsp"%>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="login">
    <h3 class="text-center text-white pt-5"></h3>
        <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
        <div id="login-column" class="col-md-6">
        <div id="login-box" class="col-md-12">
            <form action="addUser.jsp" id="login-form" class="form">
                <h1 class="text-center text-info">📋Register📋</h1>
                <p style="text-align: center;"> Rows marked with an asterisk symbol(*), have conditions, press them in order to be displayed </p>
                <div class="form-group">
                    <input type="button" value="User Name" >
                    <input type="text" name="userName" placeholder="Enter User Name" class="form-control" onclick="this.value=''"/>
                </div>
                <div class="form-group">
                    <input type="button" value="First Name*" onclick="nameCondition();" >
                    <input type="text" name="firstName" placeholder="Enter First Name" onclick="this.value=''"/>
                </div>
                <div class="form-group">
                    <input type="button" value="Last Name*" onclick="nameCondition();" >
                    <input type="text" name="lastName" placeholder="Enter Last Name" onclick="this.value=''"/>
                </div>
                <div class="form-group">
                    <input type="button" value="Email" >
                    <input type="email" name="emailAddress" placeholder="Enter Email" onclick="this.value=''"/>
                </div>
                <div class="form-group">
                    <input type="button" value="Password*" onclick="passCondition();">
                    <input type="password" name="password" placeholder="Enter Password" onclick="this.value=''"/>
                </div>
                <div class="form-group">
                    <input type="button" value="Repeat Password*" onclick="passCondition();">
                    <input type="password" name="rePassword" placeholder="Repeat Password" onclick="this.value=''"/>
                </div>
            <br/>
            <input type="submit" value="Create profile 🎉" class="btn btn-primary btn-block"/>
            </form>
        </div>
    </div>
    </div>
    </div>
</div>
    <input type="button" value="Return 🔙" onclick="window.location='index.jsp'">

	</body>
</html>
    <script type="text/javascript">
    function passCondition() {
    alert("Password must contain: A capital(uppercase) & lowercase letter; A number; A special character. "
            + "The length should be between 5-20 characters.");
    }
    function nameCondition() {
    alert("Name must begin with a capital(uppercase) letter, Length of name must be in between 3-29 characters.");
    }
    </script>