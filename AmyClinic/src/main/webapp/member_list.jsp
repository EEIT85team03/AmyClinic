<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
<!-- <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/jqueryui/dataTables.jqueryui.css"> -->


 
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- jQuery UI -->
<!--  <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/jqueryui/dataTables.jqueryui.js"></script> -->
 
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table id="table_id" class="display">
    <thead>
        <tr>
            <th>mid</th>
            <th>name</th>
            <th>act_satus</th>
            <th>num_trans</th>
            <th>num_treatment</th>
            <th>num_visits</th>
            <th>total_spent</th>
            <th>last_visit</th>
            <th>join_date</th>
        </tr>
    </thead>
    <tbody>
<!--         <tr> -->
<!--             <td>Row 1 Data 1</td> -->
<!--             <td>Row 1 Data 2</td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>Row 2 Data 1</td> -->
<!--             <td>Row 2 Data 2</td> -->
<!--         </tr> -->
    </tbody>
</table>

</body>
<script type="text/javascript">
$(document).ready( function () {
   // 
    $.ajax({
    	'type':'get',
		'url':'/AmyClinic/Backstage/MemberServletTest',
		'dataType' :'json',
		"data":{"action" : "getAllJson"},
		'success':function(data){
			console.log(data);
			$('#table_id').DataTable({
				language:{search: "搜索:"},
				data: data,
				columns: [
				{ data: 'mid' },
				{ data: 'name' },
			//	{ data: 'email' },
			//	{ data: 'bday' },
			//	{ data: 'cuntry' },
			//	{ data: 'addr' },
			//	{ data: 'phone' },
			//	{ data: 'height' },
			//	{ data: 'mass' },
				{ data: 'act_satus' },
				{ data: 'num_trans' },
				{ data: 'num_treatment' },
				{ data: 'num_visits' },
				{ data: 'total_spent' },
				{ data: 'last_visit' },
				{ data: 'join_date' },
				
				          ]
			});
		}
    	
    })
    
    
    
    
    
    
} );





</script>
</html>