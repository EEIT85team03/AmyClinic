<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s"  uri="/struts-tags"  %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title>-AMY-${requestScope.empVO.name}您好</title>
<link href="css/backstage.css" rel="stylesheet"/>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<s:head theme="xhtml" /><!-- 預設 -->
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />

</head>

<body>

<div class="container">
 <jsp:include page="placeJsp/top.jsp" /><jsp:include page="placeJsp/sidebar1.jsp" />
  
  <div class="content">
    <h1 align="center"  style="color: blue">AMY</h1>
    
<script type="text/javascript">
    var d = new Date();
    var theYear = d.getFullYear()-1911;
    var theMonth = d.getMonth()+1;
    var theDate = d.getDate();
    
    document.write("民國"+theYear+"年"+theMonth+"月"+theDate+"日");
</script>

    <hr>
員工編號=${requestScope.empVO.eid}
<br>
員工姓名=${requestScope.empVO.name}
<hr>
    
    <div align="center">
      
    </div>
    <!-- end .content --></div>
<jsp:include page="placeJsp/footer.jsp" />
  <!-- end .container --></div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
</body>
</html>
