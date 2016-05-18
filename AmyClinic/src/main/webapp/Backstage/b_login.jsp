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
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<s:head theme="xhtml" /><!-- 預設 -->
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
<style type="text/css">

</style>
</head>

<body>

<div class="container" align="center" >
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

    <s:form action="LoginActionEmp"  namespace="/emplogpage">
	  <s:textfield name="Employees.eid" label="員工編號" value="1" />
<!--       編號<input type="text" name="eid" id="text1"> -->
      <s:textfield name="Employees.name" label="員工姓名" value="Dr. Pocky" />
<!--       姓名<input type="text" name="name" id="text2"> -->
    <s:submit value="確定"  method="LoginServiceEmp"/>
    </s:form>
    <a href="#">忘記密碼</a>
    <br>
    <a>EX==>id=1,name=Dr. Pocky</a>
    
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
