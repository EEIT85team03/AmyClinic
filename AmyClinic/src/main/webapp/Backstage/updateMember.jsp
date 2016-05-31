<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="group3.henry.login.model.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>☆AMY診所☆管理系統☆pro版☆</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/jquery-ui.min.css" rel="stylesheet">
<style>
	.disable{ 
		border:none; 
 	}	 
 	.ui-datepicker-trigger { 
 		padding:0px; 
 		padding-left:5px; 
 		vertical-align:baseline;	 
 		position:relative; 
 		top:4px; 
		height:18px; 
 		cursor: pointer; 
 	} 
 	.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year { 
       color: black;  font-size: 16px;  font-weight: bold;
/*        font-family: ...;  */
       } 
/* 	#userphoto{	border-radius:25px;}  */
</style>

</head>
<body>
<%
 	MemberVO memberVO= (MemberVO) request.getAttribute("memberVO");
  MemberServices memberSer = new MemberServices();
  List<MemberVO> list = memberSer.getAll();
  pageContext.setAttribute("list",list);
 %>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#ADADAD  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                <div class="page-header" >
 <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                           
                </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">會員資料維護</font>(M=男生，F=女生。狀態0=封鎖，1=正常，2=未開通)</li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     <hr> 
<!--         開始 -->
<form role="form" class="form-horizontal" method="post" action="MemberServletTest">

	<div class="form-group">
		<label class="control-label col-sm-2" for="memberid">編號: </label>
		<div class="col-sm-4">
			<input name="mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly style="width:80px;"/>			
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">姓名: </label>
		<div class="col-sm-4">
			<input name="name" id="membername" class="form-control" type="text" value="${memberVO.name}" style="width:120px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberlast_memo">備註: </label>
		<div class="col-sm-5">
			<input name="memo" id="memberlast_memo" class="form-control disable" type="text" value="${memberVO.memo}"  />			
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">密碼: </label>
		<div class="col-sm-4">
			<input name="pwd" id="memberpwd" class="form-control disable" type="password" value="${memberVO.pwd}" readonly		style="width:120px;"/>
		</div>		
<%-- 		<div class="col-sm-1"><a class="btn btn-default" href="${pageContext.request.contextPath}/member/changepw.action">Change Password</a>		</div> --%>
	</div>

	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">信箱: </label>
		<div class="col-sm-6">
			<input name="email" id="memberemail" class="form-control" type="text" value="${memberVO.email}" style="width:180px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">生日: </label>
		<div class="col-sm-6">
			<input name="birthday" id="memberbirthday" type="text" value="${memberVO.birthday}" readonly style="width:80px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">國家: </label>
		<div class="col-sm-6">
<%-- 			<input name="country" id="membercountry" class="form-control" type="text" value="${memberVO.country}" style="width:80px;"/> --%>
		<select name='country' class="selectpicker" data-style="btn-success"  	style="width:80px;">
  			<option value="${memberVO.country}"  >${memberVO.country} </option>
  			<option value="台灣">台灣</option>
  			<option value="美國">美國</option>
  			<option value="日本">日本</option>
  			<option value="其他">其他</option>
		</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">性別: </label>
		<div class="col-sm-6">
<%-- 			<input name="gender" id="membergender" class="form-control" type="text" value="${memberVO.gender}" style="width:80px;"/> --%>
		<select name='gender' class="selectpicker"  id="membergender" data-style="btn-warning"  style="width:80px;">
  			<option  id='gender'  value="${memberVO.gender}"  ></option>
  			<option value="M" >男人</option>
  			<option value="F">女人</option>
  			<option value="A">其他</option>
		</select>
		</div>
	</div>
	  			<script>
	  		var i=	document.getElementById('gender').value;
	  		var sb=	document.getElementById('gender');
			if(i=='M'){sb.text='男人';} 
			if(i=='F'){sb.text='女人';} 
 			if(i=='A'){sb.text='其他';} 
 			</script>	 
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">地址: </label>
		<div class="col-sm-6">
			<input name="addr" id="memberaddr" class="form-control" type="text" value="${memberVO.addr}" />
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">電話: </label>
		<div class="col-sm-6">
			<input name="phone" id="memberphone" class="form-control" type="text" value="${memberVO.phone}" style="width:180px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">身高: </label>
		<div class="col-sm-5">
			<input name="height" id="memberheight" class="form-control" type="text" value="${memberVO.height}" style="width:80px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">體重: </label>
		<div class="col-sm-5">
			<input name="mass" id="membermass" class="form-control" type="text" value="${memberVO.mass}" style="width:80px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberact_status">狀態: </label>
		<div class="col-sm-5">			
<%-- 			<input name="act_status" id="memberact_status" class="form-control disable" type="text" value="${memberVO.act_status}"  style="width:80px;"/>				 --%>
		<select name='act_status' class="selectpicker"  id="memberAct_status" data-style="btn-warning"  style="width:80px;">
  			<option id='act_status' value="${memberVO.act_status}" ></option>
  			<option value="0">封鎖</option>
  			<option value="1">正常</option>
  			<option value="2">未開通</option>
		</select>
		</div>
	</div>
<script>
	  		var i=	document.getElementById('act_status').value;
	  		var sb=	document.getElementById('act_status');
			if(i=='0'){sb.text='封鎖';} 
			if(i=='1'){sb.text='正常';} 
 			if(i=='2'){sb.text='未開通';} 
 			</script>	 
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_trans">交易: </label>
		<div class="col-sm-5">			
			<input name="num_trans" id="membernum_trans" class="form-control disable" type="text" value="${memberVO.num_trans}" readonly style="width:80px;" />				
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_treatment">診療: </label>
		<div class="col-sm-5">
			<input name="num_treatment" id="membernum_treatment" class="form-control disable" type="text" value="${memberVO.num_treatment}" readonly style="width:80px;" />				
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_visits">訪問次數: </label>
		<div class="col-sm-5">
			<input name="num_visits" id="membernum_visits" class="form-control disable" type="text" value="${memberVO.num_visits}" readonly style="width:80px;"/>						
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_total_spent">總花費: </label>
		<div class="col-sm-5">
			<input name="total_spent" id="membernum_total_spent" class="form-control disable" type="text" value="${memberVO.total_spent}" readonly style="width:80px;"/>						
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="memberreward_pts">獎勵點數: </label>
		<div class="col-sm-5">
			<input name="reward_pts" id="memberreward_pts" class="form-control disable" type="text" value="${memberVO.reward_pts}" readonly style="width:80px;"/>			
		</div>
	</div>
		<div class="form-group">
		<label class="control-label col-sm-2" for="memberspent_pts">消費點數: </label>
		<div class="col-sm-5">
			<input name="spent_pts" id="memberspent_pts" class="form-control disable" type="text" value="${memberVO.spent_pts}" readonly style="width:80px;"/>			
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="memberlast_visit">最後消費日期: </label>
		<div class="col-sm-5">
			<input name="last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly style="width:100px;"/>			
		</div>
	</div>
	<div class="form-group">
<!-- 		<label class="control-label col-sm-2" for="memberjoin_date">加入日期: </label> -->
		<div class="col-sm-5">
			<input name="join_date" id="memberjoin_date" class="form-control disable" type="hidden" value="${memberVO.join_date}" readonly style="width:100px;"/>			
		</div>
	</div>
	
	<input name="verify" type="hidden" value="${memberVO.verify}" />		
	<input name="photo" type="hidden" value="${memberVO.photo}" />	
	
	<div class="form-group"> 
	<div class="col-sm-offset-2 col-sm-10">
	<input type="hidden" name="action"	value="Update">
	<button type="submit" class="btn btn-success" >修改會員資料</button>		
	</div>			
	</div>		
	<hr>
</form>
<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- required for .datepicker() -->
<script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>  
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png" });
	});
</script>

<script>
	var gender = $(".membergender").val()=="M" ?"Male":"Female";
	$(".membergender").text(gender);
</script>

</body>
</html>