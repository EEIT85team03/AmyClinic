// JavaScript Document

$(document).ready(function(){
 


                 /*set*/
                 var window_w = $(window).width();  
                 var window_h = $(window).height();  
             
                 if(window_w<1250){
         /*         $("#menu").css({width:"570px"});
                  $("#menu li").css({width:"120px"});*/
                 }
                 //menu ���
            /*    $(".menu01").hover(function(){
                $(this).addClass("fadeInLeft animated");
                  }, function(){
                $(this).removeClass('fadeInLeft animated');
                });*/



                $(window).load(function() {


                //  $("#move_menu .block").css({'margin-left':- $("#move_menu .block").width()/2});//蝵桐葉
                  $("#move_menu").find('.img').css({opacity:0});

                  $("#load").animate({opacity:0},1000,function(){
                       $("#load").hide();
                  });

                  $("#content").animate({opacity:1},1000);
                  /*蝘駁��餃��𥕦�*/
                  $("._menu_hover").each(function(){
                    var img1 = $(this).find('IMG').eq(0);
                    img1.css({'z-index':'2','position':'absolute',top:0,left:0}).show();
                    var img2 = $(this).find('IMG').eq(1);
                    img2.css({'z-index':'1','position':'absolute',top:0,left:0}).show();
                    $(this).hover(
                      function(){
                        if ($(this).hasClass('stop')) return false;
                        img1.stop().animate({opacity: '0'},500,function(){});
                        img2.stop().animate({opacity: '1'},500,function(){});
                      },
                      function(){
                        if ($(this).hasClass('stop')) return false;
                        img1.stop().animate({opacity: '1'},800,function(){});
                        img2.stop().animate({opacity: '0'},800,function(){});
                      }
                    );
                   });  

                  $("._menu_hover2").each(function(){
                    var img1 = $(this).find('span').eq(0);
                    img1.css({'z-index':'2','position':'absolute',top:0,left:0}).show();
                    var img2 = $(this).find('span').eq(1);
                    img2.css({'z-index':'1','position':'absolute',top:0,left:0}).show();
                    $(this).hover(
                      function(){
                        if ($(this).hasClass('stop')) return false;
                        img1.stop().animate({opacity: '0'},500,function(){});
                        img2.stop().animate({opacity: '1'},500,function(){});
                      },
                      function(){
                        if ($(this).hasClass('stop')) return false;
                        img1.stop().animate({opacity: '1'},800,function(){});
                        img2.stop().animate({opacity: '0'},800,function(){});
                      }
                    );
                   });  



                  $("#topmenu #link_home").stop().animate({opacity:'1'},1200,function() {//home��
                    $("#topmenu #link_home").stop().animate({width:'262px'},1800);
                  });

                  var menu_length=$("#move_menu .block a").length;
                  $("#move_menu .block a").css({width:(1100/menu_length)-1});



                  if($("#top_pic .main").length >0 ){

                 //   $("#top_pic .main").addClass("pulse_p animated");
                      setTimeout(function(){
                         $("#top_pic .word").addClass("fadeInDown animated25").stop().animate({opacity:1});
                      }, 800);

                  }




                });




                //閬𣇉��齿鰵蝮格𦆮
               $(window).resize(function() {
                 var window_w = $(window).width();  
                 var window_h = $(window).height();  
                 var bot_contact= $("#contact").width();  
              //   $("#move_menu .block").stop().animate({'margin-left':- $("#move_menu .block").width()/2});//蝵桐葉
                // console.log("nowindex");
                 if(window_w<1100){window_w=1100;}
            /*     if(window_w<1250){
                  $("#menu").css({width:"570px"});
                  $("#menu li").css({width:"120px"});
                 }else{
                  $("#menu").css({width:"690px"});
                  $("#menu li").css({width:"150px"});
                 }*/


                 
               });
                //閬𣇉��齿鰵蝮格𦆮 蝯鞉�





                    $(window).scroll(function(event) {
                        var content_h= $('#content').height();  
                        var window_w = $(window).width();  
                        var window_h = $(window).height();  
                        offsetTop = $(window).scrollTop(); 
                        if(offsetTop < 450){
                            $("#top").stop().animate({ opacity: 0}, { duration: 800, easing: 'swing'});//top瘨�仃
                            $("#move_btn").stop().animate({top:'-50px'},800,'easeOutCirc');
                        }else{
                            $("#top").stop().animate({ opacity: 1}, { duration: 800, easing: 'swing'});//top�箇𣶹
                            $("#move_btn").stop().animate({top:'0'},800,'easeOutCirc');
                        }

                  





                        if($("#innet_menu").length >0 ){

                          $("#top_pic .main").addClass("pulse_p animated");
                            setTimeout(function(){
                               $("#top_pic .word").addClass("fadeInDown animated25");
                            }, 800);
                            if(offsetTop<500){
                              if(offsetTop<1230){
                                $("#top_pic .main").stop().animate({top:-offsetTop/8});
                                $(".mains_block").stop().animate({top:-offsetTop/2,'margin-bottom':-offsetTop/2});
                              }else{
                                 $("#top_pic .main").stop().animate({top:-offsetTop/4});
                                $(".mains_block").stop().animate({top:-offsetTop/2,'margin-bottom':-offsetTop/2});                               
                              }

                           // $("#footer").stop().animate({top:-offsetTop/2});      

                            }
                        }


                        if($("#product_in").length >0 ){
                            if(offsetTop<500){
                            $(".topimg").stop().animate({top:-offsetTop/4});
                            $(".product_info").stop().animate({top:-offsetTop/2,'margin-bottom':-offsetTop/2});
                            
                            }
                            $(".product_info .bg").stop().animate({top:-offsetTop/4});

                        }



                    //暺鮋��𧼮�����
                    $("#top").click(function() {
                        $("html,body").stop().animate({ scrollTop: 0 }, { duration: 1500,  easing: "swing" });
                        $("#top").stop().animate({ opacity : 0 });
                    });  






                  });





    
    // $(".infb").hover(function(){
    //              $(this).addClass('fadeIn animated');
    //   }, function(){
    //              $(this).removeClass('fadeIn animated');
    // });




    $("#move_menu a").hover(function(){
                 $(this).css({color:'white','background-color':'#ff3c00',   '-webkit-transition':' all 0.5s ease','-moz-transition':' all 0.5s ease','-o-transition':' all 0.5s ease','-ms-transition': 'all 0.5s ease' });
      }, function(){
                 $(this).css({color:'#888888','background-color':'white',    '-webkit-transition':' all 0.5s ease','-moz-transition':' all 0.5s ease','-o-transition':' all 0.5s ease','-ms-transition': 'all 0.5s ease' });  
    });





});

