<%@page import="org.apache.struts2.components.Include"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s"  uri="/struts-tags"  %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>-AMY-</title>
<link href="css/backstage.css" rel="stylesheet"/>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<%-- <script src="js/jquery-1.12.3.min.js"></script> --%>
<%-- <script src="js/bootstrap.min.js"></script> --%>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<s:head theme="xhtml" /><!-- 預設 -->
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
</head>

<body>
<div class="container">
<jsp:include page="placeJsp/top.jsp" /><jsp:include page="placeJsp/sidebar1.jsp" />
  <div class="content">
 <!-- 內文-->
 
 
 
 
 
 
 
 
    <!-- end . 內文 --></div>
<jsp:include page="placeJsp/footer.jsp" />
  <!-- end .container --></div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
</body>
</html>
