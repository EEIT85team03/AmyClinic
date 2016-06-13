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
	
<table width="1000px" border="1" style="text-align: center;border-collapse: collapse;">
			<tr>
				<th>訂單編號</th>
				<th>日期</th>
				<th>總價</th>
				<th>訂單狀態</th>
				<th>付款狀態</th>
				<th>配送狀態</th>
				<th>取消訂單</th>
			</tr>
<c:forEach varStatus="status" var="ordersVO" items="${list}">
			<tr>
				<td>${ordersVO.oid}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ordersVO.odate}" /></td>
				<td>$<fmt:formatNumber value="${ordersVO.total}" type="number"/></td>
				<c:if test="${ordersVO.ostatus == 0}">
					<td>訂單成立</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 1}">
					<td>訂單處理中</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 2}">
					<td>交易完成</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 3}">
					<td>訂單取消</td>
				</c:if>
				<c:if test="${ordersVO.payment == 0}">
					<td><font color="red">未付款</font></td>
				</c:if>
				<c:if test="${ordersVO.payment == 1}">
					<td>已付款</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 0}">
					<td>處理中</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 1}">
					<td>已出貨</td>
				</c:if>
				<c:if test="${ordersVO.del_status == 2}">
					<td>已送達</td>
				</c:if>
				<c:if test="${ordersVO.ostatus == 0}">
					<td><input type="button" value="取消訂單" onclick="cancel(${ordersVO.oid})"></td>
				</c:if>
				<c:if test="${ordersVO.ostatus != 0}">
					<td></td>
				</c:if>
			</tr>
		</table>
<!-- 		<div> -->
		<!-- 點選後顯示/隱藏訂單明細 --> 
<%-- 		<input type="button" id="showbt${status.count}" value="+" onclick="showORhide(${status.count})"> --%>
<!-- 		</div> -->
<%-- 		<div id="item${status.count}" style="display:none;"> --%>
<!-- 			<table  width="1000px" border="1" style="text-align: center;border-collapse: collapse;"> -->
<%-- 				<c:forEach varStatus="varSta" var="orderItems" items="${ordersVO.orderItems}"> --%>
<!-- 					<tr> -->
<!-- 						<td> -->
<%-- 							${orderItems.productVO.name} --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							${orderItems.quantity}件 --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							$<fmt:formatNumber value="${orderItems.price_per * orderItems.quantity}" type="number"/> --%>
<!-- 						</td> -->
<!-- 					</tr>	 -->
<%-- 				</c:forEach> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="2"> -->
<!-- 							會員紅利點數 -->
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 							- $<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 		<br> -->
	
	</c:forEach>
</body>
</html>