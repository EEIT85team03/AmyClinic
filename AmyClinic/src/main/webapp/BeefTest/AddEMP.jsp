<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<OL>
		<s:fielderror cssStyle="color:blue" />
		<LI><font color="black"><b>新增醫師</b></font> 	
		<s:form action="AddActionEmp" namespace="/emp" >
			<s:textfield name="employeeVO.name" label="員工姓名" />
			<s:textfield name="employeeVO.pwd" label="密碼" />
			<s:textfield name="employeeVO.email" label="e-mail" />
			<s:textfield name="employeeVO.education" label="教育程度" />
			<s:textfield name="employeeVO.experience" label="經歷" />
			<s:textfield name="employeeVO.specialty" label="專長" />
						<s:submit value="送出" method="add" />
		</s:form>
		</LI>
	</OL>
</body>
</html>