<%@page import="group3.carrie.app.model.AppService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/datatables.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<!-- all -->
		<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
		 <script type="text/javascript"	src="<%=request.getContextPath()%>/js/datatables.js"></script>
       <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>


		<div id="page-wrapper" style="background-color: #000000">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i><font
								color="red" style="text-align: center;">產品資料維護</font></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!--側邊欄功能表項目over -->
		<!-- 開始 -->


		<table border="1" class="table table-hover" id="apptable">
		<thead>
			<tr>
				<th>aid</th>
				<th>mname</th>
				<th>ename</th>
				<th>apt_date</th>
				<th>apt_time</th>
				<th>descrip</th>
				<th>apt_status</th>
				<th>取消預約</th>

			</tr>
			</thead>
			<jsp:useBean id="AppSvc" scope="page"
				class="group3.carrie.app.model.AppService" />
			<c:forEach var="AppVO" items="${AppSvc.all}">
				<tr>
					<td>${AppVO.aid}</td>
					<td>${AppVO.memberVO.name}</td>
					<td>${AppVO.employeeVO.name}</td>
					<td>${AppVO.apt_date}</td>
					<td>${AppVO.apt_time}</td>
					<td>${AppVO.descrip}</td>
					<c:choose>
						<c:when test="${AppVO.apt_status==1}">
							<td>正常</td>
						</c:when>
						<c:otherwise>
							<td style="color:red">取消</td>
						</c:otherwise>
					</c:choose>
					<td>
					<form action="app_check" method="get">
					<input type="submit" value="取消" >
					<input type="hidden" name="action" value="appcancel">
					<input type="hidden" name="aid" value="${AppVO.aid}">
					
					</form>
					
					</td>
					</tr>
			</c:forEach>
			
			

		</table>





	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		var table = $('#apptable').DataTable({
			"order": [[ 0, "desc" ]], //預設編號排序
			"columnDefs": [
			{"className": "dt-center", "targets": "_all"}
			
							             ],
 		"lengthMenu": [[10, 15, 30, 50, -1], [10, 15, 30, 50, "All"]],
 		"iDisplayLength": 15,
//  		dom: 'Bfrtip',
//  		buttons: [
// 		            {
// 		                text: '新增排班',
// 		                action: function ( e, dt, node, config ) {
// 		                    alert( 'Button activated' );
// 		                }
// 		            }
// 		        ],
			
			
			
		})
	})
	
 
	</script>
</body>
</html>