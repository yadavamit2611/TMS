<%@ page import="com.example.tms.HelloServlet" %><%--
  Created by IntelliJ IDEA.
  User: thisi
  Date: 5/18/2023
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
    <link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-3.6.4.js"></script>
    <link href="css/colors/blue-dark.css" id="theme" rel="stylesheet">
    <script>
        $(document).ready(function(){
            $("#logout").click(function(){
                let operation = <%=HelloServlet.LOGOUT%>+"";
                $.get("hello-servlet?operation="+operation, function(data,status)
                    {
                        if (status === "success")
                        {
                            window.location.href = "index.jsp";
                        }
                        else
                        {
                            console.log(data);
                        }
                    }
                );
        });
        });
    </script>
</head>
<body>
<h1 id="title">Welcome to the Home Page ${user.name} and ${user.email}</h1>
<button id="logout">Logout</button>
</body>
</html>
