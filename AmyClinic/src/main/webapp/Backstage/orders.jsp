<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.orders.model.*"%>
<%@page import="group3.carrie.orderitems.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單管理</title>
</head>
<body>
<%
OrdersService orders = new OrdersService();
List<OrdersVO> list = orders.getAll();
pageContext.setAttribute("list",list);

OrderItemsService order  = new OrderItemsService();
List<OrderItemsVO> orderItem = order.getAll();
pageContext.setAttribute("orderItem", orderItem);
%>
<b>訂單查詢：</b>
<form >
<!-- method="post" -->
<%--  action='${pageContext.request.contextPath}/Backstage/updateOrder'  --%>

<table  border="1" style="text-align: center;border-collapse: collapse;">
			<tr>
				<th>編號/明細</th>
				<th>日期</th>
				<th>總價</th>
				<th>訂單狀態</th>
				<th>付款狀態</th>
				<th>配送狀態</th>
				<th>更新狀態</th>
			</tr>
<c:forEach varStatus="status" var="ordersVO" items="${list}">
			<tr>
				<td><font name="oid">${ordersVO.oid}</font>
<!-- 		1 -->
		<div>
<!-- 		點選後顯示/隱藏訂單明細  -->
		<input type="button" id="showbt${status.count}" value="+" onclick="showORhide(${status.count})">
		</div>
		

		
<!-- 		2		 -->			
				</td>
				<td><font name="odate"><fmt:formatDate pattern="yyyy/MM/dd" value="${ordersVO.odate}" /></font></td>
				<td>$<font name="total"><fmt:formatNumber value="${ordersVO.total}" type="number"/></font></td>
<td>
<select size="1"  name="ostatus" class="form-control form-control-sm"  >				
				<c:if test="${ordersVO.ostatus == 0}">
					<option  value='0'  >訂單成立</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 1}">
					<option  value='1'  >訂單處理中</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 2}">
					<option  value='2'  >交易完成</option>
				</c:if>
				<c:if test="${ordersVO.ostatus == 3}">
					<option  value='3'  >訂單取消</option>
				</c:if>
				<option value="0">訂單成立</option>
  				<option value="1">訂單處理中</option>
  				<option value="2">交易完成</option>
  				<option value="3">訂單取消</option>
</select>
</td>				
<!-- 				------------------------------------------------------ -->
<td>
<select size="1"  name="payment" class="form-control form-control-sm"  >
				<c:if test="${ordersVO.payment == 0}">
					<option value="0">未付款</option>
				</c:if>
				<c:if test="${ordersVO.payment == 1}">
					<option value="1">已付款</option>
				</c:if>
				<option value="0">未付款</option>
  				<option value="1">已付款</option>
</select>				
</td>				
<!-- 				------------------------------------------------------ -->
<td>
<select size="1"  name="del_status" class="form-control form-control-sm"  >
				<c:if test="${ordersVO.del_status == 0}">
					<option value="0">處理中</option>
				</c:if>
				<c:if test="${ordersVO.del_status == 1}">
					<option value="1">已出貨</option>
				</c:if>
				<c:if test="${ordersVO.del_status == 2}">
					<option value="2">已送達</option>
				</c:if>
				<option value="0">處理中</option>
  				<option value="1">已出貨</option>
  				<option value="2">已送達</option>
</select>				
</td>					
<!-- 				------------------------------------------------------ -->
				<c:if test="${ordersVO.ostatus == 0}">
<%-- 					<td><input type="button"  value="更新訂單狀態" onclick="cancel(${ordersVO.oid},${ordersVO.odate},${ordersVO.total},${ordersVO.ostatus},${ordersVO.payment},${ordersVO.del_status})"></td> --%>
							<td><input type="button"  value="更新訂單狀態" onclick="cancel(${ordersVO.oid})"></td>
				</c:if>
				<c:if test="${ordersVO.ostatus != 0}">
					<td></td>
				</c:if>
			</tr>
<!-- 			3 -->
<tr>
<td colspan="7">
<div id="item${status.count}" style="display:none;">
			<table border="1" style="text-align: center;border-collapse: collapse;">
				<c:forEach varStatus="varSta" var="orderItems" items="${ordersVO.orderItems}">
					<tr>
						<td colspan="2">
							${orderItems.productVO.name}
						</td>
						<td>
							${orderItems.quantity}件
						</td>
						<td>
							$<fmt:formatNumber value="${orderItems.price_per * orderItems.quantity}" type="number"/>
						</td>
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="2">
							會員紅利點數
					</td>
					<td>
							- $<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/>
					</td>
				</tr>
			</table>
		</div>
	</td>
	</tr>		
<!-- 		4	 -->
			</c:forEach>
	
		</table>
</form>	

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>	
	<script>
		$(function(){
			$('#query').click(function(){
				var name = $('#for_name').val();
				window.location.href = getContextPath()+'/shoppings/showorderbyname?name='+name;
				
			})
			
			
		})
		
		function getContextPath() { //obtains context path. EL doesn't work with separated .js
	 		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 		}
		
		function showORhide(count) {
			var item = $('#item'+count);
			var bt = $('#showbt'+count);
			console.log(count);
			console.log(item.css("display"));
			if(item.css("display")=="none"){
				item.slideDown();
				console.log('1111111111');
				bt.val("-");
			} else {
				item.slideUp();
				console.log('22222222222');
				bt.val("+");
			}
		}
		function cancel(oid){
// 		function cancel(oid,odate,total,ostatus,payment,del_status){
			Lobibox.confirm({
				title: "請確認",
				msg: "確認更新訂單？",
				callback: function ($this, type, ev) {
				    if(type == 'yes') {
				    	$.ajax({
							"type":"post",
							"url": getContextPath()+'/Backstage/updateOrder',
							"data":{"oid" : oid},
// 							"data":{"oid" : oid,"odate":odate,"total":total,"ostatus":ostatus,"payment":payment,"del_status":del_status},
							"success":function(data){	location.reload();}
						});
				    } else {}
				}
				});
		}
// 			if (confirm("確認取消訂單？")){
// 				$.ajax({
// 					"type":"post",
// 					"url": getContextPath()+'/shoppings/cancelorder',
// 					"data":{"oid" : oid},
// 					"success":function(data){
// 						location.reload();
// 					}
// 				})
// 			}
		
		</script>
		
	
</body>
</html>