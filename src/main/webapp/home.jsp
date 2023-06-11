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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <script src="js/jquery-3.6.4.js"></script>
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
            let hamburger = document.querySelector(".hamburger");
            hamburger.addEventListener("click", function(){
                document.querySelector("body").classList.toggle("active");
            })
            $("#picture").attr("src","images/clint.jpg");
            $("home").addClass('active');
        });
    </script>
</head>
<body>
<jsp:include page="include/sidebar.jsp"></jsp:include>
</body>
</html>
