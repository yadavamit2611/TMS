<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery-3.6.4.js"></script>
    <script>
        $(document).ready(function(){
            // jQuery methods go here...
            //ajax get request using jquery
            $("#login").click(function(){
                let email = $("#pemail").val();
                let password = $("#pass").val();
                console.log(email,password);
                if (email == "" || password == "")
                {
                    alert("Please enter a valid email id and password");
                }
                else
                {
                    alert("Logging in");
                }
            });

            $("#fpassword").click(function ()
            {
                alert("That's really sad");
            });

            $("#register").click(function ()
            {
                window.location.href = "register.jsp";
            });
            // send data function ends here



        });

    </script>
    <title>lOGIN | TMS</title>
</head>
<body>
<div id="title"><h1>Login | TMS</h1></div>
<%--Email : <input type="email" name="email" id="pemail" placeholder="Enter email id"></body><br><br>--%>
<%--Password : <input type="password" name="password" id="pass" placeholder="password"><br><br>--%>
<%--<button id="login">Click Me</button>--%>
<%--<button id="fpassword">Forgot Password</button><br><br>--%>
<%--<span id="register"><u>Not Registered Yet? Click Here</u></span>--%>
</body>
</html>
