<%@ page import="com.example.tms.HelloServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="js/jquery-3.6.4.js"></script>
    <script>
        $(document).ready(function(){
            // jQuery methods go here...
            //ajax get request using jquery
            $("#login").click(function(){
                let uname = $("#uname").val();
                let password = $("#pass").val();
                let operation = <%=HelloServlet.LOGIN%>+"";
                console.log(uname,password);
                if (uname !== "" || password !== "")
                {
                    $.get("hello-servlet?uname="+uname+"&pass="+password+"&operation="+operation, function(data,status)
                        {
                            if (status === "success")
                            {
                                window.location.href = "home.jsp";
                            }
                            else
                            {
                                console.log(data);
                            }
                        }
                    );

                }else
                {
                    alert("Please enter a valid email id and password");
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
Email : <input type="text" id="uname" placeholder="Enter Username"></body><br><br>
Password : <input type="password" name="password" id="pass" placeholder="Enter password"><br><br>
<button id="login">Click Me</button>
<button id="fpassword">Forgot Password</button><br><br>
<span id="register"><u>Not Registered Yet? Click Here</u></span>
<div>${message}</div>
</body>
</html>
