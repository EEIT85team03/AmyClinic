<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.proc.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap Core CSS -->
    <link href="css/sb-admin.css" rel="stylesheet"><!-- Custom CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet"><!-- Morris Charts CSS -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> <!-- Custom Fonts -->
    <script src="js/jquery.js"></script><!-- jQuery -->
    <script src="js/bootstrap.min.js"></script><!-- Bootstrap Core JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script><!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/morris.min.js"></script><script src="js/plugins/morris/morris-data.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">新增療程</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<%
 ProcVO procVO = (ProcVO) request.getAttribute("procVO");
%>
 <div class="container">
  <form class="form-horizontal" role="form" ACTION="ProcServlet"  ENCTYPE="multipart/form-data" method="post">
  
      <div class="form-group">
      <label class="control-label col-sm-2" for="pType_id">療程類別</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pType_id" placeholder="1,2,3,4,5" size="45" name="pType_id">
      </div>
    </div>
      
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">療程名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="療程中英文學名" size="45" name="name">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="fee">商品價格</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="fee" placeholder="新台幣值" size="45" name="fee">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      						<input type="hidden" name="action" value="addProduct">
        <button type="submit" class="btn btn-default">新增產品</button>
      </div>
    </div>

<!-- </form> -->
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

  </form>
</div>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>