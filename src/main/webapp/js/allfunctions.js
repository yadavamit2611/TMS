//ajax get request using basic javascript
function ajaxGet(url, callback) {
    var xmlDoc = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");

    xmlDoc.open('GET', url, true);

    xmlDoc.onreadystatechange = function() {
        if (xmlDoc.readyState === 4 && xmlDoc.status === 200) {
            callback(xmlDoc);
        }
    }

    xmlDoc.send();
}

sendData = () =>
{
    let amount = document.getElementById("amount").value;
    let expenses = document.getElementById("expenses").value;
    console.log(amount,expenses)
    // document.getElementById("restMonth").innerHTML = (amount/expenses).toString();
    ajaxGet("hello-servlet?"+"amount="+amount+"&expenses="+expenses,function (result)
    {
        document.getElementById("restMonth").innerHTML = result.response;
    });
}