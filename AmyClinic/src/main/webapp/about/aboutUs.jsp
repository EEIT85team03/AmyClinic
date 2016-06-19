<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>關於愛美</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="author" content="Codrops" />     
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/doctor/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/doctor/js/modernizr.custom.53451.js"></script>
		<style type="text/css">
		.container{
/* 		background-image: url("/AmyClinic/images/b1.jpg"); */
/*         background-repeat: no-repeat; */
/*         background-attachment: fixed; */
/*         background-position: center; */
/*         background-size: cover; */
/*         width: 100%; */
/*         top:300px; */
		 }
		img{
		height: 100%;
		}
		.dg-container span{
		font-size: 30px;
 		background-color:#EBD3E8;  
		color:#FF359A ;
		}
/* 		.dg-container span span{ */
/*  		background-color: green; */
/* 		color: black; */
/* 		} */
/* 		#footer-bgcontent { */
/* 		height: 99px; */
/* 		background: #e499ba; */
/* 		position: absolute; */
/* 		right: 0; */
/* 		left: 0; */
/* 		padding: 1rem; */
/* 		text-align: center;	 */
/* } */
/* #allpage { */
/* 	width: 1200px; */
/* 	margin: 0 auto; */
/* } */


.img{
width: 210px;
}
.myimg{
float: right;
}
.in{
width: 1000px;
margin: 0px auto;
}

h2{
font-size: 28px;
font-family:myfont;
color: 	#9F0050;
}
h3{
font-size: 20px;
font-family: 微軟正黑體;
color: 	#FF0080;
}

.font{
margin-left:10px;
width: 600px;
float: left;
/* background-color: #E0E0E0; */
/* padding: 20px; */
/* border-radius:10px; */
line-height: 0px;
}

		</style>
		
    </head>
    <body>
    <jsp:include page="/General/header.jsp"></jsp:include>
    <div id="allpage">

        <div class="container">	
        <div class='in'><br>
         <jsp:include page="/General/sidebar.jsp"></jsp:include>
        <div  class="myimg"><br><br><br><br>
        <img src="${pageContext.request.contextPath}/images/home07.jpg" alt="愛美診所" class="img"><br>
        <img src="${pageContext.request.contextPath}/images/amy.jpg" alt="愛美櫃台" class="img">
        </div>
        <div class="font">
      <div>
<h2 >愛美是人的天性，由內而外打造幸福人生</h2>
<h3>傾聽客戶的需求、量身打造獨一無二”愛美”</h3>
<h3>療程是我們堅持的理念。</h3>
<h3 >至今已服務數十名愛美人</h3>
<h3>看到客戶臉上漾起幸福滿溢的笑容，經常令我們感動。</h3><br>

<h3 >Amy愛美醫美診所進行醫療美容專科服務已逾40天，</h3>
<h3 >近年更網羅國內外整形界專家組成尊爵級夢幻醫療團隊！</h3><br>
<h3 >Amy愛美鍥而不捨舉辦大大小小整型教學演講，</h3>
<h3 >為將最先進、最正確的醫美新資普及，</h3>
<h3 >使民眾不再因資訊不對等所苦，診所內教學團隊</h3>
<h3>常受邀中華民國美容醫學會、台灣顏面整形重建外科醫學會、</h3>
<h3 >台灣自體脂肪移植醫學會等進行教學講座，</h3>
<h3 >期待Amy愛美將小小的幸福火炬透過傳授技術及臨床經驗燃起台灣醫美界的榮光！</h3>
<br><br><br>
       </div>
</div>
        
        </div>
		</div>
		</div>
		<jsp:include page="/General/footer.jsp"></jsp:include>
    </body>
</html>