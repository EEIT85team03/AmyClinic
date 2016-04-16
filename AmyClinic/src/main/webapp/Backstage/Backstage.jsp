<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>無標題文件</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #FFFFFF;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ 元素/標籤選取器 ~~ */
ul, ol, dl { /* 由於瀏覽器之間的差異，最佳作法是在清單中使用零寬度的欄位間隔及邊界。為了保持一致，您可以在這裡指定所要的量，或在清單包含的清單項目 (LI、DT、DD) 上指定所要的量。請記住，除非您寫入較為特定的選取器，否則在此執行的作業將重疊顯示到 .nav 清單。 */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* 移除上方邊界可以解決邊界可能從其包含的 Div 逸出的問題。剩餘的下方邊界可以保持 Div 不與接在後面的元素接觸。 */
	padding-right: 15px;
	padding-left: 15px; /* 將欄位間隔加入至 Div 內元素的兩側 (而不是 Div 本身)，即可不需執行任何方塊模型的計算作業。具有側邊欄位間隔的巢狀 Div 也可當做替代方法。 */
}
a img { /* 這個選取器會移除某些瀏覽器在影像由連結所圍繞時，影像周圍所顯示的預設藍色邊框 */
	border: none;
}

/* ~~ 網站連結的樣式設定必須保持此順序，包括建立滑過 (Hover) 效果的選取器群組在內。~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非您要設定非常獨特的連結樣式，否則最好提供底線，以便快速看出 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 這個選取器群組可以讓使用鍵盤導覽的使用者，也和使用滑鼠的使用者一樣擁有相同的滑過體驗。 */
	text-decoration: none;
}

/* ~~這個固定寬度的容器環繞著其他 Div~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* 兩側的自動值與寬度結合後，版面便會置中對齊 */
}

/* ~~ 頁首沒有指定的寬度，而會橫跨版面的整個寬度。頁首包含影像預留位置，必須由您自己的連結商標加以取代 ~~ */
.header {
	background-color: #ADB96E;
}

/* ~~ 這是版面的欄位。~~ 

1) 欄位間隔只會置於 Div 的頂端或底部。這些 Div 內的元素在兩側會有欄位間隔，可讓您不需進行「方塊模型計算」。請記住，如果對 Div 本身加入任何側邊的欄位間隔或邊框，在計算「總」寬度時，就會將這些加入您定義的寬度。您也可以選擇移除 Div 中元素的欄位間隔，然後在其中放置沒有寬度的第二個 Div，並依設計所需放置欄位間隔。

2) 尚未為這些欄位提供邊界，因為它們全都是浮動的。如果必須加入邊界，請避免將其放在浮動方向的一側 (例如將右邊界放在設定為向右浮動的 Div 上)。在許多時候，您都可以改用欄位間隔。對於必須違反此規則的 Div，您應該在 Div 的規則中加入 "display:inline" 宣告，以防止某些版本的 Internet Explorer 將邊界加倍。

3) 因為可在文件中多次使用類別 (也可對單一的元素套用多個類別)，所以已為欄位指定類別名稱，而非 ID。例如，您可在必要時將兩個側邊列 Div 堆疊起來。如有需要，也可以將這些名稱輕鬆地變更為 ID (只要您在每份文件中只使用一次)。

4) 如果想要將導覽放在右方而非左方，只要將這些欄設定為往反方向浮動 (全部往右，而非全部往左)，它們就會以相反順序呈現。您不需要在 HTML 原始碼中移動 Div。

*/
.sidebar1 {
	float: left;
	width: 180px;
	background-color: #FFFFFF;
	padding-bottom: 10px;
}
.content {

	padding: 10px 0;
	width: 780px;
	float: left;
}

/* ~~ 這個群組選取器會在 .content 區域空間中提供清單 ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* 這個欄位間隔反映出上方標題和段落規則中的右方間隔。當欄位間隔位於下方時，便可將清單中的其他元素間隔開來；當位於左方時，則可藉此建立縮排。這些動作均可依需要進行調整。 */
}

/* ~~ 導覽清單樣式 (如果選擇使用 Spry 之類的預製飛出選單，則可移除) ~~ */
ul.nav {
	list-style: none; /* 這會移除清單標記 */
	border-top: 1px solid #666; /* 這會建立連結的上方邊框，其他則都會使用下方邊框放置在 LI 上 */
	margin-bottom: 15px; /* 這會在下方的內容上建立導覽間的間距 */
}
ul.nav li {
	border-bottom: 1px solid #666; /* 這會建立按鈕分隔 */
}
ul.nav a, ul.nav a:visited { /* 將這些選取器放入群組，即可確保您的連結即使在受到點擊後仍保有按鈕外觀 */
	padding: 5px 5px 5px 15px;
	display: block; /* 這會為連結提供區塊屬性，使連結能填滿包含它的整個 LI，讓整個區域都能回應滑鼠點按動作。 */
	width: 160px;  /*這個寬度使整個按鈕都可用於 IE6 的點按動作。如果不需要支援 IE6，就可將其移除。請從側邊列容器的寬度減去此連結的間距來計算適當的寬度。 */
	text-decoration: none;
	background-color: #3399FF;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* 這會同時變更滑鼠及鍵盤導覽器的背景及文字顏色 */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ 頁尾 ~~ */
.footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* 這會為 IE6 提供 hasLayout 以進行適當的清除動作 */
	clear: both; /* 這個 clear 屬性可以強制 .container 辨識欄結束於何處以及包含欄的位置 */
}

/* ~~ 其他 float/clear 類別 ~~ */
.fltrt {  /* 這個類別可用來讓元素在頁面中浮動，浮動的元素必須位於頁面上相鄰的元素之前。 */
	float: right;
	margin-left: 8px;
}
.fltlft { /* 這個類別可用來讓元素在頁面左方浮動，浮動的元素必須位於頁面上相鄰的元素之前。 */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* 這個類別可放置在 <br /> 或空白的 Div 上，當做接在 #container 內最後一個浮動 Div 後方的最後一個元素 (如果從 #container 移除或取出 #footer) */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
-->
</style></head>

<body>

<div class="container">
  <div class="header"><a href="#"><img src="http://zippy.gfycat.com/MedicalBrownFoxhound.gif" alt="在這裡插入商標" name="Insert_logo" width="180" height="90" id="Insert_logo" style="background-color: #FFFFFF; display: block;" />
    <!-- end .header --></div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="#">前台管理</a></li>
      <li><a href="#">療程管理</a></li>
      <li><a href="#">預約系統</a></li>
      <li><a href="#">醫師排班</a></li>
      <li><a href="#">會員管理</a></li>
      <li><a href="#">商品管理</a></li>
      <li><a href="#">客服系統</a></li>
      <li><a href="#">員工管理</a></li>
      <li><a href="#">熱門療程</a></li>
      <li><a href="#">熱門產品</a></li>
    </ul>
    
    <!-- end .sidebar1 --></div>
  <div class="content">
    <h1>說明</h1>
    <p>請注意，這些版面的 CSS 都有詳細的註解。如果您是在「設計」檢視中進行大部分的作業，可以看一下程式碼來取得有關使用固定版面 CSS 的提示。您可以在啟動您的網站之前，將這些註解移除。有關這些 CSS 版面所使用的技巧之詳細資訊，請至 Adobe 開發人員中心閱讀本文 - <a href=http://www.adobe.com/go/adc_css_layouts">http://www.adobe.com/go/adc_css_layouts</a>。您可以在啟動您的網站之前，將這些註解移除。有關這些 CSS 版面所使用的技巧之詳細資訊，請至 Adobe 開發人員中心閱讀本文 - <a href=http://www.adobe.com/go/adc_css_layouts">http://www.adobe.com/go/adc_css_layouts</a></p>
    <h2>清除方法</h2>
    <p>因為所有的欄都是浮動的，所以這個版面會在 .footer 規則中使用 clear:both 宣告。這項清除技巧可強制 .container 辨識欄結束的位置，以顯示放置在 .container 上的任何邊框或背景顏色。如果您的設計需要您從 .container 移除 .footer，就需要使用其他的清除方法。最可靠的方法是在最後的浮動欄之後 (但在 .container 結束之前) 加入 &lt;br class="clearfloat" /&gt; or &lt;div class="clearfloat"&gt;&lt;/div&gt;，這樣就會產生相同的清除效果。</p>
    <h3>商標取代</h3>
    <p>在此版面的 .header 中，會在您要放置商標的位置使用影像預留位置。建議您移除該預留位置，並使用自己的連結商標加以取代。 </p>
    <p> 請注意，如果要使用「屬性」檢視窗使用 SRC 欄位導覽到商標影像 (而不是移除並取代預留位置)，則必須將行內背景和顯示屬性移除。這些行內樣式只會在瀏覽器中用來顯示商標預留位置，以便達到示範的目的。 </p>
    <p>若要移除行內樣式，請確定「CSS 樣式」面板已設定為「目前」。選取該影像，然後在「CSS 樣式」面板的「屬性」窗格中，以滑鼠右鍵按一下顯示及背景屬性並加以刪除 (當然，您也可以直接到程式碼中刪除影像或預留位置的行內樣式)。</p>
    <h4>背景</h4>
    <p>就本質而言，任何 Div 上的背景顏色都只會顯示內容的長度。這代表如果您使用背景顏色或邊框來建立側欄，側欄將無法延伸整個頁尾的寬度，而會停止在內容結束處。如果 .content Div 總會包含較多的內容，您就可以在 .content Div 上放置邊框，將其與欄分隔。</p>
    <!-- end .content --></div>
  <div class="footer">
    <p>E-amil:xxx@gmail.com   Tel:0999-999-999   Hello-Word國際碼業集團   © 2016 EEIT85team03</p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>