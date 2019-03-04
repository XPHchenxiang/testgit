<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  language="java" %>
<%@ page import="com.project.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="..css/main.css" type="text/css"/>
<script src="js/jquery-3.3.1.min.js"  type="text/javascript"></script>
<title>欢迎来到主页面</title>

<style type="text/css">
   *{margin:0;padding:0;}
   .clearfix: after{ content:"";display:block;clear:both;}
   #banner{width:1320px;height:550px;margin:0 auto;overflow:hidden;margin-top:2px;margin-left:2px;position:relative;}
   #banner:hover>.spanner_arrow #pre{background-color:rgba(10,10,10,0.3);}
   #banner:hover>.spanner_arrow #next{background-color:rgba(10,10,10,0.3);}
   #banner_imgs {width:9240px;height:550px;position:absolute;}  
   #banner_imgs img{width:1320px;height:550px;display:inline-block;float:left;position:relative;}
   .banner_buttons{position:absolute;width:1320px;text-align:center;bottom:5px;left:0px;}
   .banner_buttons span{width:20px;height:20px;background-color:blue;
   display:inline-block;border-radius:20px;margin:2px 5px;}
   .banner_buttons .on{background-color:green;}
   #pre{width:50px;height:50px;float:left;background-color:green;text-align:center;line-height:50px;color:white;cursor:pointer;position:absolute;left:10px;top:250px;}
   #next{width:50px;height:50px;float:right;background-color:green;text-align:center;line-height:50px;color:white;cursor:pointer;position:absolute;right:10px;top:250px;}  
</style>

<script type="text/javascript">
		//图片轮播区
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
			          }else{
			        	    banner_imgs.style.left=newList+'px';
				      if(newList>-1320){
					        banner_imgs.style.left=-6600+'px';
		              }
		              if(newList<-6600){
					        banner_imgs.style.left=-1320+'px';	
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
			          }else{
			                index -= 1;
			          }
                      showButtons();
			          animate(1320);
			   }			
         }
	     next.onclick = function(){
		        if(!animated){
		              if(index==5){
			                 index=1;
			          }else{
			                 index += 1;
			          }
	                  showButtons();
			          animate(-1320);
		         }
	      }
	             for(var i=0;i<buttons.length;i++){
		                if(!animated){
	                          buttons[i].onclick=function(){
			                         if(this.className=='on'){
			                               return;	 
			                         }				 
			                  var currentIndex=parseInt(this.getAttribute('index'));
		                      var offset=-1320*(currentIndex-index);
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

		//获取当前系统时间显示
		setInterval("showTime()",1000);
		function showTime(){
   			 nowtime=new Date();
   			 year=nowtime.getFullYear();
    		 month=nowtime.getMonth()+1;
    		 date=nowtime.getDate();
    		 document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
		}

		function selectIndex(id){
				//获取下拉框的dom元素
				var selectObj = document.getElementById("selectEvent");

				//获取索引
				var index = selectObj.selectedIndex;

				//取text值
				var info = selectObj.options[index].text;

 				//取value值需要索引
				var value = selectObj.options[index].value; 
 				if(value=="0"){
						document.getElementById("info").value = "";
						document.getElementById("showMessage").innerHTML="请选择地区进行查询！"
						document.getElementById("showMessage").style.color = "red";
						document.getElementById("showMessage").style.display = "inline";		
						setTimeout(function(){document.getElementById("showMessage").style.display="none"},3000);	
 				}else{
 						document.getElementById("info").value = info;
 				}
		}
		
		function logout(){
				location.href="logout";
		}
		
		function editinfo(userName,userAge,userAddress,userSex,userCellPhone,userJob,userDepartment){
			    location.href="editempinfo.jsp?uname="+encodeURI(userName)+"&uage="+userAge+"&uaddress="+encodeURI(userAddress)+"&usex="+encodeURI(userSex)+"&ucellphone="+encodeURI(userCellPhone)+"&ujob="
			    		+encodeURI(userJob)+"&udepartment="+encodeURI(userDepartment);
		}
				
		function flash(){
				document.getElementById("default-div").style.display = "none";
				document.getElementById("main-div1").style.display="inline";
				var tbody = document.getElementById("tbody-result");
				if(document.getElementById("info").value ==""|| document.getElementById("info").value ==null){
						$.ajax({
								type:"post",
								url:"flash",
								async:false,
								data:{},
								dataType:"json",
								success:function(json){
									array = json;
									document.getElementById("left-div1").style.display = "inline";
									document.getElementById("table-title").style.display = "inline";
									var str = "";
									var n=1;
									for(var i in json){
										var userName = json[i].userName;
										var userAge =json[i].age ;
										var userAddress =json[i].address ;
										var userSex =json[i].sex ;
										var userCellPhone =json[i].cellPhone ;
										var userJob = json[i].job;
										var userDepartment =json[i].department ;
										str +="<tr>" 
											+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;border-left:1px solid gray;'>" +n+"</td>"
											+"<td align='center' style='width:136px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" + json[i].userName + "</td>"
											+"<td align='center' style='width:46px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].age+ "</td>"
											+"<td align='left' style='width:545px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].address +"</td>"
											+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].sex + "</td>"
											+"<td align='center' style='width:167px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].cellPhone +"</td>"
											+"<td align='center' style='width:108px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].job +"</td>"
											+"<td align='center' style='width:94px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].department +"</td>"
											+"<td align='left' style='width:95px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>"  
												+"<input type='button'  onclick='deleteinfo(\""+userName+"\")'  style='width:42px;height:33px;background-image:url(images/delete.png);top:1px;'>"
												+"<input type='button'  style='width:42px;height:33px;background-image:url(images/edit.png);top:1px'   onclick=\"editinfo('"+userName+"','"+userAge+"','"+userAddress+"','"+userSex+"','"+userCellPhone+"','"+userJob+"','"+userDepartment+"')\">"
											"</td>"
											+"</tr>";
											n++;				
									}
									tbody.innerHTML = str;
								},
								error:function(){}
						})
				}else{
					 	document.getElementById("left-div1").style.display = "inline";
						$.ajax({
								type:"get",
								url:"flash",
								async:false,
								data:{"userAddress":document.getElementById("info").value},
								dataType:"json",
								success:function(json){
									array = json;
									var str = "";
									var n=1;
									for(var i in json){
										var userName = json[i].userName;
										var userAge =json[i].age ;
										var userAddress =json[i].address ;
										var userSex =json[i].sex ;
										var userCellPhone =json[i].cellPhone ;
										var userJob = json[i].job;
										var userDepartment =json[i].department ;
										str +="<tr>" 
										+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;border-left:1px solid gray;'>" +n+"</td>"
										+"<td align='center' style='width:136px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" + json[i].userName + "</td>"
										+"<td align='center' style='width:46px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].age+ "</td>"
										+"<td align='left' style='width:545px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].address +"</td>"
										+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].sex + "</td>"
										+"<td align='center' style='width:167px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].cellPhone +"</td>"
										+"<td align='center' style='width:108px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].job +"</td>"
										+"<td align='center' style='width:94px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].department +"</td>"
										+"<td align='center' style='width:95px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>"  
											+"<input type='button'  onclick='deleteinfo(\""+userName+"\")'  style='width:42px;height:33px;background-image:url(images/delete.png);padding-top:0px;'>"
											+"<input type='button'  style='width:42px;height:33px;background-image:url(images/edit.png);top:1px'   onclick=\"editinfo('"+userName+"','"+userAge+"','"+userAddress+"','"+userSex+"','"+userCellPhone+"','"+userJob+"','"+userDepartment+"')\">"
											"</td>"
										+"</tr>";
										n++;								
									}
									document.getElementById("table-title").style.display = "inline";
									tbody.innerHTML = str;	
								},
								error:function(){}
						})
				}
		}
		
		function deleteinfo(userName){
			$.ajax({
				type : "post",
				url : "deletestuinfo",
				async:false,
				data :{"name": userName},
				dataType : "json",
				success:function(json){
					array = json;
					var str = "";
					var n=1;
					for(var i in json){
						var userName = json[i].userName;
						var userAge =json[i].age ;
						var userAddress =json[i].address ;
						var userSex =json[i].sex ;
						var userCellPhone =json[i].cellPhone ;
						var userJob = json[i].job;
						var userDepartment =json[i].department ;
						str +="<tr>" 
						+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;border-left:1px solid gray;'>" +n+"</td>"
						+"<td align='center' style='width:136px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" + json[i].userName + "</td>"
						+"<td align='center' style='width:46px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].age+ "</td>"
						+"<td align='left' style='width:545px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].address +"</td>"
						+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].sex + "</td>"
						+"<td align='center' style='width:167px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].cellPhone +"</td>"
						+"<td align='center' style='width:108px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].job +"</td>"
						+"<td align='center' style='width:94px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].department +"</td>"
						+"<td align='center' style='width:95px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>"  
							+"<input type='button'  onclick='deleteinfo(\""+userName+"\" )'  style='width:42px;height:33px;background-image:url(images/delete.png);padding-top:0px;'>"
							+"<input type='button'  style='width:42px;height:33px;background-image:url(images/edit.png);top:1px'   onclick=\"editinfo('"+userName+"','"+userAge+"','"+userAddress+"','"+userSex+"','"+userCellPhone+"','"+userJob+"','"+userDepartment+"')\">"
						"</td>"
						+"</tr>";
						n++;			
						
					}
	
					document.getElementById("table-title").style.display = "inline";
					tbody.innerHTML = str;						
				},
				error:function(){
						
				}
			});
		}
			
		function selectStu(){	
			if(document.getElementById("info").value==""|| document.getElementById("info").value=="null"){
					document.getElementById("showMessage").style.color = "red";
					document.getElementById("showMessage").innerHTML = "请输入查询条件！";
					document.getElementById("showMessage").style.display = "inline";		
					setTimeout(function(){document.getElementById("showMessage").style.display="none"},3000);				
			}else if(document.getElementById("info").value=="所属地区"){
					document.getElementById("showMessage").style.color = "red";
					document.getElementById("showMessage").innerHTML = "您输入的地区不存在！";
					document.getElementById("showMessage").style.display = "inline";		
					setTimeout(function(){document.getElementById("showMessage").style.display="none"},3000);	
			}else{
				    document.getElementById("left-div1").style.display = "inline";
					var tbody = document.getElementById("tbody-result");
					$.ajax({
						type : "post",
						url : "simpleselect",
						async:false,
						data :{"name" : document.getElementById("info").value},
						dataType : "json",
						success: function(json){
							array = json;
							var str = "";
							var n=1;
							for(var i in json){
								var userName = json[i].userName;
								var userAge =json[i].age ;
								var userAddress =json[i].address ;
								var userSex =json[i].sex ;
								var userCellPhone =json[i].cellPhone ;
								var userJob = json[i].job;
								var userDepartment =json[i].department ;
								str +="<tr>" 
								+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;border-left:1px solid gray;'>" +n+"</td>"
								+"<td align='center' style='width:136px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" + json[i].userName + "</td>"
								+"<td align='center' style='width:46px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].age+ "</td>"
								+"<td align='left' style='width:545px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].address +"</td>"
								+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].sex + "</td>"
								+"<td align='center' style='width:167px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].cellPhone +"</td>"
								+"<td align='center' style='width:108px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].job +"</td>"
								+"<td align='center' style='width:94px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].department +"</td>"
								+"<td align='center' style='width:95px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>"  
									+"<input type='button'  onclick='deleteinfo(\""+userName+"\")'  style='width:42px;height:33px;background-image:url(images/delete.png);padding-top:0px;'>"
									+"<input type='button'  style='width:42px;height:33px;background-image:url(images/edit.png);top:1px'   onclick=\"editinfo('"+userName+"','"+userAge+"','"+userAddress+"','"+userSex+"','"+userCellPhone+"','"+userJob+"','"+userDepartment+"')\">"
									"</td>"
								+"</tr>";
								n++;								
							}
							document.getElementById("table-title").style.display = "inline";
							tbody.innerHTML = str;						
						},
						error: function(json){
	
						}
					});					
			}
		}
		
		var array;
		
		function daoExcel(){		
			var list;
			list= JSON.stringify(array);
			$.ajax({
				type:"post",
				url:"exportexcel",
				data:{"ListObject":list},
				dataType:"text",
				success:function(data){

				},
				error:function(){}
			})
		}
		
		function sstuinfo(){
			document.getElementById("default-div").style.display = "none";
			document.getElementById("main-div1").style.display="inline";
			var tbody = document.getElementById("tbody-result");
			$.ajax({
				type: "post",
				url : "stuinfo",
				async:false,
				data : {},
				dataType : "json",
				success: function(json){
					array = json;
					document.getElementById("left-div1").style.display = "inline";
					document.getElementById("table-title").style.display = "inline";
					var str = "";
					var n=1;
					for(var i in json){
						var userName = json[i].userName;
						var userAge =json[i].age ;
						var userAddress =json[i].address ;
						var userSex =json[i].sex ;
						var userCellPhone =json[i].cellPhone ;
						var userJob = json[i].job;
						var userDepartment =json[i].department ;
						str +="<tr>" 
							+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;border-left:1px solid gray;'>" +n+"</td>"
							+"<td align='center' style='width:136px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" + json[i].userName + "</td>"
							+"<td align='center' style='width:46px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].age+ "</td>"
							+"<td align='left' style='width:538px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].address +"</td>"
							+"<td align='center' style='width:47px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].sex + "</td>"
							+"<td align='center' style='width:166px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].cellPhone +"</td>"
							+"<td align='center' style='width:108px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].job +"</td>"
							+"<td align='center' style='width:94px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>" +json[i].department +"</td>"
							+"<td align='left' style='width:95px;height:30px;border-right:1px solid gray;border-bottom:1px solid gray;'>"  
								+"<input type='button'  onclick='deleteinfo(\""+userName+"\")'  style='width:42px;height:33px;background-image:url(images/delete.png);top:1px;'>"
								+"<input type='button'  style='width:42px;height:33px;background-image:url(images/edit.png);top:1px'   onclick=\"editinfo('"+userName+"','"+userAge+"','"+userAddress+"','"+userSex+"','"+userCellPhone+"','"+userJob+"','"+userDepartment+"')\">"
							"</td>"
							+"</tr>";
							n++;		
					}		
					tbody.innerHTML = str;
				},
				error: function(String){
					
				}
			});
			//清除输入的数据
			document.getElementById("info").value = "";
		}
		
	    var status = true;
		function changeImg(){
				var photo = document.getElementById("img");
				if(status =="false"){
						photo.src="images/play.png";
						closePlay();
						status = true;
				}else{
						photo.src="images/pause.png";
						autoPlay();
						status = false;
				}
		}
		
		//播放系统音乐
		function autoPlay() {
				var myAuto = document.getElementById('music');
				//播放
				myAuto.play();
		}
		
		function closePlay() {
				var myAuto = document.getElementById('music');
				//暂停
				myAuto.pause();
				//重新加载
				//myAuto.load();
		}
		
</script>
</head>
<body  style="background-color: white;width:1521px;height:700px;position: relative;">
	<%
		User user = (User)request.getSession().getAttribute("user");
	%>
<div style="width:1521px;height:80px;top:0px;left:0px;position: absolute;background-color: blue">
	<p><span style="font-size: 30px;left:660px;top:20px;position: relative;color:yellow">博简员工管理系统</span></p>
</div>
<div style="width:100%;height:40px;top:80px;left:0px;position: absolute;background-color: gray">
		<audio src="yp/chixingjuedui.mp3" controls="controls" width="5px"  left="5px" hidden=true loop=0 id="music"></audio>
		<label style="width:25px;height:20px;top:8px;left:1060px;position: absolute;">
				<img id="img"  alt=""  src="images/play.png"  onclick="changeImg()">
		</label>
		<label  id="showMessage"   style="width:250px;height:30px;top:5px;left:690px;position: absolute;background-color: green;display:none;font-size: 14px;font-style: inherit;text-align: center;line-height: 24px"></label>
		<span  id="mytime"  style="width:200px;height:30px;top:5px;left:1095px;position: absolute;background-color: none;color:white;font-size: 15px;font-style: inherit;text-align: left;line-height: 26px"></span>
		<label  style="width:80px;height:30px;top:5px;left:1280px;position: absolute;font-size: 14px;text-align: right;line-height: 27px;">欢迎登录：</label>
		<label  style="width:90px;height:27px;top:5px;left:1360px;position: absolute;font-size: 14px;text-align: left;line-height: 27px;color:blue;"><%=user.getUserName()%></label>
		<input type="button"  id="logout"  value="退出"   onclick="logout()" style="width:55px;height:30px;top:5px;left:1460px;position: absolute;background-color: green;font-size: 14px;text-align: center;line-height: 27px;margin:0;padding:0;"> 
</div>
<div  style="width:200px;height:700px;background-color: DarkSlateGray;position: absolute;top:120px;left:0px;border-top:1px solid white">
		<input type="button"   value="查询所有员工信息"  onclick="sstuinfo()"  style="width:200px;height:52px;position: absolute;top:1px;left:0px;border-bottom: 1px solid black;background-color: gray;color:blue;font-size: 16px;font-family: fantasy;">
		<input type="button"   value="创建员工工作内容"  onclick="create()"   style="width:200px;height:52px;position: absolute;top:54px;left:0px;border-bottom: 1px solid black;background-color: gray;font-size: 16px;font-family: fantasy;color:blue;">
		<input type="button"   value="查询内容完成情况"  style="width:200px;height:52px;position: absolute;top:107px;left:0px;border-bottom: 1px solid black;background-color: gray;font-size: 16px;font-family: fantasy;color:blue;">
		<input type="button"   value="查询员工排班情况"  style="width:200px;height:52px;position: absolute;top:160px;left:0px;border-bottom: 1px solid black;background-color: gray;font-size: 16px;font-family: fantasy;color:blue;">
</div>

<div  id="default-div"   style="width:1320px;height:700px;position: absolute;top:120px;left:200px;background-color: white;display:inline">
	<div id='banner'  class="comWidth">
       <div id="banner_imgs" style="left:-1320px;background-color:white;" class="clearfix">
           <a href="#"><img src="images/s5.jpg" alt=""></a>
           <a href="#"> <img src="images/s1.jpg" alt=""></a>
           <a href="#"><img src="images/s2.jpg" alt=""></a>           
           <a href="#"><img src="images/s3.jpg" alt=""></a>
            <a href="#"><img src="images/s4.jpg" alt=""></a>
            <a href="#"><img src="images/s5.jpg" alt=""></a>
            <a href="#"><img src="images/s1.jpg" alt=""></a>
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
</div>
<div  id="main-div1"   style="width:1320px;height:700px;position: absolute;top:120px;left:200px;background-color: white;display:none">
		<input type="button"   onclick="selectStu()"   style="width:47px;height:35px;top:2px;left:0px;position: absolute;background-color: blue;background-image: url(images/sousuo.png)">
		<input type="text"  id="info"   placeholder="地区模糊查询"   style="width:150px;height:28px;left:45px;top:3px;position: absolute;font-size: 14px;font-style: normal;">
		<select name = "selectEvent"   id ="selectEvent"  onclick="selectIndex(this.id)" style="width:100px;height:34px;left:198px;top:3px;position: absolute; " >
				<option value="0">所属地区</option>
				<option value="1">北京</option>
				<option  value="2">湖北</option>
				<option  value="3">河南</option>
				<option  value="4">广东</option>
				<option  value="5">湖南</option>
				<option  value="6">河南</option>
				<option  value="7">江西</option>
		</select>
		<a  href="addempinfo.jsp"><button  id="addStuInfo"   style="width:38px;height:34px;left:300px;top:3px;position: absolute;padding:0px;background-image: url(images/add.png);"  ></button></a>
		<input type="button"  onclick="flash()" style="width:38px;height:34px;left:1230px;top:3px;position: absolute;padding:0px;background-image: url(images/flash.png)">
		<input type="button"  onclick="daoExcel()" style="width:38px;height:34px;left:1277px;top:3px;position: absolute;padding:0px;background-image: url(images/daoexcel.png)">
<div  id="left-div1"   style="width:1320px;height:500px;background-color: white;position: absolute;top:41px;left:1px;display:none;">
		<div id="table-title"  style="width:1318px;height:50px;position: absolute;margin-top:1px;margin-left:1px;background-color: gray;display:none;">
				<label  style="width:50px;height:50px;border-right:2px solid black;position: absolute;padding-left:0px;padding-top:0px;text-align: center;line-height: 45px;"><i>序号</i></label>
				<label  style="width:138px;height:50px;border-right:2px solid black;position: absolute;padding-left:50px;padding-top:0px;text-align: center ;line-height: 45px;"><i>姓名</i></label>
				<label  style="width:49px;height:50px;border-right:2px solid black;position: absolute;padding-left:188px;padding-top:0px;text-align: center ;line-height: 45px;"><i>年龄</i></label>
				<label  style="width:547px;height:50px;border-right:2px solid black;position: absolute;padding-left:237px;padding-top:0px;text-align: center ;line-height: 45px;"><i>住址</i></label>
				<label  style="width:49px;height:50px;border-right:2px solid black;position: absolute;padding-left:784px;padding-top:0px;text-align: center;line-height: 45px;"><i>性别</i></label>
				<label  style="width:170px;height:50px;border-right:2px solid black;position: absolute;padding-left:833px;padding-top:0px;text-align: center ;line-height: 45px;"><i>电话号码</i></label>
				<label  style="width:95px;height:50px;border-right:2px solid black;position: absolute;padding-left:1024px;padding-top:0px;text-align: center;line-height: 45px;"><i>职位</i></label>
				<label  style="width:105px;height:50px;border-right:2px solid black;position: absolute;padding-left:1110px;padding-top:0px;text-align: center ;line-height: 45px;"><i>部门</i></label>
				<label  style="width:108px;height:50px;border-right:2px solid black;position: absolute;padding-left:1210px;padding-top:0px;text-align: center;line-height: 45px;"><i>操作</i></label>
		</div>
		<table  id="table"  style="width:1318px;margin-top:51px;margin-left:1px;position: absolute;">
				<tbody id="tbody-result">						
				</tbody>
		</table>
	
</div>
</div>
</body>
</html>