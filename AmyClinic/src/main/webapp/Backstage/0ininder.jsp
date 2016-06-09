<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">看到老闆請面帶微笑</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->  
<!--         開始 -->
<!-- Chart.js -->
<script src="http://cdn.bootcss.com/Chart.js/2.1.4/Chart.bundle.min.js" charset="utf-8"></script>
<!-- ccchart.js -->
<script src="http://ccchart.com/js/ccchart.js" charset="utf-8"></script>
<canvas id="hoge"></canvas>
<script>
var chartdata80 = {

  "config": {
    "title": "WS Bar Chart",
    "subTitle": "WebSocketで列データをリアルタイム受信し追記描画する",
    "type": "bar",
    "maxY": 100,
    "minY": 0,
    "barWidth": 24,
    "useVal": "yes",
    "maxWsColLen": 4,
    "textColors": {"title":"#222","subTitle":"#222","hanrei":"#777","unit":"#777"
          },
    "colorSet": 
          ["red","#FF9114","#3CB000","#00A8A2","#0036C0","#C328FF","#FF34C0"],
    "shadows": {"all":["#444",5,5,5]}
  },

  "data": [
    ["種別"],
    ["朝"],
    ["昼"],
    ["夜"]
  ]
};

  ccchart.wsCloseAll();//一旦クリア

  ccchart
      .init('hoge', chartdata80,
        function () {
          this
            .ws('ws://ccchart.com:8017')
            .on('message', ccchart.wscase.someColsAtATime)
        }
      );

</script>

<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper --> 
        <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->


</body>
</html>