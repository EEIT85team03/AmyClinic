<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/Back/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("button").click(function(){
    $.getJSON("${pageContext.request.contextPath}/JsonServlet",function(result){
      $.each(result, function(i, field){
		for(var k in aaa){
			console.log(aaa[k]);
		}
      });
    });
  });
});
</script>
</head>

<body>
<button>取得JSON</button>
</body>
</html>