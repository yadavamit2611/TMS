<%@ page import="com.example.tms.HelloServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- awesome fontfamily -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
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
    <title>TMS LOGIN</title>
</head>
<body>
<div class="contact">
    <div class="log-container">
        <div class="row ">
            <div class="col-lg-6 flex-column">
                <img src="images/login.jpg" alt="login image" height="100%" width="100%">
            </div>
            <div class="col-lg-6 flex-column">
            <div class="titlepage h2 text-center">
                <h2><i class="fa fa-home"></i> TMS Login</h2>
            </div>
            <form class="form-control-lg text_align_center">
            <input type="text" id="uname" placeholder="Enter Username"><br><br>
            <input type="password" name="password" id="pass" placeholder="Enter password"><br><br>
            <input type="button" id="login" value="Click Me">
            <input type="button" id="fpassword" value="Forgot Password"><br><br>
            <span id="register"><u>Not Registered Yet? Click Here</u></span>
            </form>
            <div>${message}</div>
        </div>
    </div>
</div>
</div>
</body>
</html>
