<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });});
  </script>
	
	
	

<title>Insert title here</title>
</head>
<body>

<p>Date: <input type="text" id="datepicker"></p>
<p>預約編號: <input type="text" id="sch_id"></p>
Doctor:<select id="eid_select">
  <option value="4">張君雅</option>
  <option value="5">史努比</option>
  <option value="6">高飛</option>
</select> <br>




 <input type="button" id="b1" value="date">
	<input type="button" value="load" id="buttonLoad">
	<table id="productTable" class="">
		<thead>
			<tr>
				<th>編號</th> 	<!--getSch_id -->
				<th>日期</th>	<!--C_date -->
				<th>醫生</th>	<!--Name -->
				<th>時段</th>	<!--C_hours -->
				<th>預約人數</th> <!--Appt_num -->
				<th>醫師狀態</th> <!--Appt_status -->
				<th>備註</th>	<!--Memo -->
				<th>修改</th>	<!--Memo -->
			</tr>
		</thead>
		<tbody></tbody>
	</table>



</body>
<script>
//讀出全部的預約
$(function() {
	$('#buttonLoad').click(function() {
		$('#productTable > tbody').empty(); //選擇後先清除欄位
			$.get('Scheduleservlet',{'action':'getall'},function(data){
				var json = JSON.parse(data);
				//console.log(json);
				var r= $('<input type="button" value="new button"/>');
		 		$.each(json,function(i,item){
		 			var status = item.Appt_status;
		 			if(status==1){status='正常'}else{status='休診'};
		 			
				var cell1 = $('<td></td>').text(item.getSch_id);
				var cell2 = $('<td></td>').text(item.C_date);
				var cell3 = $('<td></td>').text(item.Name);
				var cell4 = $('<td></td>').text(item.C_hours); 
				var cell5 = $('<td></td>').text(item.Appt_num); 
				var cell6 = $('<td></td>').text(status); 
				var cell7 = $('<td></td>').text(item.Memo); 
				var cell8 = $('<td></td>').append($('<input type="button">').val('修改'));
				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
				.append(cell5).append(cell6).append(cell7).append(cell8);
				
				$('#productTable > tbody').append(row);
			} ) 
		})
	})})
		
//照日期搜尋
$(function(){
	$('#b1').click(function(){
		date = $("#datepicker").val();
		//alert(date);
		$('#productTable > tbody').empty(); //選擇後先清除欄位
		$.get('Scheduleservlet',{'action':'bydate','date':date},function(data){
			var json = JSON.parse(data);
			$.each(json,function(i,item){
				var cell1 = $('<td></td>').text(item.getSch_id);
				var cell2 = $('<td></td>').text(item.C_date);
				var cell3 = $('<td></td>').text(item.Name);
				var cell4 = $('<td></td>').text(item.C_hours); 
				var cell5 = $('<td></td>').text(item.Appt_num); 
				var cell6 = $('<td></td>').text(item.Appt_status); 
				var cell7 = $('<td></td>').text(item.Memo); 
				
				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
				.append(cell5).append(cell6).append(cell7);
				$('#productTable > tbody').append(row);
			});
		})
	})
})
		
//搜尋
		
 
</script>


</html>