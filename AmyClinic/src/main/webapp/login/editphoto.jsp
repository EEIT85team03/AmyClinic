<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="<%=request.getContextPath()%>/login/js/previewImg.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="mid" value="${memberVO.mid}">
	<s:actionerror/>
	<s:form action="updatephotos" namespace="/logreg" enctype="multipart/form-data"  method="post" theme="simple">
        <s:file name="fileUpload" label="照片上傳" size="20" onchange="PreviewImage(this)"/> <!-- name="fileUpload" fileUpload與Action中的暫時File物件變數名稱要一致 -->
		<s:submit value="上傳" />
		<br>
		<input type="button" id="cancel" value="取消">
		<td class="tdLabel">上傳預覽：</td>
		<br>
	    <td>
	       <table>
	         <tr>
	            <td><s:div id="imgPreview"  cssStyle="overflow:hidden;"></s:div></td>

	          </tr>
	        </table>
	    </td>
	    
		
	</s:form>
	
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script>
$("#cancel").click(function(){
	top.$.fn.colorbox.close();
})
</script>
</body>

</html>