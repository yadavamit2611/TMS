<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-3.6.4.js"></script>
    <script>
        $(document).ready(function(){
            // jQuery methods go here...
            //ajax get request using jquery
            $("#sendBtn").click(function(){
                let amount = $("#amount").val();
                let expenses = $("#expenses").val();
                console.log(amount,expenses);
                if (amount == "" || expenses == "")
                {
                    alert("Please enter proper amount and expenses");
                }
                else
                {
                    $.get("hello-servlet?"+"amount="+amount+"&expenses="+expenses, function(data, status)
                    {
                        if(status == "success")
                        {
                            $("#restMonth").html(data);
                        }
                        else
                        {
                            alert("some error occured");
                        }
                    });
                }
            });
            // send data function ends here



        });

    </script>
    <title>Balance Checker</title>
</head>
<body>
<div id="title"><h1>Balance Checker</h1></div>
<input type="number" name="amount" id="amount" placeholder="Enter the current amount">
<input type="number" name="expenses" id="expenses" placeholder="Enter monthly expenses">
<button id="sendBtn">Click Me</button>
<%--<button onclick="sendData()">Click Me</button>--%>
<p><span id="restMonth">Result will get displayed here!</span></p>
</body>
</html>