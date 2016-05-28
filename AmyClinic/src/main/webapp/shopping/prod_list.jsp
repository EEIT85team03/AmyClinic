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
1.CatagoryServlet：列出商品名稱、價格、從GetPic取出照片
2.做分頁+讓每三個商品排一排
3.從CatagoryServlet取出商品分類，做成超連結，點入後可查該分類商品
4.ProductNameServlet：商品搜尋，like %?% 用Ajax做部分更新
5.加入購物車的按鈕，按下後把資料存到session(ShoppingServlet)，如庫存量不足則顯示存貨不足
ps.加入購物車的部分改成部分更新
2016.05.26新增
購物系統新增直接在商品列表/商品頁面選擇數量加入購物車
庫存量在10以下時option會減少
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
<!-- 	<div style="display:none" id="dialog" title="查詢結果"> -->
<!-- 		<p><b>查無資料！</b></p> -->

<!-- 	</div> -->
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
						<img width="200px" src="GetPic?num=${prodVO.pid}"/> 
						<a href='ShowProductServlet?pid=${prodVO.pid}'>${prodVO.name}</a><br>
						<fmt:formatNumber value="${prodVO.price}" type="number"/>元<br>
						<c:if test="${prodVO.discount != 0}">	
						打折後：<fmt:formatNumber value="${prodVO.price * ((1 - (prodVO.discount/100.0)) +0.0001)}" pattern=",###"/>元<br>
						</c:if>
						<c:if test="${prodVO.amount != 0}">
							選擇數量：
							<select id="qty${prodVO.pid}">
								<c:forEach begin="1" end="10" var="theqty">
								<!-- 如果庫存量減掉theqty大於等於0才顯示選項 -->
									<c:if test="${prodVO.amount - theqty >= 0}">
							    		<option value="${theqty}">${theqty}</option>
                    				</c:if>
                    			</c:forEach>
							</select>	 
							<br>
							<input type="button" value="加入購物車" onclick="addToCart(${prodVO.pid},'${prodVO.name}',${prodVO.price})">
						</c:if> 
						<c:if test="${prodVO.amount == 0}">
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
					var tt = Math.round(price * (1 - (discount/100.0)));
					var td = $('<td></td>');
					var select = $('<select id="qty' + id + '"></select>');
					
					if(i==0){
						var r = $('<tr></tr>');
						var th = $('<th align="left"></th>');
						th.append('當前類別：' + data.CatagoryName);
						r.append(th);
						$('#prod > tbody').append(r);
					}
					
					td.append('<img width="200px" src="GetPic?num='+id+'"/><br>')
					  .append('<a href="ShowProductServlet?pid=' + id + '">' + name+ '</a><br>')
					  .append(price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元<br>');
					if (discount != 0) {
						td.append('打折後：'+ tt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元<br>');
					}  
					if (amount != 0) {
							td.append('選擇數量：');
							for(var j = 1; j <= 10; j++) {
								//如果庫存量減掉j大於等於0才顯示選項
								 if(amount - j >= 0) {
									 select.append('<option value="'+j+'">'+j+'</option>');
								 } 
							  }
						  	td.append(select)
						   	  .append('<br><input type="button" value="加入購物車" onclick="addToCart('+id+',\''+name+'\','+price+')">')
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
			var qty = $('#qty'+pid).val();
			$.ajax({
				"type":"post",
				"url":"BuyProdServlet",
				"data":{"pid" : pid, "pname" : pname, "price" : price, "discount" : discount, "qty" : qty},
				"success":function(data){
					alert("成功加入購物車！")
				},
				"error":function(data){
					alert("加入購物車失敗")
				},
			});
		}
		
		$(function() {
			$("#prod td").addClass('c1')
			//依商品名稱搜尋商品
			$("#search_bt").click(function(){
				$('#prod > tbody').empty();
				var byName = $('#search_txt').val();
				var prodname = $('#search').val();
// 				$('#search').val("");
				$.getJSON('ProductSearchServlet',{"prodname" : prodname , "action" : byName},function(datas) {
					if(datas.length==0) {
						$('#prod > tbody').append('<tr><td>查無資料！</td></tr>');
					}
					var tr = $('<tr></tr>');
					$.each(datas, function(i, data) {
						var name = data.name;
						var price = data.price;
						var id = data.pid;
						var amount = data.amount;
						var discount = data.discount;
						var tt = Math.round(price * (1 - (discount/100.0)));
						var td = $('<td></td>');
						var select = $('<select id="qty' + id + '"></select>');
						
						if(i==0){
							var r = $('<tr></tr>');
							var th = $('<th align="left"></th>');
							th.append('您查詢的是：' + prodname);
							r.append(th);
							$('#prod > tbody').append(r);
						}	
						
						
	 					td.append('<img width="200px" src="GetPic?num='+id+'"/><br>') 
						  .append('<a href="ShowProductServlet?pid=' + id + '">' + name+ '</a><br>')
						  .append(price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元<br>');
						if (discount != 0) {
							td.append('打折後：'+ tt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元<br>');
						}    
						if (amount != 0) {
							td.append('選擇數量：');
							for(var j = 1; j <= 10; j++) {
								//如果庫存量減掉j大於等於0才顯示選項
								 if(amount - j >= 0) {
									 select.append('<option value="'+j+'">'+j+'</option>');
								 } 
							  }
						   	  td.append(select)
						   	    .append('<br><input type="button" value="加入購物車" onclick="addToCart('+id+',\''+name+'\','+price+')">')
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