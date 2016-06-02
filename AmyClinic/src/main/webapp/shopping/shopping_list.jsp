<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>購物清單</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/shopping/js/sortable.js"></script>
<link href="${pageContext.request.contextPath}/shopping/css/shopping_list.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>

<div id="page">
<div id="content">
			<div class="table-wrapper">
			<div class="table-header"><strong>我的購物車</strong></div>
			<table style="margin-right:100px; margin-top:10px;">
				<tr>
					<td width="700px">
					</td>
					<td>
						<img width="70px" height="70px" style="border:2px red solid;" src="${pageContext.request.contextPath}/images/1.jpg">
					</td>
					<td>
						<img width="50px" height="50px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/2.jpg">
					</td>
					<td>
						<img width="50px" height="50px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/3.jpg">
					</td>
					<td>
						<img width="50px" height="50px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/4.jpg">
					</td>
					
				</tr>
			</table>
			<table class="sortable order details">
				<tr>
					<th class="unsortable"><label><input type="checkbox"></label></th>
					<th>項次</th>
					<th class="unsortable">圖片</th>
					<th class="unsortable">商品名稱</th>
					<th class="unsortable">數量</th>
					<th>單價</th>
					<th>小計</th>
					<th class="unsortable">修改</th>
					<th class="unsortable">刪除</th>
				</tr>
				<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
					<tr>
						<td colspan="9">購物車內目前沒有商品！</td>
					</tr>
				</c:if>
				<c:forEach varStatus="status" var="entry" items="${ShoppingCart.content}">
				<tr>
					<td>
						<label><input type="checkbox"></label>
					</td>
					<td>
						${status.count}
					</td>
					<td>
						<img height="70px" src="${pageContext.request.contextPath}/free/getprodpic?num=${entry.key}"/>
					</td>
					<td>
						${entry.value.productVO.name}
					</td>
					<td>
						<input type="text" id="send_qty${status.index}" value="${entry.value.quantity}" size="5" >
					</td>
					<td>
						<fmt:formatNumber value="${entry.value.price_per}" type="number"/>
					</td>
					<td id="subtotal">
						<fmt:formatNumber value="${entry.value.price_per * entry.value.quantity}" type="number"/>元
					</td>
					<td>
						<input type="button" name="update" value="修改" onclick="upd(${entry.key},${entry.value.quantity},${status.index})">
						<input type="hidden" name="price" value="${entry.value.price_per}">
						<input type="hidden" name="amount" value="${entry.value.productVO.amount}">
					</td>
					<td>
						<input type="button" name="delete" value="刪除" onclick="del(${entry.key})">
					</td>
				</tr>
				</c:forEach>
				<tr class="sortbottom">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		
			<table class="order summary">
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
						<fmt:formatNumber value="${(ShoppingCart.subTotal/100)+0.0001}" pattern=",###"/>點
					</td>
				</tr>
				</c:if>
			</table>
								<input style="margin-left:450px;" type="button" id="continue" value="繼續購物">
				
					<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
						<input style="margin-left:10px;" type="button" id="confirm" disabled="disabled" value="確認無誤">
					</c:if>
					<c:if test="${!empty ShoppingCart.content}">
						<input style="margin-left:10px;" type="button" id="confirm" value="確認無誤">
					</c:if>
					<input style="margin-left:10px;" type="button" id="abandon" value="放棄購物">
				</div>

			</div>
				<div id="sidebar-wrapper">
				<div id="sidebar-content">
					<jsp:include page="/General/sidebar.jsp"></jsp:include>
				</div>
				</div>
				

				
				
			</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script src="${pageContext.request.contextPath}/shopping/js/shopping_list.js"></script>	

	
	<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>