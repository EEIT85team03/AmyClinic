<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AddEMP</title>
<s:head theme="xhtml" />
<!--�w�]�� xhtml -->
<!--theme �i�� xhtml �� simple �� css_xhtml -->
<sx:head debug="false" cache="false" parseContent="false"
	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
</head>

<body>
	<OL>
		<s:fielderror cssStyle="color:blue" />
		<LI><font color="blue"><b>Struts2�����UI����</b></font> 	
		<s:form action="AddActionEmp" namespace="AddActionEmp" >
			<s:textfield name="employeeVO.name" label="���u�m�W" />
						<s:submit value="�e�X" method="add" />
		</s:form>
		</LI>
	</OL>
</body>
</html>