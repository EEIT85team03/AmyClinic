<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
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

<form id="form1" name="form1" method="post" action="" onclick="return false">
  <p>姓名：
    <input type="text" name="name" id="name" />
  </p>
  <p>電話：
    <input type="text" name="phone" id="phone" />
  </p>
  <p>地址：
    <input type="text" name="address" id="address" />
  </p>
  <p>
    <input type="submit" name="button" id="button" value="送出" />
  </p>
  <script>
 $(document).ready(function(){
    $("#button").click(function(){
        if($("#name").val()==""){
            alert("你尚未填寫姓名");
            eval("document.form1['name'].focus()");       
        }else if($("#phone").val()==""){
            alert("你尚未填寫電話");
            eval("document.form1['phone'].focus()");    
        }else if($("#address").val()==""){
            alert("你尚未填寫地址");
            eval("document.form1['address'].focus()");       
        }else{
            document.form1.submit();
        }
    })
 })
</script>

</form>

</body>
</html>