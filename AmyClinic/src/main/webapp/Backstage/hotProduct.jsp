<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">熱銷產品</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><hr> 
<!--         開始 -->
<div class="container-fluid">

<!-- <div class="dropdown"> -->
<!--   Link or button to toggle dropdown -->
<!--   <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel"> -->
<!--     <li><a tabindex="-1" href="#">Action</a></li> -->
<!--     <li><a tabindex="-1" href="#">Another action</a></li> -->
<!--     <li><a tabindex="-1" href="#">Something else here</a></li> -->
<!--     <li class="divider"></li> -->
<!--     <li><a tabindex="-1" href="#">Separated link</a></li> -->
<!--   </ul> -->
<!-- </div> -->     
    <script type="text/javascript">
      // 載入視覺化應用程式設計介面和 corechart 包。
      google.charts.load('current', {'packages':['corechart']});
      //設置回檔載入谷歌視覺化 API 時運行
      google.charts.setOnLoadCallback(drawChart);
      // 回檔，創建並填充資料, 繪圖
      function drawChart() {
        // 創建資料表格
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['A', 3],
          ['B', 1],
          ['C', 1],
          ['D', 1],
          ['E', 2]
        ]);
        // 設置圖表選項
        var options = {'title':'熱銷產品圓餅圖'};
        //傳遞
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <div id="chart_div"  ></div><!--圓形圖-->
	<hr>

    <div id="number_format_chart">
    <div id="number_format_chart2">
    </div><!-- end .container-fluid -->

  <!-- end .container -->
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
<!--         結束 -->
</div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>