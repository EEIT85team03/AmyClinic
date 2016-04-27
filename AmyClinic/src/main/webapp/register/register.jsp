<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register.jsp</title>
<s:head theme="xhtml" />
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />

<script type="text/javascript">
		
		window.onload=function(){
			setValue();
		}
		function setValue() {
			document.getElementById('birthdayfield').children[1].setAttribute("readOnly","true");
			var picker1 = dojo.widget.byId("birthdayfield");
// 			if (picker1.getValue() == "")
// 				picker1.setValue(new Date()); 
		}
		
</script>
</head>
<body>
	<ul>
		<li><b><font color="blue">Struts2 TEST Registration Form </font>-<font color="red"> *Required Information</font></b> 		
			<s:form namespace="/logreg" action="register" enctype="multipart/form-data" method="post">
				<s:textfield name="memberVO.name" label="User Name" placeholder="User ID" required="true"/>
				<s:password name="memberVO.pwd" label="Password" placeholder="Password" required="true"/>
				<s:textfield name="memberVO.email" label="Email" placeholder="abc@xyz.com" required="true" />				
				<sx:datetimepicker type="date"  name="memberVO.birthday" label="Birthday" displayFormat="MM/dd/yyyy"   
   								   id="birthdayfield" language="en-US" cssStyle="background:cyan; font-size:13.5px"    								   
   								   value="%{'2003-01-01'}"/>											
				<s:textfield name="memberVO.country" label="Country" placeholder="Taiwan" />
    			<s:select name = "memberVO.gender" headerKey="" headerValue="Select Gender" label="Gender" 
    					  list="#{'M':'Male','F':'Female'}" required="true" />   			    
				<s:textfield name="memberVO.addr" label="Address" placeholder="123 Somewhere!" required="true" />
				<s:textfield name="memberVO.phone" label="Phone" placeholder="0912345678" required="true" />
				<s:textfield name="memberVO.height" label="Height" placeholder="180cm" />
				<s:textfield name="memberVO.mass" label="Weight" placeholder="60kg" />
				<s:file name="memberVO.photo" label="Photo" size="40" />
				
				<s:submit value="Submit" method="register" />
			</s:form>
		</li>		
	</ul>
	<div style="color:red;">${message}</div>
</body>
</html>