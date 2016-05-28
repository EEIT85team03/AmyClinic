<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<title>AddEMP</title>
<s:head theme="xhtml" />
<!--預設為 xhtml -->
<!--theme 可為 xhtml 或 simple 或 css_xhtml -->
<sx:head debug="false" cache="false" parseContent="false"
	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
</head>

<body>
	--
	<%-- <OL>
		<s:fielderror cssStyle="color:blue" />
		<LI><font color="black"><b>新增醫師</b></font> 	
		<s:form action="AddActionEmp" namespace="/emp" >
			<s:textfield name="employeeVO.name" label="員工姓名" />
			<s:password name="employeeVO.pwd" label="密碼" />
			<s:textfield name="employeeVO.email" label="e-mail" />
			<s:textfield name="employeeVO.education" label="教育程度" />
			<s:textfield name="employeeVO.experience" label="經歷" />
			<s:textfield name="employeeVO.specialty" label="專長" />
			<s:file      name="photo.photo" label="照片" /> 
						<s:submit value="送出" method="add" />
		</s:form>
		</LI>
	</OL>  --%>
	<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
	

	<FORM METHOD="post" ACTION="emp.do" name="form1" enctype="multipart/form-data">
		<table border="0">
			<tr>
				<td>員工姓名:</td>
				<td><input type="text" name="name" size="20" value="${request.empVO.name}"></td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><input type="password" name="pwd" size="20"  ></td>
			</tr>
			<tr>
				<td>重新輸入密碼</td>
				<td><input type="password" name="pwd2" size="20"  ></td>
			</tr>
			<tr>
				<td>e-mail</td>
				<td><input type="text" name="email" size="20" value="${request.empVO.email}"></td>
			</tr>
			<tr>
				<td>教育程度</td>
				<td><input type="text" name="edu" size="20" value="${request.empVO.education}"></td>
			</tr>
			<tr>
				<td>經歷</td>
				<td><input type="text" name="exp" size="20" value="${request.empVO.experience}" ></td>
			</tr>
			<tr>
				<td>專長</td>
				<td><input type="text" name="spec" size="20" value="${request.empVO.specialty}"></td>
			</tr>
			<tr>
				<td>照片</td>
				<td><input type="file" name="photo" size="20" class="upl"></td>
			</tr>
			
			
		</table>
		
		<input type="hidden" name="action" value="insert"><br>
		<input type="submit" value="送出新增">
		<div>
        <img class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
	</FORM>
	
	
 


</body>
<script>
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


</script>
</html>