<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript"  src="js/jquery-3.3.1.min.js" ></script>
<Script  type="text/javascript">	
		$(function(){
			$("#bsubmit").click(function(){
				alert(document.getElementById("username").value());
				if(document.getElementById("username").value()=="null" || document.getElementById("username").value()==" "){
						document.getElementById("uname").innerHTML ="请输入用户名！";
						document.getElementById("uname").style.color = "red";
						document.getElementById("uname").style.display = "inline";						
				}else{
				$.ajax({
					type: "post",
					url : "select",
					data: {"name" : $("#username").val()},
					dataType: "text",
					success: function(data){
							if(data== "true"){
								    var label = document.getElementById("titleShow");
									document.getElementById("titleShow").innerHTML="用户名已存在";
									label.style.display = "inline";
									label.style.color = "red";
									setTimeout(function(){label.style.display="none"},3000);
							}else if(data=="false"){
								    var label = document.getElementById("titleShow");
									document.getElementById("titleShow").innerHTML="用户名可用";
									label.style.display = "inline";
									label.style.color = "yellow";
									setTimeout(function(){label.style.display="none"},3000);
							}
					},
					error: function(){
							
					}
				});
				}
			})
		
		function checkForm(){
				var flag ;
				var userName = document.getElementById("username").value;
				var passWord = document.getElementById("password").value;
				var qpassWord = document.getElementById("qpassword").value;
				if(userName==""){
					flag = false;
					document.getElementById("uname").innerHTML = "用户名不能为空";	
					break;
				}else if(passWord==""){
					flag = false;
					document.getElementById("pwd").innerHTML ="密码不能为空";
					break;
				}else if(qpassWord==""){
					flag = false;
					document.getElementById("qpwd").innerHTML ="确认密码不能为空";
					break;
				}else{
					flag = true;					
				}
				
				if(flag=="true"){
					document.getElementById("#form1").submit();
				}else{
					
				}
		}	
		})
</Script>
</head>

<body style="background-color: green;">
	<form id="form1"  action="insert" method="post">
	<p style="width:600px;height:60px;top:20px;left:462px;position: relative;text-align:center;">
		<font style="color:blue;font-size: 40px;">欢迎新用户注册</font>
	</p>
	<label id="titleShow"   name="titleShow"   style="width:300px;height:30px;left:622px;top:115px;text-align:center;line-height:27px;position: absolute;background-color: gray;display: none;">
			${message}
	</label>
	
	<div style="width:600px;height:500px;top:60px;left:462px;background-color:gray;background-color: rgba(0,0,255,0.1);position: relative;border:1px solid gray;">
		<div style="width:360px;height:50px;position: relative;margin-top:20px;margin-left:85px;">
			<label style="width:75px;height:30px;background-color: blue;position: absolute;margin-top:7px;text-align: center;line-height: 25px;">
				<font style="font-size: 16px;color:gray;">用户名 :</font>
			</label>
			<input type="text"  id="username"  name="username"  value=" ${username}"  style="width:210px;height:27px;background-color: gray;margin-top:7px;margin-left:85px;padding:0px;"/>
			<label style="width:45px;height:30px;margin-top:7px;margin-left:10px;position: absolute;text-align: center;line-height: 25px;">
				<font style="color:red;font-size: 14px;font-style: inherit;">*必填</font>
			</label>
			<button type="button"  id="bsubmit"   style="background-color: gray;width:47px;height:31px;position: absolute;padding:0px;left:360px;top:8px;background-image: url(images/sousuo.png);"></button>
			<label style="width:100px;height:30px;position: absolute;background-color: gray;left:406px;top:8px;text-align: left;line-height: 25px;"><font style="color:blue;">检测是否可用</font></label>
			<label  id="uname"  style="width:250px;height:25px;position: absolute;left:0px;top:42px;text-align: left;line-height: 19px;display: none;"></label>
		</div>
		
		<div style="width:360px;height:50px;position: relative;margin-top:20px;margin-left:85px;">
			<label style="width:75px;height:30px;background-color: blue;position: absolute;margin-top:7px;text-align: center;line-height: 27px;">
				<font style="font-size: 16px;color:gray;">新密码 :</font>
			</label>
			<input type="text" id="password"  name="password"  value=" ${password}" style="width:210px;height:27px;background-color: gray;margin-top:7px;margin-left:85px;position: relative;padding:0px;"/>
			<label style="width:45px;height:30px;margin-top:7px;margin-left:10px;position: absolute;text-align: center;line-height: 27px;">
				<font style="color:red;font-size: 14px;font-style: inherit;">*必填</font>
			</label>
			<label  id="pwd"  style="width:250px;height:25px;position: absolute;display: none;left:0px;top:42px;text-align: left;line-height: 19px;"></label>
		</div>
		
		<div style="width:360px;height:50px;position: relative;margin-top:20px;margin-left:85px;">
			<label style="width:75px;height:30px;background-color: blue;position: absolute;margin-top:7px;text-align: center;line-height: 25px;">
				<font style="font-size: 16px;color:gray;">确认密码 :</font>
			</label>
			<input type="text" id="qpassword" name="qpassword" value=" ${qpassword}" style="width:210px;height:27px;background-color: gray;margin-top:7px;margin-left:85px;position: relative;padding:0px;"/>
			<label style="width:45px;height:30px;margin-top:7px;margin-left:10px;position: absolute;text-align: center;line-height: 27px;">
				<font style="color:red;font-size: 14px;font-style: inherit;">*必填</font>
			</label>
			<label  id="qpwd"  style="width:250px;height:25px;position: absolute;display: none;left:0px;top:42px;text-align: left;line-height: 19px;"></label>
		</div>
		
		<div style="width:360px;height:50px;position: relative;margin-top:20px;margin-left:85px;">
			<label style="width:75px;height:30px;background-color: blue;position: absolute;margin-top:7px;text-align: center;line-height: 25px;">
				<font style="font-size: 16px;color:gray;">手机号码 :</font>
			</label>
			<input type="text" id="cellphone" name="cellphone" value=" ${cellphone}" style="width:210px;height:27px;background-color: gray;margin-top:7px;margin-left:85px;position: relative;padding:0px;"/>
			<label style="width:45px;height:30px;margin-top:7px;margin-left:10px;position: absolute;text-align: center;line-height: 27px;">
				<font style="color:white;font-size: 14px;font-style: inherit;">*选填</font>
			</label>
		</div>
		
		<div style="width:360px;height:50px;position: relative;margin-top:20px;margin-left:85px;">
			<label style="width:75px;height:30px;background-color: blue;position: absolute;margin-top:7px;text-align: center;line-height: 25px;">
				<font style="font-size: 16px;color:gray;">邮箱 :</font>
			</label>
			<input type="text" id="email" name="email" value=" ${email}" style="width:210px;height:27px;background-color: gray;margin-top:7px;margin-left:85px;position: relative;padding:0px;"/>
			<label style="width:45px;height:30px;margin-top:7px;margin-left:10px;position: absolute;text-align: center;line-height: 27px;">
				<font style="color:white;font-size: 14px;font-style: inherit;">*选填</font>
			</label>
		</div>
				
		<input type="button"  id=“submit”  onclick="checkForm()"  value="注册"  style="width:75px;height:30px;margin-top:20px;margin-left:150px;background-color: yellow;">
		<a href="login.jsp" style="text-decoration: none"><input type="button" value="取消" style="width:75px;height:30px;margin-top:20px;margin-left:85px;background-color: yellow;"></a>
	</div>
	</form>
</body>
</html>