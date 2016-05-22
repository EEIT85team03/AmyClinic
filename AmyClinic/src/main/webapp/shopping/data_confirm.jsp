<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("ShoppingCart") == null) {
	response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
}
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
1.顯示商品名稱、數量、單價、小計(不可修改)、合計
2.從MemberServlet抓來紅利點數，依紅利使用規則動態更新隔壁欄位，-xx元
3.收件人資料預設顯示從Session抓來的會員資料
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>確認資料</title>
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
						<img width="70px" height="70px" style="border:2px red solid;" src="${pageContext.request.contextPath}/images/2.jpg">
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
			<table id="list" border="1" height="150px" width="1000px" style="border-collapse:collapse;text-align: center">
				<tr>
					<th colspan="4" style="text-align: left">
						本次購買的商品
					</th>
				</tr>
				<tr>
					<td>商品名稱</td>
					<td>數量</td>
					<td>單價</td>
					<td>小計</td>
				</tr>
				<c:forEach varStatus="status" var="entry" items="${ShoppingCart.content}">
				<input type="hidden" id="content" value="${ShoppingCart.content}">
				<tr>
					<td>
						${entry.value.productVO.name}
					</td>
					<td>
						${entry.value.quantity}
					</td>
					<td>
						${entry.value.price_per}元
					</td>
					<td>
						${entry.value.price_per * entry.value.quantity}元
					</td>
				</tr>
				</c:forEach>
			</table>
			<table border="1" width="1000px" style="border-collapse:collapse">
				<tr>
					<td width="799px" height="50px" style="text-align: right;">
						合計金額　
					</td>
					<td height="50px" style="text-align: center;">
						${ShoppingCart.subTotal}元
						<input type="hidden" id="subtotal" value="${ShoppingCart.subTotal}">
					</td>
				</tr>
				<tr>
					<td width="799px" height="50px" style="text-align: right;">
						目前紅利：${memberVO.reward_pts}點　使用<input type="text" name="reward" id="reward_pts" value="0" size="1" style="text-align: center">點　
						<input type="hidden" id="member_reward_pts" value="${memberVO.reward_pts}">
					</td>
					<td height="50px" style="text-align: center;">
						-<span id="reward_dis">0</span>  元
					</td>
				</tr>
				<tr>
					<td width="799px" height="50px" style="text-align: right;">
						應付金額　
					</td>
					<td height="50px" style="text-align: center;">
						<span id="should_pay">${ShoppingCart.subTotal}</span>元
					</td>
				</tr>
				<tr>
					<td width="799px" height="50px" style="text-align: right;">
						本次消費可得紅利點數　
					</td>
					<td height="50px" style="text-align: center;">
						<span id="newRwd"></span>點
					</td>
				</tr>
			</table>
			<table border="1" height="150px" width="1000px" style="border-collapse:collapse">
				<tr>
					<th height="40px" style="text-align: left">
						收件人資料
					</th>
				<tr>
				<tr>
					<td>
					<br>
						姓名：<input type="text" name="mname" value="${memberVO.name}"><span id="warnname"></span><br><br>
						地址：<input type="text" name="addr" value="${memberVO.addr}" size="50"><span id="warnaddr"></span><br><br>
						電話：<input type="text" name="phone" value="${memberVO.phone}"><span id="warnphone"></span><br><br>
						<input type="hidden" name="mbphone" value="${memberVO.phone}">
						E-mail：<input type="text" name="email" value="${memberVO.email}" size="30"><span id="warnemail"></span><br><br>
					</td>
				</tr>	
			</table>
			<br>
			<br>
				<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
					<input style="margin-left:450px;" type="button" id="confirm" disabled="disabled" value="確認無誤，成立訂單">
					<input style="margin-left:10px;" type="button" id="cancel"  value="取消訂單">
					<input type="hidden" name="action2" value="cancel">
				</c:if>
				<c:if test="${!empty ShoppingCart.content}">
					<input style="margin-left:450px;" type="button" id="confirm" value="確認無誤，成立訂單">
					<input type="hidden" name="action1" value="ok">
					<input style="margin-left:10px;" type="button" id="cancel"  value="取消訂單">
					<input type="hidden" name="action2" value="cancel">
				</c:if>	
		
		</div>
	
	
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script>
	$(function(){
		var reward_dis = $("#reward_dis");
		var should_pay = $("#should_pay");
		var reward_pts = $("#reward_pts");
		var newRwd = $("#newRwd");
		var subtotal = $("#subtotal").val();
		//設定本次可得紅利點數的預設值
		newRwd.append(Math.round(subtotal/100));
		
		//要來驗證每個欄位的長度和格式
		
		//姓名只能輸入中英文及半型空白，且不得以半型空白開頭
		$('input[name="mname"]').blur(function(){
			var warn_name = $("#warnname");
			var patt_name = /^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z]{1,20}$/
				if($(this).val().length == 0) {
					warn_name.text("請勿空白");
					$("#confirm").prop("disabled",true);
				} else if (!patt_name.test($(this).val())) {
					warn_name.text("格式錯誤");
					$("#confirm").prop("disabled",true);
				} else {
					warn_name.empty();
					$("#confirm").removeAttr("disabled");
				}
		});
		
		//地址
		$('input[name="addr"]').blur(function(){
			var warn_addr = $("#warnaddr");
			if($(this).val().length == 0) {
				warn_addr.text("請勿空白");
				$("#confirm").prop("disabled",true);
			} else {
				warn_addr.empty();
				$("#confirm").removeAttr("disabled");
			}
		});
		
		//電話最多只能10碼，且需為純數字
		$('input[name="phone"]').blur(function(){
			var warn = $("#warnphone");
			var patt = /^[0-9]+$/;
			if($(this).val().length > 10) {
				warn.text("電話長度超過");
				$("#confirm").prop("disabled",true);
			} else if(!patt.test($(this).val())){
				warn.text("請輸入純數字");
				$("#confirm").prop("disabled",true);
			} else if($(this).val().length == 0) {
				warn.text("請勿空白");
				$("#confirm").prop("disabled",true);
			} else {
				warn.empty();
				$("#confirm").removeAttr("disabled");
			}
		});
		
		//email需符合格式
		$('input[name="email"]').blur(function(){
			var warn_email = $("#warnemail");
			var patt_email = /^[a-zA-Z0-9_]*@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,3}$/
			if ($(this).val().length == 0){
				warn_email.text("請勿空白");
				$("#confirm").prop("disabled",true);
			} else if (!patt_email.test($(this).val())) {
				warn_email.empty();
				warn_email.text("格式錯誤");
				$("#confirm").prop("disabled",true);
			} else {
				warn_email.empty();
				$("#confirm").removeAttr("disabled");
			}
		});
		
		//送出時再做最後的檢查
		$("#confirm").click(function(){
			var action = $('input[name="action1"]').val();
			var myReward_pts = reward_pts.val();
			var pay = should_pay.text();
			var mname = $('input[name="mname"]').val();
			var addr = $('input[name="addr"]').val();
			var phone = $('input[name="phone"]').val();
			var email = $('input[name="email"]').val();
			var myNewRwd = $("#newRwd").text();
			if(mname.length == 0 || addr.length == 0 || phone.length == 0 || email.length == 0) {
				alert("資料請填寫完整");
				return;
			}
			$.ajax({
				"type":"post",
				"url":"NewOrderServlet",
				"dataType":"json",
				"data":{"action":action, "reward_pts": myReward_pts, "should_pay":pay, "mname":mname, "addr":addr, "phone":phone, "email":email},
				"success":function(datas) {
					$.each(datas,function(i,data) {
					var oid = data;
					window.location.href = "CheckForPayServlet?oid="+oid;
					})
					
				}
			})
			
		});
		
		//取消訂單，把購物車殺掉
		$("#cancel").click(function(){
			if(confirm("要取消訂單嗎？")) {
				var action = $('input[name="action2"]').val();
				$.ajax({
					"type":"post",
					"url":"NewOrderServlet",
					"data":{"action" : action},
					"success":function(data){
						window.location.href = "prod_list.jsp";
					}
				})
			}
		});
		
		//依照使用者輸入的紅利點數動態改變扣抵金額、應付金額、所得紅利點數，並且針對值去做驗證
		reward_pts.keyup(function(){
			var member_reward_pts = $("#member_reward_pts").val();
			var myReward_pts = $(this).val();
			var patt = /^[1-9][0-9]*$/;
			if((member_reward_pts - myReward_pts) < 0 || myReward_pts < 0 || !patt.test(myReward_pts) || myReward_pts.length <= 0 || (subtotal- myReward_pts) < 0) {
				reward_dis.empty()
				          .append(0);
				should_pay.empty()
				          .append(subtotal);
				newRwd.empty()
					  .append(Math.round((subtotal/100)));
				return;
			}
			reward_dis.empty()
			          .append(myReward_pts);
			should_pay.empty()
			          .append(subtotal - myReward_pts);
			newRwd.empty()
			      .append(Math.round((subtotal - myReward_pts)/100));
		})
		
		//如果使用者輸入不合法的紅利點數，blur之後會回到0
		reward_pts.blur(function(){
			var reward_dis1 = reward_dis.text();
			$(this).val(reward_dis1);
			$(this).attr("value",reward_dis1);
			
		})
		
	})
		
	</script>
</body>
</html>