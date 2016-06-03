<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>     
<%@ page import="group3.carrie.orders.model.*" %>    
<%
	//避免瀏覽器對文件的快取
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>       
<!DOCTYPE html>
<html>

<!-- 
1.信用卡付款(使用jQuery的plug-in)
ps1.輸入卡號及有效期限時請保持在英文輸入法狀態，否則plug-in的格式會出不來
ps2.卡號4開頭為visa，5開頭為master card
2.帶出應付金額
3.確認送出後，更改Order的訂單狀態，並寄出email通知使用者
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
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
				<b>應付金額：<fmt:formatNumber value="${ordersVO.total}" type="number"/>元</b>
			</div>
	      <div class="card-wrapper"></div>

            <div class="form-container active">
                <form action="${pageContext.request.contextPath}/shoppings/finpay" method="post">
                    <table style="padding-left: 600px;padding-top: 5px">
                    	<tr>
                    		<td>
                            	<input placeholder="信用卡卡號" type="text" name="number" autocomplete="off">
                            </td>
                            <td>	
                            	<input placeholder="持卡人姓名" type="text" name="name" autocomplete="off">
                            </td>	
                        </tr> 
                        <tr>
                        	<td>  
                            	<input placeholder="MM/YY" type="text" name="expiry" autocomplete="off" maxlength="7">
                            </td>	
							<td>
                            	<input placeholder="檢核碼" type="text" name="cvc" maxlength="3">
							</td>
							<td>
                            	<input type="submit" id="pay" value="付款">
                            	<input type="hidden" name="oid" value="${ordersVO.oid}">
                            </td>	
                        </tr>    
                    </table>
                </form>
            </div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script src="${pageContext.request.contextPath}/js/jquery.card.js"></script>
		
<script>
$('form').card({
	container: '.card-wrapper',
	formatting: true,
	messages: {
	        validDate: '有效\n期限'
	},
	placeholders: {
    name: '持卡人姓名',
    expiry: 'MM/YY'
},
	})
$(function() {
	var pay = $('#pay');
	pay.prop("disabled",true);
	var name = $('input[name="name"]');
	var patt_name = /^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z]{1,20}$/
	name.blur(function() {
		if ($(this).val().length == 0 || !patt_name.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	var number = $('input[name="number"]');
	number.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	number.blur(function() {
		var patt_number = /^[^\u0020\u3000][0-9\u0020]*$/
		if ($(this).val().length == 0 || !patt_number.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	
	
	
	var expiry = $('input[name="expiry"]');
	expiry.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	var patt_expiry = /^(0[1-9])|(1[0-2]).*$/
		expiry.blur(function() {
		if ($(this).val().length == 0 || !patt_expiry.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	var cvc = $('input[name="cvc"]');
	cvc.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	var patt_cvc = /^[0-9]{3}$/
	cvc.blur(function() {
		if ($(this).val().length == 0 || !patt_cvc.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	pay.click(function() {
		if(name.val().length==0 || number.val().length==0 || expiry.val().length==0 || cvc.val().length==0 || !patt_name.test(name.val()) || !patt_cvc.test(cvc.val()) || !patt_expiry.test(expiry.val())) {
			$(this).prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})	
	
		
	
})	
</script>
</body>
</html>