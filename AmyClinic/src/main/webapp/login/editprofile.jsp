<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Details</title>
</head>
<body>
<br>mid 	= ${memberVO.mid} 
<br>name 	= ${memberVO.name}
<br>pwd 	= ${memberVO.pwd}
<br>verify	= ${memberVO.verify}
<br>Email 	= ${memberVO.email}
<br>Birthday = ${memberVO.birthday}
<br>Country = ${memberVO.country}
<br>Gender 	= ${memberVO.gender}
<br>Address = ${memberVO.addr}
<br>Phone 	= ${memberVO.phone}
<br>Height	= ${memberVO.height}
<br>Weight 	= ${memberVO.mass}
<br>Photo 	= ${memberVO.photo}
<br>FileName = ${memberVO.photoFileName}
<br>FileType = ${memberVO.photoContentType}
<br>Status = ${memberVO.act_status}
<br>Transactions = ${memberVO.num_trans}
<br>Treatments = ${memberVO.num_treatment}
<br>Visits	= ${memberVO.num_visits}
<br>Reward Points = ${memberVO.reward_pts}
<br>Last Visit = ${memberVO.last_visit}
<br>Memo	= ${memberVO.memo}
<br>Date Joined = ${memberVO.join_date}
</body>
</html>