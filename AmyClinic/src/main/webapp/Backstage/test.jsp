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
<button id='bt'>SpaToSalesServlet</button>
<!-- <button>JsonServlet</button> -->
<table border="1px"  class="table table-hover"  id="firstTable">	
		<tr>
			<th width="100px" >年</th>
			<th width="100px">月</th>
			<th width="100px">科</th>
			<th width="100px">次</th>
		</tr>
	
		<tbody></tbody>
		</table>
		<p id=info ></p>


<div></div>


<script type="text/javascript">
$(document).ready(function(){
  $("#bt").click(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(data){
    	var o=' ';
    	$.each(data, function(k, a){
//     		$.each(this, function(){
    			o += '<p>'+a.a+'年'+a.b+'月'+a.c+'科'+a.d+'次'+'</p><hr>';
    			
    		});
//     	});
    	$('#info').html(o);
    	//我們可以透過.length得知其中的物件數
//     	var NumOfData = data.length; //Num Of data=3
//      	//或是用下面的的方法呼叫，
//     	//這個範例比較適合用在物件陣列中的鍵值數量、及名稱的不同的時候
//     	//除非是特殊需求，不然應該是不會有人這麼做
//     	for (var i = 0; i < NumOfData; i++) {
//     	  for (var k in data[i]) {
//     	    //以本例而言，自然分別會是：name、age、height
//     	  document.writeln(JData[i][k].Tooltip);
//     	  }
//     	}
//     	var items = [];
//     	$.each(data, function(key, val){
//     		document.writeln(i[0]);
//     		document.writeln(jsonString[0]);
//     		items.push( "<li id='" + key + "'>" + val + "</li>" );
    	 
// for(var k in jsonString) {
// 	console.log(k);
// 	console.log(jsonString[k]);
// 	console.log('1');
	
// 	document.writeln("key="+k);
// 	document.writeln("月"	   +jsonString[k]);
	
	
// 	var cell1 = $("<td width='150px' ></td>").text(k.jsonString[k]);
// 	var row = $("<tr></tr>").append(cell1);
// 	$("#firstTable>tbody").append(row); 
// }
})
}
		)
		}
	)
// 	});	
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