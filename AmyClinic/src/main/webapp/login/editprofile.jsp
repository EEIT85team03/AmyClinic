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
	label {
		border:1px solid grey;
		position: relative;
		text-align: center;
		height:26px;
     	top: 50%; 
/*      	transform: translateY(-50%);  */
	}
</style>
</head>
<body>
I am editprofile.jsp! <hr>

<form>
	<div class="col-md-2"></div><label class="col-md-2">Member ID: </label><input class="col-md-4" type="text" value="${memberVO.mid}" /><div class="col-md-4"></div><br>
	<label>Name: </label><input type="text" value="${memberVO.name}" /> <br/>
	<label>Password: </label><input type="password" value="${memberVO.pwd}" /> <br/>
	<label>Email: </label><input type="text" value="${memberVO.email}" /> <br/>
	<label>Birthday: </label><input type="text" value="${memberVO.birthday}" /> <br/>
	<label>Country: </label><input type="text" value="${memberVO.country}" /> <br/>
	<label>Gender: </label><input type="text" value="${memberVO.gender}" /> <br/>
	<label>Address: </label><input type="text" value="${memberVO.Address}" /> <br/>
	<label>Phone: </label><input type="text" value="${memberVO.phone}" /> <br/>
	<label>Height: </label><input type="text" value="${memberVO.height}" /> <br/>
	<label>Weight: </label><input type="text" value="${memberVO.mass}" /> <br/>
	<label>Photo: </label><input type="text" value="${memberVO.photo}" /> <br/>
	<label>Status: </label><input type="text" value="${memberVO.act_status}" /> <br/>
	<label>Transactions: </label><input type="text" value="${memberVO.num_trans}" /> <br/>
	<label>Treatments: </label><input type="text" value="${memberVO.num_treatment}" /> <br/>
	<label>Visits: </label><input type="text" value="${memberVO.num_visits}" /> <br/>
	<label>Reward Points: </label><input type="text" value="${memberVO.reward_pts}" /> <br/>
	<label>Last Visit: </label><input type="text" value="${memberVO.last_visit}" /> <br/>
	<label>Date Joined: </label><input type="text" value="${memberVO.join_date}" /> <br/>
	<hr>
	<br>verify	= ${memberVO.verify}
	<br>FileName = ${memberVO.photoFileName}
	<br>FileType = ${memberVO.photoContentType}
	<br>Memo	= ${memberVO.memo}
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>