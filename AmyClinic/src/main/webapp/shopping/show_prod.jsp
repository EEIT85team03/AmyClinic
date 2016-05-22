<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
1.顯示單樣產品的資料(大張圖+名稱+價格+成分+描述)
2.加入購物車的按鈕(存到session內(一個set?))，如果庫存為0就顯示存貨不足
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${prodVO.name}</title>
</head>
<body>
<a href="prod_list.jsp">回商品列表</a><br>
<table>
	<tr>
		<td width="50"></td>
		<td width="300">
			<img src="GetPic?num=${prodVO.pid}"/>
		</td>
		<td width="22"></td>
		<td>
				<input type="hidden" name="pid" value="${prodVO.pid}">
				<input type="hidden" name="pname" value="${prodVO.name}">
				<input type="hidden" name="price" value="${prodVO.price}">
				<input type="hidden" name="discount" value="${prodVO.discount}">
				<table>
					<tr>
						<td>${prodVO.name}</td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>	
					<tr>
						<td>產品編號</td>
						<td>${prodVO.pid}</td>
					</tr>	
					<tr>
						<td>產品成份</td>
						<td>${prodVO.ingredients}</td>
					</tr>	
					<tr>
						<td>產品敘述</td>
						<td>${prodVO.descrip}</td>
					</tr>	
					<tr>
						<td>產品定價</td>
						<td>${prodVO.price}元</td>
					</tr>
					<c:if test="${prodVO.discount != 0}">	
					<tr>
						<td>打折後</td>
						<td><fmt:formatNumber value="${prodVO.price * ((1 - (prodVO.discount/100.0)) +0.0001)}" pattern="###"/>元</td>
					</tr>
					</c:if>	
					<tr>
						<td>
						<c:if test="${prodVO.amount!=0}">
							<input type="button" value="加入購物車" onclick="addToCart()">
						</c:if>
						<c:if test="${prodVO.amount==0}">
							<b>存貨不足</b>
						</c:if> 
						</td>
					</tr>	
				
				</table>
			
		</td>
	</tr>
</table>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script>
function addToCart(){
	var pid = $('input[name="pid"]').val();
	var pname = $('input[name="pname"]').val();
	var price = $('input[name="price"]').val();
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
</script>
</body>
</html>