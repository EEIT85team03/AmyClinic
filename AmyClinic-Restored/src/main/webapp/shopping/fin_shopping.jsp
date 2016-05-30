<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
帶出本次訂單的資料
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>結帳完成</title>
</head>
<body>
	<div id="allpage">
		<div id="content">
			<table>
				<tr>
					<td width="700px">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/1.jpg">
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
						<img width="70px" height="70px" style="border:2px red solid;" src="${pageContext.request.contextPath}/images/4.jpg">
					</td>
					
				</tr>
			</table>
		<b>您的訂購已完成，系統已發出通知信，以下是您的訂單明細：</b><br><br>
		<table border="1" width="1000px" style="border-collapse:collapse">
			<tr>
				<td colspan="4">
					訂單編號：${ordersVO.oid}
				</td>
			</tr>
			<tr>
				<td colspan="4">
					訂購時間：${odate}
				</td>
			</tr>
			<tr>
				<td>
					商品名稱
				</td>
				<td>
					數量
				</td>
				<td>
					單價
				</td>
				<td>
					小計
				</td>
			</tr>
			<tr>
			<c:forEach var="orderItems" items="${ordersVO.orderItems}">
				<td>
					${orderItems.productVO.name}
				</td>
				<td>
					${orderItems.quantity}
				</td>
				<td>
					<fmt:formatNumber value="${orderItems.price_per}" type="number"/>元
				</td>
				<td>
					<fmt:formatNumber value="${orderItems.quantity * orderItems.price_per}" type="number"/>元
				</td>
			</c:forEach>	
			</tr>
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					合計
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.total+ordersVO.points_spent}" type="number"/>元
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					使用的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					本次所得的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${(ordersVO.total/100)+0.0001}" pattern=",###"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					剩餘的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${memberVO.reward_pts}" type="number"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					總金額
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.total}" type="number"/>元
				</td>
			</tr>	
		
		</table>
		<table border="1" width="1000px" style="border-collapse:collapse">
			<tr>
				<td>
					<br>
					收件人姓名：${ordersVO.recipient}<br><br>
					地址：${ordersVO.addr}<br><br>
					電話：${ordersVO.phone}<br><br>
					E-mail：${ordersVO.email}<br><br>
				</td>
			</tr>
		
		
		</table>
		
		</div>
	
	
	</div>
</body>
</html>