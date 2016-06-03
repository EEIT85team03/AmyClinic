<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/Backstage/js/jquery.js"></script>
<script>
$(document).ready(function(){
    $("button").click(function(){
    	 $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(result){
            $.each(result, function(i, field){
                $("div").append(field + " ");
            });
        });
    });
});
</script>
</head>
<body>
<button id='bt'>取得JSON</button>
<table border="1px"  class="table table-hover"  id="firstTable">	
		<tr>
			<th width="150px" >會員名稱</th>
			<th width="200px">被評分員工</th>
			<th width="100px">分數</th>
			<th width="400px">留言</th>
			<th width="200px">最後新增修改的日期</th>
			<th width="100px">狀態欄</th>
			<th width="75px">確認修改</th>
		</tr>
	
		<tbody></tbody>
		</table>
		<p id=p ></p>

<button>Get JSON data</button>
<div></div>


<script type="text/javascript">
$(document).ready(function(){
  $("#bt").click(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(data){
    	var items = [];
    	$.each(data, function(key, val){
    		document.writeln(i[0]);
    		document.writeln(jsonString[0]);
    		items.push( "<li id='" + key + "'>" + val + "</li>" );
    	 
for(var k in jsonString) {
	console.log(k);
	console.log(jsonString[k]);
	console.log('1');
	
	document.writeln("key="+k);
	document.writeln("月"	   +jsonString[k]);
	
	
	var cell1 = $("<td width='150px' ></td>").text(k.jsonString[k]);
	var row = $("<tr></tr>").append(cell1);
	$("#firstTable>tbody").append(row); 
}
})
}
		)
		}
	)
	});	
// 	$("#st"+i).val(scoreVO.St);
// 	$("#st"+i).change(function(){
// 		var x=$("#st"+i).val();
// 		$("#stt"+i).val(x);
// 	});												  
// }
// })	;
// }   ; 
//       });
//     });
//   });
// });
</script>
</body>
</html>