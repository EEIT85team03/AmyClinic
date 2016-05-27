<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%
	//避免瀏覽器對文件的快取
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
1.從session內把商品名稱、數量、單價、小計(數量*單價)拿出
2.修改按鈕(修改後更新數量、小計，如果庫存量不足則出現提示訊息，針對修改數量為0及負數做處理)
3.刪除按鈕(從Session內砍掉購物車物件)

 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物清單</title>
<style>
	#list td {
		height:150px;
		vertical-align: middle;
		text-align: center;
	
	}
	#list {
		width:1000px;
	
	}
</style>
</head>
<body>
	<div id="allpage">
		<div id="content">
			<table>
				<tr>
					<td width="700px">
					</td>
					<td>
						<img width="70px" height="70px" style="border:2px red solid;" src="${pageContext.request.contextPath}/images/1.jpg">
					</td>
					<td>
						<img width="40px" height="40px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/2.jpg">
					</td>
					<td>
						<img width="40px" height="40px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/3.jpg">
					</td>
					<td>
						<img width="40px" height="40px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/4.jpg">
					</td>
					
				</tr>
			</table>
			<br>
			<table id="list" border="1" style="border-collapse:collapse">
				<tr>
					<th>商品名稱</th>
					<th>數量</th>
					<th>單價</th>
					<th>小計</th>
					<th>修改</th>
				</tr>
				<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
					<tr>
						<td colspan="5">購物車內目前沒有商品！</td>
					</tr>
				</c:if>
				<c:forEach varStatus="status" var="entry" items="${ShoppingCart.content}">
				<tr>
					<td>
						<img height="70px" src="GetPic?num=${entry.key}"/>
						${entry.value.productVO.name}
					</td>
					<td>
						<input type="text" id="send_qty${status.index}" value="${entry.value.quantity}" size="5" >
					</td>
					<td>
						<fmt:formatNumber value="${entry.value.price_per}" type="number"/>元
					</td>
					<td id="subtotal">
						<fmt:formatNumber value="${entry.value.price_per * entry.value.quantity}" type="number"/>元
					</td>
					<td>
						<input type="button" name="update" value="修改" onclick="upd(${entry.key},${entry.value.quantity},${status.index})">
						<input type="hidden" name="price" value="${entry.value.price_per}">
						<input type="hidden" name="amount" value="${entry.value.productVO.amount}">
						<input type="hidden" name="action4" value="update">
						
						<input type="button" name="delete" value="刪除" onclick="del(${entry.key})">
						<input type="hidden" name="action5" value="delete">
					</td>
				</tr>
				</c:forEach>
			</table>
			<table border="1" width="1000px" style="border-collapse:collapse">
				<c:if test="${!empty ShoppingCart.content}">
				<tr>
					<td colspan="3" height="50px" style="text-align: right;">
						合計金額：
					</td>
					<td colspan="2" height="50px" style="text-align: center;">
						<fmt:formatNumber value="${ShoppingCart.subTotal}" type="number"/>元
					</td>
				</tr>
				<tr>
					<td colspan="3" height="50px" style="text-align: right;">
						本次消費可得紅利點數：
					</td>
					<td colspan="2" height="50px" style="text-align: center;">
						<fmt:formatNumber value="${(ShoppingCart.subTotal/100)+0.0001}" pattern="#,###"/>點
					</td>
				</tr>
				</c:if>
			</table>
			<br>
			
				<input style="margin-left:450px;" type="button" id="cont" value="繼續購物">
				<input type="hidden" name="action1" value="continue">
			
				<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
					<input style="margin-left:10px;" type="button" id="confirm" disabled="disabled" value="確認無誤">
				</c:if>
				<c:if test="${!empty ShoppingCart.content}">
					<input style="margin-left:10px;" type="button" id="confirm" value="確認無誤">
					<input type="hidden" name="action2" value="ok">
				</c:if>
			
				<input style="margin-left:10px;" type="button" id="aband" value="放棄購物">
				<input type="hidden" name="action3" value="abandon">
		</div>
	
	</div>	
	
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script>
	//更新數量
		function upd(key,quantity,index) {
			
		//從產品找到目前庫存量
			var amount;
			$.ajax({
				"type":"get",
				"url":"ProductSearchServlet",
				"data":{"pid" : key , "action" : "getById"},
				"async":false,
				"success":function(data){
					amount = data.amount;
				}
				
			})
			
			var price = $('input[name="price"]').val();
			var newQty = $("#send_qty" + index).val();
			var action = $('input[name="action4"]').val();
		
		//使用者輸入負數
			if(newQty < 0) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal").empty();
				$("#subtotal").append(price * quantity + "元");
				return;
			}
		//使用者輸入0
			if(newQty == 0) {
				alert('請點刪除按鈕刪除');
				$("#subtotal").empty();
				$("#subtotal").append(price * quantity + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量與舊數量相同
			if(newQty == quantity) {
				$("#subtotal").empty();
				$("#subtotal").append(price * quantity + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量超過庫存量
			if((amount - newQty) < 0) {
				alert('庫存量不足！');
				$("#send_qty" + index).val(quantity);
				$("#subtotal").empty();
				$("#subtotal").append(price * quantity + "元");
				return;
			}
		//使用者輸入非數字及0開頭的數字	
			var patt = /^[1-9][0-9]*$/;
			if(!patt.test(newQty)) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal").empty();
				$("#subtotal").append(price * quantity + "元");
				return;
			}
		//都通過才送到Servlet處理，如果成功就更改數量，發生例外回傳修改失敗訊息	
			$.ajax({
					"type":"post",
					"url":"UpdateOIProdServlet",
					"data":{"action" : action , "pid" : key , "newQy" : newQty , "amount" : amount , "quantity" : quantity},
					"success":function(data){
						$("#send_qty" + index).attr("value",newQty);
						$("#send_qty" + index).val(newQty);
						$("#subtotal").empty();
						$("#subtotal").append(price * newQty + "元");
						location.reload();
						return;
					},
					"error":function(data){
						alert("修改失敗！");
						$("#send_qty" + index).val(quantity);
						$("#subtotal").empty();
						$("#subtotal").append(price * quantity + "元");
						return;
					}
					
				})
		}
		
		//從購物車內把某商品刪掉
		function del(key) {
			if(confirm("確定要刪除此項商品嗎？")) {
				var action = $('input[name="action5"]').val();
				$.ajax({
					"type":"post",
					"url":"UpdateOIProdServlet",
					"data":{"action" : action , "pid" : key},
					"success":function(data){
						alert("已刪除！");
						location.reload();
					}
				})
			}
		}
		
		
		$(function() {
			//繼續購物
			$('#cont').click(function(){
				window.location.href = "prod_list.jsp";
			})
			
			//確認無誤
			$('#confirm').click(function(){
				if(confirm("確認無誤？")) {
					window.location.href = "CheckServlet";
					
				} 
				
			})
			
			//放棄購物，請Servlet把ShoppingCart物件刪掉
			$('#aband').click(function(){
				if(confirm("要放棄購物嗎？")) {
					$.ajax({
						"type":"post",
						"url":"AbanShoppingServlet",
						"success":function(data){
							alert("已放棄購物！");
							window.location.href = "prod_list.jsp";
						}
					})
				} 
			})
		})
	

	</script>	
</body>
</html>