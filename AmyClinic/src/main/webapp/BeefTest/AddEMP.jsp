<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	

	<FORM METHOD="post" ACTION="emp.do" name="form1" enctype="mulitpart/form-data">
		<table border="0">
			<tr>
				<td>員工姓名:</td>
				<td><input type="text" name="ename" size="20"></td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><input type="password" name="pwd" size="20"></td>
			</tr>
			<tr>
				<td>e-mail</td>
				<td><input type="text" name="email" size="20"></td>
			</tr>
			<tr>
				<td>教育程度</td>
				<td><input type="text" name="edu" size="20"></td>
			</tr>
			<tr>
				<td>經歷</td>
				<td><input type="text" name="exp" size="20"></td>
			</tr>
			<tr>
				<td>專長</td>
				<td><input type="text" name="spec" size="20"></td>
			</tr>
			<tr>
				<td>照片</td>
				<td><input type="file" name="photo" size="20" ></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="insert"><br>
		<input type="submit" value="送出新增">
	</FORM>


</body>
</html>