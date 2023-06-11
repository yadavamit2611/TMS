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
  <title>Users</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <script src="js/jquery-3.6.4.js"></script>
  <script>
    $(function () {
      $("#users").addClass('active');
        let getAllUsers = function()
        {
          let operation = <%=HelloServlet.GET_ALL_USERS%>+"";
          $.get("hello-servlet?operation="+operation, function(data,status)
            {
              if (status === "success")
              {
                let users = JSON.parse(data);
                console.log(users,users.length);
                let table = $("#tableData"); // Assuming you have a table with id "myTable"
                for (let i = 0; i < users.length; i++) {
                  let row = $("<tr></tr>"); // Create a new table row
                  console.log(users[i].name,users[i].email,users[i].dob);
                  // Create table data cells and populate with array values
                  let name = $("<td></td>").text(users[i].name);
                  let email = $("<td></td>").text(users[i].email);
                  let dob = $("<td></td>").text(users[i].dob);

                  // Append cells to the row
                  row.append(name);
                  row.append(email);
                  row.append(dob);

                  // Append row to the table
                  table.append(row);
                }
              }
              else
              {
                console.log("failed to get users data");
              }
            }
          );
        };
        getAllUsers();

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
        $(".hamburger a").click(function() {
          $("body").toggleClass("active");
        });
      $("#picture").attr("src","images/clint.jpg");
    });
  </script>
</head>
<body>
<jsp:include page="include/sidebar.jsp"></jsp:include>
<div class="main-content">
  <table id="tableData" border="1">
    <tr>
      <th>Name</th>
      <th>EmailId</th>
      <th>DOB</th>
    </tr>
  </table>
</div>
</body>
</html>
