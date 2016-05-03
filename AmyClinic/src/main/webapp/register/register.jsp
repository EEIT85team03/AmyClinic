<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<title>register.jsp</title>
<s:head theme="xhtml" />
<sx:head debug="false" cache="false" parseContent="false"
	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />

<script type="text/javascript">
	window.onload = function() {
		setValue();
	}
	function setValue() {
		document.getElementById('birthdayfield').children[1].setAttribute(
				"readOnly", "true");
		var picker1 = dojo.widget.byId("birthdayfield");
		// 			if (picker1.getValue() == "")
		// 				picker1.setValue(new Date()); 
	}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="logo">
			<h1>
				<a href="#"></a>
			</h1>
			<p></p>
		</div>
		<hr />
		<div id="header">
			<div id="menu">
				<ul>
					<li><a href="#">關於我們</a></li>
					<li><a href="#">最新消息</a></li>
					<li><a href="#">會員專區</a></li>
					<li><a href="#">服務項目</a></li>
					<li><a href="#">線上購物</a></li>
					<li><a href="#">專員諮詢</a></li>
				</ul>
			</div>
			<div id="search">
				<form method="get" action="">
					<fieldset>
						<input type="text" name="s" id="search-text" size="15" /> <input
							type="submit" id="search-submit" value="GO" />
					</fieldset>
				</form>
			</div>


		</div>


		<div id="page">
			<div id="page-bgtop">
				<div id="content">


					<div class="post">
						<div class="entry">
							<h1 class="ribbon">
								<strong class="ribbon-content">註冊會員</strong>
							</h1>
							<div class="clr"></div>
							<ul>
								<li id="sform"><b id="readme"><font color="red">
											星號(*)代表必要資訊</font></b> <s:form namespace="/logreg" action="register"
										enctype="multipart/form-data" method="post">
										<s:textfield name="memberVO.name" label="會員帳號"
											placeholder="User ID" required="true" id="username" />
										<s:password name="memberVO.pwd" label="會員密碼"
											placeholder="Password" required="true" id="password" />
										<s:textfield name="memberVO.email" label="電子信箱"
											placeholder="abc@xyz.com" required="true" id="email" />
										<sx:datetimepicker type="date" name="memberVO.birthday"
											label="出生日期" displayFormat="MM/dd/yyyy" id="birthdayfield"
											language="en-US"
											cssStyle="background:lightgray; font-size:13.5px"
											value="%{'2016-01-01'}" />
										<%-- 				<s:textfield name="memberVO.country" label="Country" placeholder="Taiwan" /> --%>
										<s:select name="memberVO.country" headerKey=""
											headerValue="選擇國籍" label="國籍"
											list="#{'Taiwan':'Taiwan','United States':'United States', 'Japan':'Japan','Korea':'Korea'}"
											id="country" />
										<s:select name="memberVO.gender" headerKey=""
											headerValue="選擇性別" label="性別"
											list="#{'M':'Male','F':'Female'}" required="true" id="gender" />
										<s:textfield name="memberVO.addr" label="用戶地址"
											placeholder="123 Somewhere!" required="true" id="address" />
										<s:textfield name="memberVO.phone" label="電話號碼"
											placeholder="0912345678" required="true" id="phone" />
										<s:textfield name="memberVO.height" label="身高"
											placeholder="180" id="height" />
										<s:textfield name="memberVO.mass" label="體重" placeholder="60"
											id="weight" />
										<div class="box">
											<div class="tablelayout">
												<div class="box-left">
													<label id="pic">照片<font color="red">*</font>:
													</label> <span class="file-wrapper"> <s:file
															name="memberVO.photo" label="會員圖片" size="40"
															id="uploader" theme="simple" /> <span class="btn">上傳我的照片</span>
													</span>
												</div>
												<div class="box-right">
													<img id="img-uploaded" src="img/text.png" alt="你的照片" />
												</div>
											</div>
										</div>

										<s:submit value="建立帳號" method="register" id="button-0" />
									</s:form></li>
							</ul>
							<div style="color: red;">${message}</div>

						</div>
					</div>
				</div>


				<div id="sidebar">
					<ul>
						<li>
							<h2>七八個星天外</h2>
							<p>夫至虛無生者，蓋是般若玄鑒之妙趣，有物之宗極者也。自非聖明特達，何能契神於有無之間哉？
								是以至人通神心於無窮，窮所不能滯；極耳目於視聽，聲色所不能制者，豈不以其即萬物之自虛，故物不能累其神明者也？</p>
						</li>
						<li>
							<h2>兩三點雨山前</h2>
							<ul>
								<li><a href="#">去年今日此門中</a></li>
								<li><a href="#">人面桃花相印紅</a></li>
								<li><a href="#">只緣感君一回顧</a></li>
								<li><a href="#">使我思君朝與暮</a></li>
								<li><a href="#">最是人間留不住</a></li>
								<li><a href="#">朱顏辭鏡花辭樹</a></li>
								<li><a href="#">人面不知何處去</a></li>
								<li><a href="#">桃花依舊笑春風</a></li>
							</ul>
						</li>
					</ul>
				</div>


				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>

		<div id="footer-bgcontent">
			<div id="footer">
				<p>&copy;AMY cosmetic //Group 3</p>
			</div>
		</div>

	</div>

	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script>
		$(function() {
			$(":text").attr("autocomplete", "off");
		});
	</script>
	<script src="js/src.js"></script>
	<script type="text/javascript">
		/*----------------------------------------
		 Upload btn
		 ------------------------------------------*/
		var SITE = SITE || {};

		SITE.fileInputs = function() {
			var $this = $(this), $val = $this.val(), valArray = $val
					.split('\\'), newVal = valArray[valArray.length - 1], $button = $this
					.siblings('.btn'), $fakeFile = $this
					.siblings('.file-holder');
			if (newVal !== '') {
				$button.text('換一張照片');
				if ($fakeFile.length === 0) {
					//       $button.after('<span class="file-holder">' + newVal + '</span>');
				} else {
					//       $fakeFile.text(newVal);
				}
			}
		};

		$('.file-wrapper input[type=file]').bind('change focus click',
				SITE.fileInputs);

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				var tmppath = URL.createObjectURL(event.target.files[0]);

				reader.onload = function(e) {
					$('#img-uploaded').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#uploader").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>
