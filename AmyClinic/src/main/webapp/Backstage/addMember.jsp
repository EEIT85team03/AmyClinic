<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE">
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
 <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper"><!-- Page Heading -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header" >本月目標<font color="red">30億</font>
                       </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">會員新增</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/member/updateprofile.action">
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberid">Member ID: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly/>			 --%>
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">姓名: </label>
		<div class="col-sm-5">
			<input name="memberVO.name" id="membername" class="form-control" type="text" value="${memberVO.name}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">密碼: </label>
		<div class="col-sm-5">
			<input name="memberVO.pwd" id="memberpwd" class="form-control disable" type="password" value="${memberVO.pwd}" readonly/>
		</div>
		
<%-- 		<div class="col-sm-1"><a class="btn btn-default" href="${pageContext.request.contextPath}/member/changepw.action">Change Password</a>		</div> --%>
	
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">信箱: </label>
		<div class="col-sm-5">
			<input name="memberVO.email" id="memberemail" class="form-control" type="text" value="${memberVO.email}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">生日: </label>
		<div class="col-sm-5">
			<input name="memberVO.birthday" id="memberbirthday" type="text" value="${memberVO.birthday}" readonly style="width:80px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">國家: </label>
		<div class="col-sm-5">
			<input name="memberVO.country" id="membercountry" class="form-control" type="text" value="${memberVO.country}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">性別: </label>
		<div class="col-sm-5">
			<input name="memberVO.gender" id="membergender" class="form-control" type="text" value="${memberVO.gender}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">地址: </label>
		<div class="col-sm-5">
			<input name="memberVO.addr" id="memberaddr" class="form-control" type="text" value="${memberVO.addr}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">電話: </label>
		<div class="col-sm-5">
			<input name="memberVO.phone" id="memberphone" class="form-control" type="text" value="${memberVO.phone}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">身高: </label>
		<div class="col-sm-5">
			<input name="memberVO.height" id="memberheight" class="form-control" type="text" value="${memberVO.height}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">體重: </label>
		<div class="col-sm-5">
			<input name="memberVO.mass" id="membermass" class="form-control" type="text" value="${memberVO.mass}"/>
		</div>
	</div>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberphoto">照片: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.photo" id="memberphoto" class="form-control" type="text" value="${memberVO.photo}"/> --%>
<!-- 		</div> -->
<!-- 	</div> -->

<%-- <h3>${memberVO.name}</h3> <img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="150" width="150"> --%>
<div class="form-group">
<label class="control-label col-sm-2" for="memberVO.photo">照片</label>
<div class="col-sm-10">
    <input type='file' class="upl"  name="memberVO.photo">
</div>
    <div>
        <img class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
    </div>

	<label class="control-label col-sm-2"></label>
 	<input type="hidden" name="memberVO.verify" value="${memberVO.verify}"> 
 	<input type="hidden" name="memberVO.photo" value="${memberVO.photo}"> 
 	<input type="hidden" name="memberVO.total_spent" value="${memberVO.total_spent}"> 
 	<input type="hidden" name="memberVO.memo" value="${memberVO.memo}"> 
	<button type="submit" class="btn btn-success" >新增會員</button>							
	<hr>
</form>
<script type="text/javascript">
$(function (){ 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();           
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("body").on("change", ".upl", function (){
        preview(this);
    }) 
})
$("body").on("change", ".upl", function (){
    preview(this);
})
/**
 * 預覽圖
 * @param   input 輸入 input[type=file] 的 this
 */
function preview(input) {
 
    // 若有選取檔案
    if (input.files && input.files[0]) {
 
        // 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
        var reader = new FileReader();
 
        // 事先定義好，當讀取成功後會觸發的事情
        reader.onload = function (e) {
            
            console.log(e);
 
            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
            // 我們用它當作圖片路徑就對了。
            $('.preview').attr('src', e.target.result);
 
            // 檔案大小，把 Bytes 轉換為 KB
            var KB = format_float(e.total / 1024, 2);
            $('.size').text("檔案大小：" + KB + " KB");
        }
 
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
/**
 * 格式化
 * @param   num 要轉換的數字
 * @param   pos 指定小數第幾位做四捨五入
 */
function format_float(num, pos)
{
    var size = Math.pow(10, pos);
    return Math.round(num * size) / size;
}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png" });
	});
</script>

<script>
	var gender = $(".membergender").val()=="M" ?"Male":"Female";
	$(".membergender").text(gender);
</script>
<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberact_status">狀態: </label> -->
<!-- 		<div class="col-sm-5">			 -->
<%-- 			<input name="memberVO.act_status" id="memberact_status" class="form-control disable" type="text" value="${memberVO.act_status}" readonly />				 --%>
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_trans">交易: </label> -->
<!-- 		<div class="col-sm-5">			 -->
<%-- 			<input name="memberVO.num_trans" id="membernum_trans" class="form-control disable" type="text" value="${memberVO.num_trans}" readonly />				 --%>
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_treatment">診療: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.num_treatment" id="membernum_treatment" class="form-control disable" type="text" value="${memberVO.num_treatment}" readonly />				 --%>
<!-- 		</div> -->
<!-- 	</div> -->
	
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_visits">訪問次數: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.num_visits" id="membernum_visits" class="form-control disable" type="text" value="${memberVO.num_visits}" readonly />						 --%>
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberreward_pts">獎勵點數: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.reward_pts" id="memberreward_pts" class="form-control disable" type="text" value="${memberVO.reward_pts}" readonly />			 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 		<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberspent_pts">消費點數: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.spent_pts" id="memberspent_pts" class="form-control disable" type="text" value="${memberVO.spent_pts}" readonly />			 --%>
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberlast_visit">最後消費日期: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly />			 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberjoin_date">加入日期: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.join_date" id="memberjoin_date" class="form-control disable" type="text" value="${memberVO.join_date}" readonly />			 --%>
<!-- 		</div> -->
<!-- 	</div> -->
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