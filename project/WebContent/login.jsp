<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css" type="text/css"/>
<link rel="shortcut icon" href="ico/title-login.ico"  type="image/x-icon" />
<script type="text/javascript"  src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	   var flag = false;
	   function sub(){
			var showlabel = document.getElementById("error");
			var form = document.getElementById("bm");
			var userName = document.getElementById("username").value;
			var passWord = document.getElementById("password").value;

			if((null ==userName || "" ==userName) &&( null==passWord || ""==passWord)){
					showlabel.style.HTML = "请输入用户名和密码！";
					showlabel.style.color = "red";
					showlabel.style.
					flag = false;
			}else if(null ==userName || "" ==userName){
					showlabel.style.HTML = "请输入用户名！";
					showlabel.style.color = "red";				
					flag = false;
			}else if(null ==passWord || ""==passWord){
					showlabel.style.HTML = "请输入密码！";
					showlabel.style.color = "red";
					flag = false;
			}
	   }

</script>
<title >登陆界面</title>
</head>
<body >
	<form id="bm"  action="login" method="post">  
	<div style="width:700px;height:700px;background-color: white;margin-top:130px;margin-left:412px;background-image: url(images/login.png);position: relative;">
		<label style="width:100px;height:30px;background-color: none;position: absolute;top:70px;left:300px;text-align: center;line-height: 22px">
				<font style="font-style: normal;color:green;">${success}</font>
		</label>
		<div style="width:500px;height:300px;background-color: rgba(0,0,255,0.2);top:150px;left:100px;position: relative;">
			<p style="padding-left:180px;padding-top:5px"><font style="color:yellow;font-size: 30px;font-style:italic;" >登录界面</font></p>
			
			<label id="error" style="width:200px;height:30px;background-color: none;margin-top:-15px;margin-left:150px;position: absolute;text-align: center;line-height: 15px;">
				<font style="font-size: 14px;color:red;">${error}</font>
			</label>
			
			<div style="width:410px;height:210px;background-color: none;margin-left:43px;margin-top:35px;position:relative;">
				
			  	<div style="width:350px;height:50px;background-color: rgba(0,0,255,0.1);margin-left:30px;margin-top:12px;position: absolute;">
			  		<label style="width:50px;height:50px;margin-left:0px;margin-top:0px;position: absolute;background-image:url(images/username.png); "></label>
			  		<input type="text"  id="username" name="username" value="${username}" placeholder="请输入用户名" style="width:250px;height:43px;background-color:rgba(0,0,255,0.1) ;margin-left:50px;margin-top:0px;">
			  			<font style="font-size: 20px;text-align: left;color:blue"></font>
			  		</input>
			  	</div>
			  	
				<div style="width:350px;height:50px;background-color: rgba(0,0,255,0.1);margin-left:30px;margin-top:80px;position: absolute;">
					<label style="width:50px;height:50px;margin-left:0px;margin-top:0px;background-image:url(images/password.png);position: absolute;"></label>
					<input type="text" id="password" name="password" value="${password}" placeholder="请输入密码" style="width:250px;height:43px;background-color: rgba(0,0,255,0.1);margin-left:50px;margin-top:0px;">
						  <font style="font-size: 20px;text-align: left;color:blue"></font>
					</input>
				</div>
					
				<a href="reset.jsp" style="text-decration: none;width:80px;height:20px;margin-top:130px;margin-left:255px;position: absolute;">
					<font style="color:yellow;font-size: 14px;font-style: italic;">忘记密码？</font>
				</a>
				
				<input  type="submit"  value="登录"    style="width:100px;height:50px;color:blue;background-color: yellow;margin-top:160px;margin-left:70px"/>
				<a href="insert.jsp" style="text-decoration: none"><input type="button" value="立即注册" style="width:100px;height:50px;color:blue;background-color: yellow;margin-top:160px;margin-left:60px;position: absolute;">	</a>	
			</div>
		</div>
	</div>
	</form>
</body>
</html>