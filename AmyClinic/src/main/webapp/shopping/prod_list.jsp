<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="group3.carrie.catagory.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="group3.carrie.product.model.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%
	CatagoryService cataServ = new CatagoryService();
	Set<ProductVO> products = cataServ.getProductByCid(10);
	pageContext.setAttribute("set",products);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
產品列表
1.CatagoryServlet：列出商品名稱、價格、從GetPic取出照片 ok
2.參考0203的範例做分頁+varStatus讓每三個商品排一排(九九乘法表範例)
3.從CatagoryServlet取出商品分類，做成超連結，點入後可查該分類商品 ok
4.ProductNameServlet：商品搜尋，like %?% 用Ajax做部分更新 ok
5.加入購物車的按鈕，按下後把資料存到session(一個Set?)(ShoppingServlet)，如庫存量不足則顯示存貨不足
ps.加入購物車的部分改成部分更新 OK
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物專區</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
<style>
#allpage {
	width: 1024px;
	margin: 0 auto;
}

#content {
	overflow: auto !important;
	overflow /**/: hidden;
	width: 100%;
	padding-bottom: 20px;
}

article {
	float: right;
	width: 800px;
}

aside {
	float: left;
	width: 200px;
}

.c1 {
	padding: 3px;
	width: 200px;
	height: 200px;
}

a {
	text-decoration:none;
 	color: black; 
}

</style>
</head>
<body>
	<div style="display:none" id="dialog" title="查詢結果">
		<p><b>查無資料！</b></p>

	</div>
	<div id="allpage">
		<div id="content">
			<aside>
			<a href="shopping_list.jsp">購物車</a><br> 
			<jsp:useBean id="cataSvc" scope="page"
				class="group3.carrie.catagory.model.CatagoryService" />
			<table width="800px">
				<tr>
					<td>
						<input type="text" id="search" placeholder="商品搜尋" size="10" maxlength="30">
						<input type="button" id="search_bt" value="送出">
						<input type="hidden" id="search_txt" value="getByName">
					</td>
				</tr>
				<c:forEach var="cataVO" varStatus="status" items="${cataSvc.all}">
					<tr>
						<td padding="3px">
							<a id="a" href="#" onclick="queryprod('${status.index}')">${cataVO.name}</a> 
							<input type="hidden" id="sent_id${status.index}" name="cid" value="${cataVO.cid}">
						</td>
					</tr>
				</c:forEach>
			</table>


			</aside>
			<article id="a1">
			<table id="prod">
			<!-- 剛進入本網頁時所看到的內容 -->
				<c:forEach var="prodVO" varStatus="sta" items="${set}">
					<c:if test="${sta.first}">
					<tr>
						<th align="left">
						當前類別：${prodVO.catagoryVO.name}
						<th>
					</tr>
					</c:if>
					<c:if test="${sta.index%3==0}">
						<tr>
					</c:if>
					<td>
						<%-- 					<img src="GetPic?num=${prodVO.pid}"/> --%> 
						<a href='ShowProductServlet?pid=${prodVO.pid}'>${prodVO.name}</a><br>
						${prodVO.price}元<br>
						<c:if test="${prodVO.discount != 0}">	
						打折後：<fmt:formatNumber value="${prodVO.price * ((1 - (prodVO.discount/100.0)) +0.0001)}" pattern="###"/>元<br>
						</c:if>	 
						<c:if test="${prodVO.amount!=0}">
							<input type="button" value="加入購物車" onclick="addToCart(${prodVO.pid},'${prodVO.name}',${prodVO.price})">
						</c:if> 
						<c:if test="${prodVO.amount==0}">
							<b>存貨不足</b>
						</c:if> 
						<input type="hidden" name="pid" value="${prodVO.pid}">
						<input type="hidden" name="pname" value="${prodVO.name}">
						<input type="hidden" name="price" value="${prodVO.price}">
						<input type="hidden" name="discount" value="${prodVO.discount}">
					</td>

				</c:forEach>
				</tr>
			</table>
			</article>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script>
	//依類別搜尋商品
		function queryprod(index) {
			$('#prod > tbody').empty();
			var cid = $("#sent_id" + index).val();
// 			console.log(cid);
			$.getJSON('CatagoryServlet', {"cid" : cid}, function(datas) {
				var tr = $('<tr></tr>');
				$.each(datas, function(i, data) {
					var name = data.name;
					var price = data.price;
					var id = data.pid;
					var amount = data.amount;
					var discount = data.discount;
					var td = $('<td></td>');
					
					if(i==0){
						var r = $('<tr></tr>');
						var th = $('<th align="left"></th>');
						th.append('當前類別：' + data.CatagoryName);
						r.append(th);
						$('#prod > tbody').append(r);
					}
					
// 					td.append('<img src="GetPic?num='+id+'"/><br>') //圖片還沒進db先註解起來
					td.append('<a href="ShowProductServlet?pid=' + id + '">' + name+ '</a><br>')
					  .append(price + '元<br>');
					if (discount != 0) {
						td.append('打折後：'+ Math.round(price * (1 - (discount/100.0))) + '元<br>');
					}  
					if (amount != 0) {
						  td.append('<input type="button" value="加入購物車" onclick="addToCart('+id+',\''+name+'\','+price+')">')
							.append('<input type="hidden" name="pid" value="'+id+'">')
							.append('<input type="hidden" name="pname" value="'+name+'">')
							.append('<input type="hidden" name="price" value="'+price+'">')
							.append('<input type="hidden" name="discount" value="'+discount+'">');
					} else if (amount == 0) {
						td.append('<b>存貨不足</b>');
					}
					 
					tr.append(td);
					
					if((i+1)%3==0||i==datas.length-1){
						
						$('#prod > tbody').append(tr);
						tr = $('<tr></tr>');
					}

				})
				$("#prod td").addClass('c1')
			})
		}
	
	//加入購物車
		function addToCart(pid,pname,price){
// 			var pid = $('input[name="pid"]').val();
// 			var pname = $('input[name="pname"]').val();
// 			var price = $('input[name="price"]').val();
			var discount = $('input[name="discount"]').val();
			$.ajax({
				"type":"post",
				"url":"BuyProdServlet",
				"data":{"pid" : pid, "pname" : pname, "price" : price, "discount" : discount},
				"success":function(data){
					alert("成功加入購物車！")
				}
			});
		}
		
		$(function() {
			$("#prod td").addClass('c1')
			//依商品名稱搜尋商品
			$("#search_bt").click(function(){
				$('#prod > tbody').empty();
				var byName = $('#search_txt').val();
				var prodname = $('#search').val();
				$('#search').val("");
				$.getJSON('ProductSearchServlet',{"prodname" : prodname , "action" : byName},function(datas) {
					if(datas.length==0) {
// 						$('#prod > tbody').append('<tr><td>查無資料！</td></tr>');
						$( "#dialog" ).dialog();
					}
					var tr = $('<tr></tr>');
					$.each(datas, function(i, data) {
						var name = data.name;
						var price = data.price;
						var id = data.pid;
						var amount = data.amount;
						var discount = data.discount;
						var td = $('<td></td>');
						
						if(i==0){
							var r = $('<tr></tr>');
							var th = $('<th align="left"></th>');
							th.append('您查詢的是：' + prodname);
							r.append(th);
							$('#prod > tbody').append(r);
						}	
						
						
//	 					td.append('<img src="GetPic?num='+id+'"/><br>') //圖片還沒進db先註解起來
						td.append('<a href="ShowProductServlet?pid=' + id + '">' + name+ '</a><br>')
						  .append(price + '元<br>');
						if (discount != 0) {
							td.append('打折後：'+ Math.round(price * (1 - (discount/100.0))) + '元<br>');
						}    
						if (amount != 0) {
							  td.append('<input type="submit" value="加入購物車" onclick="addToCart('+id+',\''+name+'\','+price+')">')
							 	.append('<input type="hidden" name="pid" value="'+id+'">')
								.append('<input type="hidden" name="pname" value="'+name+'">')
								.append('<input type="hidden" name="price" value="'+price+'">')
							  	.append('<input type="hidden" name="discount" value="'+discount+'">');
						} else if (amount == 0) {
							td.append('<b>存貨不足</b>');
						}
						 
						tr.append(td);
						
						if((i+1)%3==0||i==datas.length-1){
							
							$('#prod > tbody').append(tr);
							tr = $('<tr></tr>');
						}

					})
					$("#prod td").addClass('c1')
				
				})
				
			})
		})
	</script>
</body>
</html>