<%-- <%@page import="org.apache.struts2.components.Include"%> --%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%-- <%@ taglib prefix="s"  uri="/struts-tags"  %> --%>
<%-- <%@ taglib prefix="sx" uri="/struts-dojo-tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.product.model.*"%>
<%@page import="group3.carrie.catagory.model.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:useBean id="baBean" class="group3.carrie.product.model.ProductVO" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap Core CSS -->
    <link href="css/sb-admin.css" rel="stylesheet"><!-- Custom CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet"><!-- Morris Charts CSS -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> <!-- Custom Fonts -->
    <script src="js/jquery.js"></script><!-- jQuery -->
    <script src="js/bootstrap.min.js"></script><!-- Bootstrap Core JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script><!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/morris.min.js"></script><script src="js/plugins/morris/morris-data.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper"><!-- Page Heading -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header" >本月目標<font color="red">30億</font>
                       </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">產品資料維護</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
 
 <%
 ProductVO productVO = (ProductVO) request.getAttribute("productVO");
 ProductService product = new ProductService();
 List<ProductVO> list = product.getAll();
 pageContext.setAttribute("list",list);
 
 CatagoryService cataServ  = new CatagoryService();
 List<CatagoryVO> catagorys = cataServ.getAll();
 pageContext.setAttribute("catagorys", catagorys);
%>
<%-- <%@ include file="placeJsp/page1.file" %>  --%>
<!-- <div class="form-group"> -->
 <table border="2"  bordercolor='blue'  align='center'  class="table table-hover"  >
	<tr>
		<th>照片</th>
		<th>商品編號</th>
		<th>名稱</th>
		<th>存貨</th>
		<th>價格</th>
		<th>折扣</th>
		<th>商品描述</th>
		<th>成分</th>
		<th>				  
			     <a href="product.jsp"><input type="submit" value="全部" class="btn btn-info"></a>   
		</th>
		<th>			  
			     <a href="addProduct.jsp"><input type="submit" value="新增" class="btn btn-primary"></a>    
		</th>
	</tr>
<%-- 	<c:forEach var="ProductVO"  items="${list}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
	
	<c:forEach var="ProductVO"  items="${list}"  >
		<tr>
		<td><img src="<%=request.getContextPath()%>/shopping/GetPic?num=${ProductVO.pid}" class="preview" style="max-width: 100px; max-height: 100px;"></td>
			<td>${ProductVO.pid}</td>
			<td>${ProductVO.name}</td>
			<td>${ProductVO.amount}</td>
			<td>${ProductVO.price}</td>
			<td>${ProductVO.discount}</td>
			<td>${ProductVO.descrip}</td>
			<td>${ProductVO.ingredients}</td>
<%-- 			<td>${ProductVO.photo}</td> --%>
			
<%-- 			src="<%=request.getContextPath()%>/shopping/GetPic?num=<%=productVO.getPid()%>"  --%>
<%-- 			<img src="<%=request.getContextPath()%>/shopping/GetPic?num=<%=productVO.getPid()%>" class="preview" style="max-width: 150px; max-height: 150px;"> --%>
			<td>
			  <FORM METHOD="post" ACTION="ProductServlet">
			     <input type="submit" value="修改" class="btn btn-success">
			     <input type="hidden" name="pid" value="${ProductVO.pid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="ProductServlet">
			    <input type="submit" value="刪除" class="btn btn-danger">
			    <input type="hidden" name="pid" value="${ProductVO.pid}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>

	</table>        
	<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>