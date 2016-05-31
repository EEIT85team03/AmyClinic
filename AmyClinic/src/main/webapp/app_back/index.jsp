<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<title>預約查詢</title>
</head>
<body>
 會員編號：<input type="text" id="mid" value="">
	<input type="button" value="load" id="buttonLoad">
	
<!-- 	<table id="MemTable" class="" width="500px"> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 		<th>aid</th>  -->
<!-- 				<th>name</th> -->
<!-- 				<th>bday</th> -->
<!-- 				<th>email</th> -->
<!-- 				<th>phone </th> -->
<!-- 				<th>cuntry </th> -->
<!-- 				<th>addr </th> -->
<!-- 				<th>join_date  </th> -->
<!-- 				<th>last_visit  </th> -->
<!-- 				<th>num_trans  </th> -->
<!-- 				<th>num_visits  </th> -->
<!-- 				<th>num_treatment</th> -->
<!-- 				<th>total_spent</th> -->
<!-- 				<th>act_satus</th> -->
<!-- 				<th>mass</th> -->
<!-- 				<th>height</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- 	<tbody></tbody> -->
	
<!-- 	</table> -->
	<ul id="MemUl">
	
	</ul>
	
	
 <table id="AppTable" class="">
		<thead>
			<tr>
				<th>aid</th> 
				<th>apt_date</th> 
				<th>apt_time</th>
				<th>descrip</th>
				<th>purpose</th>
				<th>apt_status</th>
				<th>eid</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	

</body>
<script>
$(function() {
	$('#buttonLoad').click(function() {
		$('#AppTable > tbody').empty();//選擇後先清除欄位
		$('#MemUl').empty();
		var mid=$('#mid').val();
			$.get('App_BackServlet',{'action':'fmid','mid':mid},function(data){
				var json = JSON.parse(data);
				 
// 					var name = json.mem[0]["name"]; 
// 					var bday = json.mem[0]["bday"]; 
// 					var email = json.mem[0]["email"];   
// 					var phone = json.mem[0]["phone"];  
// 					var cuntry = json.mem[0]["cuntry"];  
// 					var addr = json.mem[0]["addr"];   
// 					var join_date = json.mem[0]["join_date"];   
// 					var last_visit = json.mem[0]["last_visit"];   
// 					var num_trans = json.mem[0]["num_trans"];   
// 					var num_visits = json.mem[0]["num_visits"];   
// 					var num_treatment = json.mem[0]["num_treatment"];  
// 					var total_spent = json.mem[0]["total_spent"];  
// 					var act_satus = json.mem[0]["act_satus"];  
// 					var mass = json.mem[0]["mass"];   
// 					var height = json.mem[0]["height"]; 
					
					var cell1 = $('<li></li>').text('name：'+json.mem[0]["name"]);
	 				var cell2 = $('<li></li>').text('bday：'+json.mem[0]["bday"]);
	 				var cell3 = $('<li></li>').text('email：'+json.mem[0]["email"]);
	 				var cell4 = $('<li></li>').text('phone：'+json.mem[0]["phone"]);
	 				var cell5 = $('<li></li>').text('cuntry：'+json.mem[0]["cuntry"]);
	 				var cell6 = $('<li></li>').text('addr：'+json.mem[0]["addr"]);
	 				var cell7 = $('<li></li>').text('join_date：'+json.mem[0]["join_date"]);
	 				var cell8 = $('<li></li>').text('last_visit：'+json.mem[0]["last_visit"]);
	 				var cell9 = $('<li></li>').text('num_trans：'+json.mem[0]["num_trans"]);
	 				var cell10 = $('<li></li>').text('num_visits：'+json.mem[0]["num_visits"]);
	 				var cell11 = $('<li></li>').text('num_treatment：'+json.mem[0]["num_treatment"]);
	 				var cell12 = $('<li></li>').text('total_spent：'+json.mem[0]["total_spent"]);
	 				var cell13 = $('<li></li>').text('act_satus：'+json.mem[0]["act_satus"]);
	 				var cell14 = $('<li></li>').text('mass：'+json.mem[0]["mass"]);
	 				var cell15 = $('<li></li>').text('height：'+json.mem[0]["height"]);
// 	 				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
// 						.append(cell5).append(cell6).append(cell7).append(cell8).append(cell9).append(cell10)
// 						.append(cell11).append(cell12).append(cell13).append(cell14).append(cell15);
	 				$('#MemUl').append(cell1).append(cell2).append(cell3).append(cell4)
						.append(cell5).append(cell6).append(cell7).append(cell8).append(cell9).append(cell10)
						.append(cell11).append(cell12).append(cell13).append(cell14).append(cell15);
					
				
				
			var applen= json.app.length;
			for (var i = 0; i < applen; i++) {
				 var purpose = json.app[i]["purpose"];   
				 var descrip = json.app[i]["descrip"];    
				 var apt_date = json.app[i]["apt_date"];
				 var apt_time = json.app[i]["apt_time"];
				 var eid = json.app[i]["eid"]; 
				 var aid = json.app[i]["aid"];  
				 var apt_status = json.app[i]["apt_status"];  
				 
					var cell1 = $('<td></td>').text(aid);
	 				var cell2 = $('<td></td>').text(apt_date);
	 				var cell3 = $('<td></td>').text(apt_time);
	 				var cell4 = $('<td></td>').text(descrip);
	 				var cell5 = $('<td></td>').text(purpose);
	 				var cell6 = $('<td></td>').text(apt_status);
	 				var cell7 = $('<td></td>').text(eid);
	 				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
	 						.append(cell5).append(cell6).append(cell7)
	 				$('#AppTable > tbody').append(row);
				}
				
// 				$.each(json,function(i,item){
// 				});
				
// 				return;
// 				var r= $('<input type="button" value="new button"/>');
// 		 		$.each(json,function(i,item){
		 			
// 				var cell1 = $('<td></td>').text(item.mem.mid);
// 				var cell2 = $('<td></td>').text(item.mem.name);
// 				var cell3 = $('<td></td>').text(item.mem.phone);
// 				var cell4 = $('<td></td>').text(item.mem.email);
				
				
// 				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
				
// 				$('#productTable > tbody').append(row);
//			} ) 
		})
	})})
</script>

</html>