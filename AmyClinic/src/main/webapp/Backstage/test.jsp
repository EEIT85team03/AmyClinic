<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("button").click(function(){
    $.getJSON("${pageContext.request.contextPath}/JsonServlet",function(result){
      $.each(result, function(i, field){
        $("p").append(field + " ");
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