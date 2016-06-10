<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh_TW.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.metadata.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<form id="signupForm" method="get" action="">

		<p>

			<label for="firstname">Firstname</label> <input id="firstname"
				name="firstname" />

		</p>

		<p>

			<label for="email">E-Mail</label> <input id="email" name="email" />

		</p>

		<p>

			<label for="password">Password</label> <input id="password"
				name="password" type="password" />

		</p>

		<p>

			<label for="confirm_password">確認密碼</label> <input
				id="confirm_password" name="confirm_password" type="password" />

		</p>

		<p>

			<input class="submit" type="submit" value="Submit" />

		</p>

	</form>
	<script type="text/javascript">
	$().ready(function() {

		 $("#signupForm").validate({

		        rules: {

		   firstname: "required",

		   email: {

		    required: true,

		    email: true

		   },

		   password: {

		    required: true,

		    minlength: 5

		   },

		   confirm_password: {

		    required: true,

		    minlength: 5,

		    equalTo: "#password"

		   }

		  },

		        messages: {

		   firstname: "請輸入姓名",

		   email: {

		    required: "請輸入Email地址",

		    email: "請輸入正確的email地址"

		   },

		   password: {

		    required: "請輸入密碼",

		//    minlength: jQuery.format("密碼不能小於{0}個字 符")

		   },

		   confirm_password: {

		    required: "請輸入確認密碼",

		    minlength: "確認密碼不能小於5個字符",

		    equalTo: "兩次輸入密碼不一致不一致"

		   }

		  }

		    });

		});</script>
</body>

</html>