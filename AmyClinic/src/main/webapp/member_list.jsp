<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.css"/>


 
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.js"></script>
<!-- jQuery UI -->
 <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/jqueryui/dataTables.jqueryui.js"></script>
 
<!-- DataTables -->
<!-- <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script> -->
<script type="text/javascript" src="https://cdn.datatables.net/u/dt/dt-1.10.12,af-2.1.2,b-1.2.1,b-colvis-1.2.1,b-print-1.2.1,cr-1.3.2,fc-3.2.2,fh-3.1.2,kt-2.1.2,r-2.1.0,rr-1.1.2,sc-1.4.2,se-1.2.0/datatables.js"></script>

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
				          ],
				          
			});
		}
    	
    })
    
    
} );

  





</script>
</html>