
var images = [
    "images/home01..jpg",
    "images/home02.jpg",
    "images/home03.jpg"
];

$(document).ready(function(){
    
    $(function() {
        $.preload(images);
    });
      $(window).load(function() {

            var window_w = $(window).width();  
            var window_h = $(window).height();  
            var content_h = $("#content").height();  
           // console.log('content_h'+content_h);
            $("#topmenu").css({width: window_w});
         //   $("#content").css({height: content_h-950});
            $("#shows01").css({'max-height':window_h});

            $('.bxslider').bxSlider({
              mode: 'fade',
              speed:3000,
              pause:6200,
              captions: true,
              auto: true,
              infiniteLoop: true,   
              onSlideBefore:function(){
               $("#tests").stop().animate({top:'0px',opacity:0},1000);
               $("#shows01 .bx-wrapper").css({'background-color':'black'});
              },
              onSlideAfter:function(){
               $("#tests").css({top:'-2000px',opacity:1});

              }              



            });   

            $('.bxslider_s3').bxSlider({
              speed:1500,
              pause:6000,
              captions: true,
              auto: true,
              easing:'easeOutCubic',
              infiniteLoop: true,     
            });   

            $('.bxslider_banner').bxSlider({
              speed:1000,
              pause:5000,
              captions: true,
              auto: true,
              infiniteLoop: true,     
            });   





            setTimeout(function(){
              
                $("#word .w1").stop().animate({height:'293px'},2500,'easeInCubic',function(){
                    setTimeout(function(){
                      $("#word .w2").stop().animate({height:'230px'},1500,'easeOutQuad',function(){
                          $("#word .w3").addClass("fadeInDown animated25");
                      });
                    }, 300);
                });

            }, 100);
            setTimeout(function(){
              $("#showdown").stop().animate({height:'51px'},1200,'easeOutCirc');
            }, 1200);


            $("#showdown").click(function() {
              $("html,body").stop().animate({ scrollTop: $("#shows02").offset().top+20 }, { duration: 800,  easing: "swing" });
            });
            if(window_w<1200){window_w=1200;}
            $("#section02").css({height: window_w / (1200/670) -100 });
            $("#section04").css({height: window_w / (1200/670) -100 });




            $("#section03 .bx-wrapper .bx-controls-direction .bx-prev").hover(function(){
                         $(this).stop().animate({backgroundPosition: '-35px 0'},500,'easeOutCubic');
                        
              }, function(){
                         $(this).stop().animate({backgroundPosition: '0 0'},500,'easeOutCubic');    });

            $("#section03 .bx-next").hover(function(){
                         $(this).stop().animate({backgroundPosition: '0 0'},500,'easeOutCubic');
              }, function(){
                         $(this).stop().animate({backgroundPosition: '-34px 0'},500,'easeOutCubic');    });



      });

      $(window).resize(function() {
                 var window_w = $(window).width();  
                 var window_h = $(window).height();  
                 $("#shows01").css({'max-height':window_h});
                 $("#topmenu").css({width: window_w});
                if(window_w<1200){window_w=1200;}
                $("#section02").css({height: window_w / (1200/670) });
                $("#section04").css({height: window_w / (1200/670) });
      });

                    $(window).scroll(function(event) {

                        var window_w = $(window).width();  
                        var window_h = $(window).height();  
                        offsetTop = $(window).scrollTop(); 
                      //  console.log(offsetTop);

                        if(offsetTop < 300){
                            $("#top").stop().animate({ opacity: 0}, { duration: 800, easing: 'swing'});//top瘨�仃
                            $("#move_btn").stop().animate({top:'-50px'},800,'easeOutCirc');
                        }else{
                            $("#top").stop().animate({ opacity: 1}, { duration: 800, easing: 'swing'});//top�箇𣶹
                            $("#move_btn").stop().animate({top:'0'},800,'easeOutCirc');
                        }

                        if(offsetTop < 350){
                            $("#showdown").stop().animate({opacity:'1'},800,'easeOutCirc');
                        }else{
                            $("#showdown").stop().animate({opacity:'0'},800,'easeOutCirc');
                        }

                        if(offsetTop > 2900){
                            $("#down_info").stop().animate({opacity:'1'},800,'easeOutCirc');
                        }else{
                            $("#down_info").stop().animate({opacity:'0'},800,'easeOutCirc');
                        }
/*
                        if(offsetTop<3400){
                          v4=offsetTop/2+100;
                          v5=offsetTop/4;
                          if(v4 < 350){
                            $("#section01 .im_02").stop().animate({ top:offsetTop/4+100 });
                          }else{
                            $("#section01 .im_02").stop().animate({ top:'320px'});
                          }
                          if(v5 < 80){
                            $("#section01 .im_01").stop().animate({ top:offsetTop/4 });
                          }else{
                            $("#section01 .im_01").stop().animate({ top:'70px' });
                          }

                          if(offsetTop>1000){
                             $("#section02 .im_01").stop().animate({ top:-offsetTop/4+250 });
                             $("#section02 .im_02").stop().animate({ top:-offsetTop/3+250 });    
                             $("#section03,#section04").stop().animate({ top:-offsetTop/3+450 });    
                             $("#section04 .im_01").stop().animate({ top:-offsetTop/4+600 });    
                             $("#footer").stop().animate({ top:-offsetTop/2.5+450 });    
                          }
                        }*/
                  });
});