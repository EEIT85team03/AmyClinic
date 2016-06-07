<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.css" />

<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/jqueryui/dataTables.jqueryui.js"></script>

<!-- DataTables -->
<!-- <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script> -->
<script type="text/javascript"
	src="https://cdn.datatables.net/u/dt/dt-1.10.12,af-2.1.2,b-1.2.1,b-colvis-1.2.1,b-print-1.2.1,cr-1.3.2,fc-3.2.2,fh-3.1.2,kt-2.1.2,r-2.1.0,rr-1.1.2,sc-1.4.2,se-1.2.0/datatables.js"></script>



<title>醫生門診班表</title>
</head>
<body>
<input type="button" id="addsch" value="GO">

	<table id="table_id" class="display" width="80%" align="center">
		<thead>
			<tr>
				<th>排班編號</th>
				<th>醫師姓名</th>
				<th>門診日期</th>
				<th>預約時段</th>
				<th>預約人數</th>
				<th>門診狀態</th>
				<th>備註</th>
			</tr>
		</thead>
		<jsp:useBean id="schSvc" scope="page"
			class="group3.carrie.schedule.model.ScheduleService" />
		<c:forEach var="schVO" items="${schSvc.all}">
			<tr>
				<td>${schVO.sch_id}</td>
				<td>${schVO.employeeVO.name}</td>
				<td>${schVO.c_date}</td>
				<td>${schVO.c_hours}</td>
				<td>${schVO.appt_num}</td>
				<c:choose>
					<c:when test="${schVO.appt_status=='0' && schVO.appt_num == '3'}">
						<td style="color: blue">額滿</td>
					</c:when>
					<c:when test="${schVO.appt_status=='0' && schVO.appt_num == '0'}">
						<td style="color: red">休診</td>
					</c:when>
					<c:otherwise>
						<td>正常</td>
					</c:otherwise>

				</c:choose>
				<td>${schVO.memo}</td>
			</tr>


		</c:forEach>
	</table>


</body>
<script type="text/javascript">
	$(document).ready(function() {
		var table = $('#table_id').DataTable({
			"order": [[ 0, "desc" ]], //預設編號排序
			"columnDefs": [
			{"className": "dt-center", "targets": "_all"}
			
							             ],
 		"lengthMenu": [[10, 15, 30, 50, -1], [10, 15, 30, 50, "All"]],
 		"iDisplayLength": 10,
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
	
	$("#addsch").click(function(){
		window.location = '${pageContext.request.contextPath}/schedule/add_schedule.jsp';
		
	});
 
</script>

</html>