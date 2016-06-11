<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
</head>
<script >
function ale()
{
    alert("演示一");
}
function firm()
{// （true 或者 false）
    if(confirm("你確定?"))
    {
        location.href="http://thcjp.cnblogs.com";
    }
    else
    {
        alert("你按了取消false");
    }
}
function prom()
{
    var name=prompt("您的名字","");
    
    if(name)
    {
        alert("歡迎："+ name)
    }
}
</script>
</head>

<body>

<p>演示一：</p>
<p>
  <input type="submit" name="Submit" value="提交" onclick="ale()" />
</p>
<p>演示二 ： </p>
<p>
  <input type="submit" name="Submit2" value="提交" onclick="firm()" />
</p>
<p>演示三 ：</p>
<p>
  <input type="submit" name="Submit3" value="提交" onclick="prom()" />
</p>
</body>
</html>