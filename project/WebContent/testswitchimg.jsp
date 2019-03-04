<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>导航</title>
<style type="text/css">
   *{margin:0;padding:0;}
   .clearfix: after{ content:"";display:block;clear:both;}
   #banner{width:725px;height:360px;margin:0 auto;overflow:hidden;background-color:white;border:1px red solid;margin-top:10px;margin-left:10px;position:relative;}
   #banner:hover>.spanner_arrow #pre{background-color:rgba(10,10,10,0.3);}
   #banner:hover>.spanner_arrow #next{background-color:rgba(10,10,10,0.3);}
   #banner_imgs {width:5075px;height:360px;position:absolute;}  
   #banner_imgs img{width:725px;height:360px;display:inline-block;float:left;position:relative;}
   .banner_buttons{position:absolute;width:725px;text-align:center;bottom:5px;left:0px;}
   .banner_buttons span{width:20px;height:20px;background-color:blue;
   display:inline-block;border-radius:20px;margin:2px 5px;}
   .banner_buttons .on{background-color:green;}
   #pre{width:50px;height:50px;float:left;background-color:rgba(10,10,10,0.1);text-align:center;line-height:50px;color:#FFF;cursor:pointer;position:absolute;left:10px;top:150px;}
   #next{width:50px;height:50px;float:right;background-color:rgba(10,10,10,0.1);text-align:center;line-height:50px;color:#FFF;cursor:pointer;position:absolute;right:10px;top:150px;}
   
</style>
 
<script type="text/javascript">
   window.onload=function(){
	    var banner=document.getElementById('banner');
	    var pre=document.getElementById('pre');
		var next=document.getElementById('next');
		var banner_imgs=document.getElementById('banner_imgs');
		var buttons_list=document.getElementsByClassName('banner_buttons');
		var buttons= buttons_list.item(0).getElementsByTagName('span');		
		var index=1;
		var animated=false;
		var timer;
		
		function showButtons(){
		     for(var i=0;i<buttons.length;i++){
			     if(buttons[i].className=='on'){
				      buttons[i].className='';
					  break;	 
				}
			 }	  
			 buttons[index-1].className='on';
		}
		
		function animate(offset){
			animated=true;
			var newList= parseInt(banner_imgs.style.left)+offset;		
			function go(){
			    var time=500;
		        var interval=100;
			    var speed=offset/(time/interval);
				if((speed<0&&parseInt(banner_imgs.style.left)>newList)||(speed>0&&parseInt(banner_imgs.style.left)<newList)){
					 banner_imgs.style.left=parseInt(banner_imgs.style.left)+speed+'px';
				     setTimeout(go,interval);
				}
				else{
				   	banner_imgs.style.left=newList+'px';
					if(newList>-725){
						banner_imgs.style.left=-3625+'px';
			        }
			        if(newList<-3625){
						banner_imgs.style.left=-725+'px';	
			        }	
					animated=false;
				}
 
			}
			go();
	    }
		pre.onclick = function(){
				if(!animated){
				   if(index==1){
				   index=5;	
				   }
				   else{
				   index -= 1;
				   }
                   showButtons();
				   animate(725);
				}			
	    }
		next.onclick = function(){
			if(!animated){
			    if(index==5){
				   index=1;
				}
				else{
				  index += 1;
				}
		        showButtons();
				animate(-725);
			}
		     
	
		}
		for(var i=0;i<buttons.length;i++){
			 if(!animated){
		      buttons[i].onclick=function(){
				 if(this.className=='on'){
				    return;	 
				 }				 
				 var currentIndex=parseInt(this.getAttribute('index'));
			     var offset=-725*(currentIndex-index);
				 
				 	 animate(offset);
				 	
			     index=currentIndex;
                 showButtons();	 
		       }
		    }
	   }
		
	   function play(){
		 timer = setInterval(function(){
			      next.onclick();
			   },3000);
	   }
	   
	   function stop(){
	      clearInterval(timer); 
	   }
	   banner.onmouseover=stop;
	   banner.onmouseout = play;
	   play(); 
  }
</script>
</head>
<body>
   <div id='banner'  class="comWidth">
       <div id="banner_imgs" style="left:-725px;background-color:white;" class="clearfix">
           <a href="#"><img src="images/s5.png" alt=""></a>
           <a href="#"> <img src="images/s1.png" alt=""></a>
           <a href="#"><img src="images/s2.png" alt=""></a>           
           <a href="#"><img src="images/s3.png" alt=""></a>
            <a href="#"><img src="images/s4.png" alt=""></a>
            <a href="#"><img src="images/s5.png" alt=""></a>
            <a href="#"><img src="images/s1.png" alt=""></a>
       </div>
       <div class="banner_buttons">
          <span index="1" class="on"></span>
          <span index="2"></span>
          <span index="3" ></span>
          <span index="4" ></span>
          <span index="5"></span>
       </div>
       <div class="spanner_arrow clearfix">
          <span id="pre"><</span>
          <span id="next">></span>
       </div>
   </div>
   
</body>
</html>