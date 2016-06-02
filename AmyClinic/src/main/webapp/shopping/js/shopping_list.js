addEvent(window, "load", sortables_init);


function upd(key,quantity,index) {
			var amount;
			$.ajax({
				"type":"get",
				"url":"ProductSearchServlet",
				"data":{"pid" : key , "action" : "getById"},
				"async":false,
				"success":function(data){
					amount = data.amount;
				}
				
			})
			
			var price = $('#pri'+index).val();
			var newQty = $("#send_qty" + index).val();

			if(newQty < 0) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
			if(newQty == 0) {
				alert('請點刪除按鈕刪除');
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量與舊數量相同
			if(newQty == quantity) {
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量超過庫存量
			if((amount - newQty) < 0) {
				alert('庫存量不足！');
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
		//使用者輸入非數字及0開頭的數字	
			var patt = /^[1-9][0-9]*$/;
			if(!patt.test(newQty)) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
		//都通過才送到Servlet處理，如果成功就更改數量，發生例外回傳修改失敗訊息	
			$.ajax({
					"type":"post",
					"url":"UpdateOIProdServlet",
					"data":{"action" : 'update' , "pid" : key , "newQy" : newQty , "amount" : amount , "quantity" : quantity},
					"success":function(data){
						$("#send_qty" + index).attr("value",newQty);
						$("#send_qty" + index).val(newQty);
						$("#subtotal" + index).empty();
						$("#subtotal" + index).append((price * newQty).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
						location.reload();
						return;
					},
					"error":function(data){
						alert("修改失敗！");
						$("#send_qty" + index).val(quantity);
						$("#subtotal" + index).empty();
						$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
						return;
					}
					
				})
		}
		
		//從購物車內把某商品刪掉
		function del(key) {
			if(confirm("確定要刪除此項商品嗎？")) {
				$.ajax({
					"type":"post",
					"url":"UpdateOIProdServlet",
					"data":{"action" : 'delete', "pid" : key},
					"success":function(data){
						alert("已刪除！");
						location.reload();
					}
				})
			}
		}
		
		
		$(function() {
			
			//繼續購物
			$('#continue').click(function(){
				window.location.href = "prod_list.jsp";
			})
			
			//確認無誤
			$('#confirm').click(function(){
				if(confirm("確認無誤？")) {
					window.location.href = "CheckServlet";
					
				} 
				
			})
			
			//放棄購物，請Servlet把ShoppingCart物件刪掉
			$('#abandon').click(function(){
				if(confirm("要放棄購物嗎？")) {
					$.ajax({
						"type":"post",
						"url":"AbanShoppingServlet",
						"success":function(data){
							alert("已放棄購物！");
							window.location.href = "prod_list.jsp";
						}
					})
				} 
			})
		})