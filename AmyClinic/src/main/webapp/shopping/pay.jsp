<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="group3.carrie.orders.model.*" %>    
<%
	//避免瀏覽器對文件的快取
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 
1.信用卡付款(使用jQuery的plug-in)
2.帶出應付金額
3.確認送出後，更改Order的訂單狀態，並寄出email通知使用者
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						<img width="70px" height="70px" style="border:2px red solid;" src="${pageContext.request.contextPath}/images/3.jpg">
					</td>
					<td>
						<img width="50px" height="50px" src="${pageContext.request.contextPath}/images/5.png">
					</td>
					<td>
						<img width="70px" height="70px" src="${pageContext.request.contextPath}/images/4.jpg">
					</td>
					
				</tr>
			</table>

		
		
		</div>
	
	</div>
			<div style="padding-left: 750px; padding-top: 10px; padding-bottom: 10px">
				<b>應付金額：${ordersVO.total}元</b>
			</div>
	      <div class="card-wrapper"></div>

            <div class="form-container active">
                <form action="FinPayServlet" method="post">
                    <table style="padding-left: 600px;padding-top: 5px">
                    	<tr>
                    		<td>
                            	<input placeholder="信用卡卡號" type="text" name="number">
                            </td>
                            <td>	
                            	<input placeholder="持卡人姓名" type="text" name="name">
                            </td>	
                        </tr> 
                        <tr>
                        	<td>  
                            	<input placeholder="MM/YY" type="text" name="expiry">
                            </td>	
							<td>
                            	<input placeholder="檢核碼" type="text" name="cvc" maxlength="3">
							</td>
							<td>
                            	<input type="submit" value="付款">
                            	<input type="hidden" name="oid" value="${ordersVO.oid}">
                            </td>	
                        </tr>    
                    </table>
                </form>
            </div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script src="${pageContext.request.contextPath}/js/jquery.card.js"></script>
		
<script>
var card = new Card({ 
	form: '.active form', 
	container: '.card-wrapper',
	messages: {
	        validDate: '有效\n期限'
	},
	placeholders: {
    name: '持卡人姓名',
},
	})
</script>
</body>
</html>