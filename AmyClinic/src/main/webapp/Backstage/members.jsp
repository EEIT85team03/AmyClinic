<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@page import="group3.henry.login.model.*"%>
<%-- <%@page import="group3.k.mytest.*"%> --%>
<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
</head>

<body>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#ADADAD  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                <div class="page-header" >
 <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                           
                </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">會員資料維護</font>(M=男生，F=女生。狀態0=封鎖，1=正常，2=未開通)</li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     <hr> 
<!--         開始 -->
 <%
 	MemberVO memberVO= (MemberVO) request.getAttribute("memberVO");
  MemberServices memberSer = new MemberServices();
  List<MemberVO> list = memberSer.getAll();
  pageContext.setAttribute("list",list);
 %>
 <table border="2"  bordercolor='blue'  align='center'  class="table table-hover"  >
	<tr>
<!-- 		<th>照片</th>	 -->
		<th>姓名/性別</th>
		<th>信箱</th>
		<th>生日</th>
		<th>國家/地址</th>
		<th>電話</th>
		<th>身高/體重</th>	
		<th>交易次/診療次</th>	
		<th>訪問次數</th>
		<th>獎勵點數/消費點數</th>	
		<th>最後消費日期</th>
		<th>加入日期</th>
		<th>狀態</th>
		<th><a href="addMember.jsp"><input type="submit" value="新增會員" class="btn btn-primary"></a>  </th>
	</tr>
	<c:forEach var="MemberVO"  items="${list}"  >
		<tr>
<%-- 			<td><img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;"></td> --%>
			<td>${MemberVO.name}		/	${MemberVO.gender}</td>
			<td>${MemberVO.email}</td>
			<td>${MemberVO.birthday}</td>
			<td>${MemberVO.country}-${MemberVO.addr}</td>
			<td>${MemberVO.phone}</td>
			<td>${MemberVO.height}公分/${MemberVO.mass}公斤</td>
			<td>${MemberVO.num_trans}	/	${MemberVO.num_treatment}</td>			
			<td>${MemberVO.num_visits}	/	${MemberVO.reward_pts}</td>		
			<td>${MemberVO.spent_pts}</td>
			<td>${MemberVO.last_visit}</td>
			<td>${MemberVO.join_date}</td>
			<td>${MemberVO.act_status}
			<script>
			
			</script>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="MemberServlet">
			     <input type="submit" value="修改" class="btn btn-success">
			     <input type="hidden" name="mid" value="${MemberVO.mid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
	</table>  
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>