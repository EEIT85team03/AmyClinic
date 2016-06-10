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

			<label for="confirm_password">�T�{�K�X</label> <input
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

		   firstname: "�п�J�m�W",

		   email: {

		    required: "�п�JEmail�a�}",

		    email: "�п�J���T��email�a�}"

		   },

		   password: {

		    required: "�п�J�K�X",

		//    minlength: jQuery.format("�K�X����p��{0}�Ӧr ��")

		   },

		   confirm_password: {

		    required: "�п�J�T�{�K�X",

		    minlength: "�T�{�K�X����p��5�Ӧr��",

		    equalTo: "�⦸��J�K�X���@�P���@�P"

		   }

		  }

		    });

		});</script>
</body>

</html>