<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Progressbar - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#progressbar" ).progressbar({
      value: 100
    });
  });
  </script>
</head>
<body>
<img width='120' height='180' src='${pageContext.request.contextPath}/GetPic.servlet?num=1' />
 <script type="text/javascript">
 function getContextPath() { //obtains context path. EL doesn't work with separated .js
	 	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	}
 </script>
 <img class='preview' style='max-width: 100px; max-height: 100px;' src='"+getContextPath()+"\free\getprodpic?num=1"'/>
<div id="progressbar"></div>

 
</body>
</html>