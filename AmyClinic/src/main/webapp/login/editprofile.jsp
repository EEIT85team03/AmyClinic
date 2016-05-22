<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Details</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<style>
/* 	label {		 */
/* 		position: relative; */
/* 		text-align: center; */
/* 		height:26px; */
/*      	top: 50%;  */
/* 	} */
</style>
</head>
<body>
I am editprofile.jsp! <hr>

<form role="form" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberid">Member ID: </label>
		<div class="col-sm-5">
			<div id="memberid" class="form-control" style="border:none;">${memberVO.mid}</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">Name: </label>
		<div class="col-sm-5">
			<input id="membername" class="form-control" type="text" value="${memberVO.name}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">Password: </label>
		<div class="col-sm-5">
			<input id="memberpwd" class="form-control" type="password" value="${memberVO.pwd}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">Email: </label>
		<div class="col-sm-5">
			<input id="memberemail" class="form-control" type="text" value="${memberVO.email}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">Birthday: </label>
		<div class="col-sm-5">
			<input id="memberbirthday" class="form-control" type="text" value="${memberVO.birthday}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">Country: </label>
		<div class="col-sm-5">
			<input id="membercountry" class="form-control" type="text" value="${memberVO.country}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">Gender: </label>
		<div class="col-sm-5">
			<input id="membergender" class="form-control" type="text" value="${memberVO.gender}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">Address: </label>
		<div class="col-sm-5">
			<input id="memberaddr" class="form-control" type="text" value="${memberVO.addr}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">Phone: </label>
		<div class="col-sm-5">
			<input id="memberphone" class="form-control" type="text" value="${memberVO.phone}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">Height: </label>
		<div class="col-sm-5">
			<input id="memberheight" class="form-control" type="text" value="${memberVO.height}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">Weight: </label>
		<div class="col-sm-5">
			<input id="membermass" class="form-control" type="text" value="${memberVO.mass}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphoto">Photo: </label>
		<div class="col-sm-5">
			<input id="memberphoto" class="form-control" type="text" value="${memberVO.photo}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberact_status">Status: </label>
		<div class="col-sm-5">
			<div id="memberact_status" class="form-control" style="border:none;">${memberVO.act_status}</div>				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_trans">Transactions: </label>
		<div class="col-sm-5">
			<div id="membernum_trans" class="form-control" style="border:none;">${memberVO.num_trans}</div>				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_treatment">Treatments: </label>
		<div class="col-sm-5">
			<div id="membernum_treatment" class="form-control" style="border:none;">${memberVO.num_treatment}</div>				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_visits">Visits: </label>
		<div class="col-sm-5">
			<div id="membernum_visits" class="form-control" style="border:none;">${memberVO.num_visits}</div>						
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberreward_pts">Reward Points: </label>
		<div class="col-sm-5">
			<div id="memberreward_pts" class="form-control" style="border:none;">${memberVO.reward_pts}</div>			
		</div>
	</div>
		<div class="form-group">
		<label class="control-label col-sm-2" for="memberspent_pts">Reward Points Spent: </label>
		<div class="col-sm-5">
			<div id="memberspent_pts" class="form-control" style="border:none;">${memberVO.spent_pts}</div>			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberlast_visit">Last Visit: </label>
		<div class="col-sm-5">
			<div id="memberlast_visit" class="form-control" style="border:none;">${memberVO.last_visit}</div>			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberjoin_date">Date Joined: </label>
		<div class="col-sm-5">
			<div id="memberjoin_date" class="form-control" style="border:none;">${memberVO.join_date}</div>			
		</div>
	</div>
	<button type="submit" class="btn btn-default">Submit</button>							
	<hr>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>