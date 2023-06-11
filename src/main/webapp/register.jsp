<%--
  Created by IntelliJ IDEA.
  User: thisi
  Date: 5/2/2023
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            // register data   here
            $("#registerForm").attr("autocomplete","off");
            const resetData = () =>
            {
                $("#pname").val("");
                $("#pemail").val("");
                $("#uname").val("");
                $("#pdob").val("");
                $("#pass").val("");
                $("#conpass").val("");
                $("#message").html("");
            };
//ajax get request using jquery
            let validateForm = (details) =>
            {
                if (details.name == "")
                {
                    alert("Name cannot be empty");
                    return false;
                }
                if (details.email == "")
                {
                    alert("Email cannot be empty");
                    return false;
                }
                if (details.uname == "")
                {
                    alert("User name cannot be empty");
                    return false;
                }
                if (details.dob == "")
                {
                    alert("Date of Birth cannot be empty");
                    return false;
                }
                if (details.pass == "")
                {
                    alert("Password cannot be empty");
                    return false;
                }
                if (details.conpass == "")
                {
                    alert("Confirm password field cannot be empty");
                    return false;
                }
                if (details.pass != details.conpass)
                {
                    alert("the two passwords dont match");
                    return false;
                }
                return true;
            }
            $("#register").click(function(){
                let details = {};
                details.name = $("#pname").val();
                details.email = $("#pemail").val();
                details.uname = $("#uname").val();
                details.dob = $("#pdob").val();
                details.pass = $("#pass").val();
                details.conpass = $("#conpass").val();
                if (validateForm(details))
                {
                    $.ajax({
                        url: 'RegisterServlet',
                        type: 'POST',
                        data: {"details":JSON.stringify(details)},
                        success: function(d) {
                            $("#message").html(d);
                            setTimeout(resetData,2000);
                        },
                        error: function(jqXHR,exception)
                        {
                            console.log("Error Occurred");
                        }
                    });
                }
            });
            $("#login").click(function ()
            {
                window.location.href = "index.jsp";
            });
        });

    </script>
    <title>Task Manager | Register</title>
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
                    <h2>TMS | Register</h2>
                </div>
                <form class="form-control-lg text_align_center">
                    <input type="text" id="pname" placeholder="Enter your name"><br><br>
                    <input type="email" id="pemail" placeholder="Enter your emailid"><br><br>
                    <input type="text" id="uname" placeholder="Enter new user name"><br><br>
                    <input type="date" id="pdob" placeholder="Add date of birth"><br><br>
                    <input type="password" id="pass" placeholder="Enter your password"><br><br>
                    <input type="password" name="conpass" id="conpass" placeholder="Re-confirm your password"><br><br>
                    <input id="register" type="button" value="Submit Data">
                    <input id="login" type="button" value="Login">
                </form>
                <div id="message"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
