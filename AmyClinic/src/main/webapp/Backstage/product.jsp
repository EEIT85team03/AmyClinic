<%@page import="org.apache.struts2.components.Include"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s"  uri="/struts-tags"  %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.product.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
<jsp:include page="placeJsp/top.jsp" /><jsp:include page="placeJsp/sidebar1.jsp" />
  <div class="content">
 <!-- 內文-->
 <%
 ProductService product = new ProductService();
 List<ProductVO> list = product.getAll();
 pageContext.setAttribute("list",list);
%>
<%-- <%@ include file="placeJsp/page1.file" %>  --%>
<!-- <div class="form-group"> -->
 <table border="1"  bordercolor='#CCCCFF'  align='center'  class="table table-hover"  >
	<tr>
		<th>商品編號</th>
		<th>名稱</th>
		<th>存貨</th>
		<th>價格</th>
		<th>折扣</th>
		<th>商品描述</th>
		<th>成分</th>
		<th>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet">
			     <input type="submit" value="全部" class="btn btn-info">
<%-- 			     <input type="hidden" name="pid" value="${ProductVO.pid}"> --%>
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</th>
		<th>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet">
			     <input type="submit" value="新增" class="btn btn-primary">
<%-- 			     <input type="hidden" name="pid" value="${ProductVO.pid}"> --%>
			     <input type="hidden" name="action"	value="add"></FORM>
		</th>
	</tr>
<%-- 	<c:forEach var="ProductVO"  items="${list}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
	<c:forEach var="ProductVO"  items="${list}"  >
		<tr>
			<td>${ProductVO.pid}</td>
			<td>${ProductVO.name}</td>
			<td>${ProductVO.amount}</td>
			<td>${ProductVO.price}</td>
			<td>${ProductVO.discount}</td>
			<td>${ProductVO.descrip}</td>
			<td>${ProductVO.ingredients}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet">
			     <input type="submit" value="修改" class="btn btn-success">
			     <input type="hidden" name="pid" value="${ProductVO.pid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet">
			    <input type="submit" value="刪除" class="btn btn-danger">
			    <input type="hidden" name="pid" value="${ProductVO.pid}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
	</table>
<!-- 	</div> -->
<%-- <%@ include file="placeJsp/page2.file" %>  --%>
    <!-- end .content --></div>
<jsp:include page="placeJsp/footer.jsp" />
  <!-- end .container --></div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
</body>
</html>
