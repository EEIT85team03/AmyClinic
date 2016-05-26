<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.product.model.*"%>
<%@page import="group3.carrie.catagory.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div id="page-wrapper"><!-- Page Heading -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header" >本月目標<font color="red">30億</font>
                       </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">修改療程</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<%
ProductVO productVO = (ProductVO) request.getAttribute("productVO");
ProductService product = new ProductService();
List<ProductVO> list = product.getAll();
pageContext.setAttribute("list",list);
// CatagoryVO catagoryVO;
CatagoryService cataServ  = new CatagoryService();
List<CatagoryVO> catagorys = cataServ.getAll();
pageContext.setAttribute("catagorys", catagorys);
%>
 <div class="container">
  
  <form class="form-horizontal" role="form" ACTION="ProductServlet"  ENCTYPE="multipart/form-data" method="post">
  	  
  	  <div class="form-group">
      <label class="control-label col-sm-2" for="pid">療程編號</label>
      <div class="col-sm-10">          
        <input type="text"  class="form-control" id="pid"  size="45" name="pid"  readonly value="<%=productVO.getPid()%>"     >
      </div>
    </div>
  	  
      <div class="form-group">
      <label class="control-label col-sm-2" for="cid">療程類別</label>
      <div class="col-sm-10">          
<%--         <input type="text" class="form-control" id="cid" placeholder="10,20,30,40,50" size="45" name="cid" value="<%=productVO.getCatagoryVO()%>" /> --%>
  
      <select size="1"  name="cid">
      <c:forEach var="catagoryVO" items="${catagorys}">
				<option  value="${catagoryVO.cid}" ${(productVO.pid==catagoryVO.cid)?'selected':'' } >${catagoryVO.name}
	  </c:forEach>
      </select>
      
      </div>
    </div>
      
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">療程名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="中英文學名" size="45" name="name" value="<%=productVO.getName()%>" />
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">療程價格</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="price" placeholder="整數數字" size="45" name="price"  value="<%=productVO.getPrice()%>" />
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      						<input type="hidden" name="action" value="update">
        <button type="submit" class="btn btn-default">修改產品</button>
      </div>
    </div>

</script>

<%-- 錯誤表列 --%>
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<%-- 錯誤表列 --%>
    
  </form>
</div>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>