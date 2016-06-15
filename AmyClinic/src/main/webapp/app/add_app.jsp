<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
新增預約
1.預約時間使用colorbox帶出門診時間表，搭配Dialog查詢該時段預約狀況，整個關閉後將值傳回本視窗
2.預約療程只有開始新療程時要有(用字串方式傳到Action)
3.要思考如果還沒確定完成預約，有別人先完成預約，且讓預約數滿了的狀況
4.submit後送往AddAppAction，insert一筆新預約及預約明細，並發email給使用者
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<title>線上預約</title>
<style>
	a:link {
		text-decoration: none;
		color:blue
	}
	a:visited {
		color:blue
	}
	textarea {
  		resize : none;
	}
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/apps/addapp" name="form1">
<table width="1000px" align="center" height="600px">
<tr>
	<th colspan="2"><h1>線上預約</h1></th>
</tr>
<tr>
	<td width="150px">預約目的</td>
	<td>
<%-- 		<input type="radio" name="purpose" value="0" checked="checked" ${param.purpose == 0 ? 'checked' : ''}>預約新療程</input> --%>
<%-- 		<input type="radio" name="purpose" value="1" ${param.purpose == 1 ? 'checked' : ''}>回診</input> --%>
		<input type="radio" name="purpose" value="0" checked="checked">預約新療程</input>
		<input type="radio" name="purpose" value="1" style="margin-left: 30pt">回診</input>
	</td>	
</tr>
<tr>
	<td width="150px">預約時間</td>
	<td>
		<a class='iframe' href="${pageContext.request.contextPath}/apps/showtime">選擇</a>
		<span id="sel_app_time">${param.s_app_time}</span>
		<span id="errortime"><font color="red">${message_time}</font></span>
		<input type="hidden" name="s_app_time" value="${param.s_app_time}">
		<input type="hidden" name="ename" value="${param.ename}">
		<input type="hidden" name="id" value="${param.id}">
<!-- 		<input type="text" id="sel_app_time" name="app_ti" size="20" disabled="disabled"> -->
	</td>
</tr>
<jsp:useBean id="procTypeSvc" scope="page" class="group3.carrie.proctype.model.ProcTypeService" />
<tr id="proc1">
<%-- 	<c:if test="${param.purpose != 1}"> --%>
		<td width="150px">療程選擇</td>
		<td>
		<br>
		<c:forEach var="procTypeVO" items="${procTypeSvc.all}">
			<h2>${procTypeVO.name}</h2><br>
			<c:forEach var="procTypeVO1" varStatus="i" items="${procTypeVO.procs}">
				<input type="checkbox" name="proc" value="${procTypeVO1.procedure_id}"/>${procTypeVO1.name}
			</c:forEach>
			<br>
			<br>
		</c:forEach>
<%-- 	</c:if>	 --%>
	<font color="red">${message_proc}</font>
	</td>
</tr>
<tr>
	<td width="150px">需求描述</td>
	<td>
		<textarea rows="4" cols="50" name="descrip" value="${param.descrip}"></textarea>
<%-- 		<input name="descrip" type="textarea" value="${param.descrip}"></input> --%>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="確認送出"></input>
		<input type="button" id="onekey" value="一鍵選擇時間" style="margin-left: 30pt"></input>
	</td>
</tr>
</table>
</FORM>
	<jsp:include page="/General/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.colorbox-zh-TW.js"></script> --%>
<script>
	$('#proc1').show();
$(function(){
	$("input[name='purpose']").click(function(){
		var item = $('input[name=purpose]:checked').val();
		if(item == 0){
			$('#proc1').show();
		} else if(item == 1){
			$('#proc1').hide();
		}
	});
	$(".iframe").colorbox({
		iframe:true,
		width:"80%",
		height:"80%",
		overlayClose:false,
		escKey:false
	});
	$("#onekey").click(function(){
		$('#sel_app_time').text('2016-07-11　星期一　早診');
		$('input[name="s_app_time"]').val('2016-07-11　星期一　早診');
		$('input[name="ename"]').val('張君雅');
		$('input[name="id"]').val('1123');
		$('#errortime').empty();
	})
});
</script>
</body>
</html>