<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户重置密码</title>
</head>
<body style="background-color: green;width:100%;height:100%;position: absolute;background-image: url(images/reset.jpeg);background-repeat: repeat-x;">
		<div  style="width:600px;height:400px;background-color: blue;top:150px;left:450px;position: absolute;">
				<div style="width:500px;height:50px;top:20px;left:60px;position: relative;background-color: red;">
						<label style="width:70px;height:49px;background-color: yellow;position: absolute;padding:0px;">							
						</label>
						<input type="text"  id="username"   name="username"   placeholder = "请输入用户名"  value=""  style="width:300px;height:48px;left:70px;top:0px;position: relative;padding:0px;"/>
				</div>	
				
				<div style="width:500px;height:50px;top:40px;left:60px;position: relative;background-color: red;">
						<label style="width:70px;height:49px;background-color: yellow;position: absolute;padding:0px;">							
						</label>
						<input type="text"  id="username"   name="username"   placeholder = "请输入新的密码"  value=""  style="width:300px;height:48px;left:70px;top:0px;position: relative;padding:0px;"/>
				</div>	
				
				<div style="width:500px;height:50px;top:60px;left:60px;position: relative;background-color: red;">
						<label style="width:70px;height:49px;background-color: yellow;position: absolute;padding:0px;">							
						</label>
						<input type="text"  id="username"   name="username"   placeholder = "再次确认新密码"  value=""  style="width:300px;height:48px;left:70px;top:0px;position: relative;padding:0px;"/>
				</div>	
				
				<div style="width:500px;height:50px;top:80px;left:60px;position: relative;background-color: red;">
						<label style="width:70px;height:49px;background-color: yellow;position: absolute;padding:0px;">							
						</label>
						<input type="text"  id="username"   name="username"   placeholder = "请输入用户名"  value=""  style="width:300px;height:48px;left:70px;top:0px;position: relative;padding:0px;"/>
				</div>	
				
				<input type="submit"  value="确定"  style="width:60px;height:40px;background-color: yellow;position: relative;top:110px;left:180px;"/>
				<a href="login.jsp"  style="text-decoration: none;"><input type="button"  value="取消"  style="width:60px;height:40px;background-color: yellow;position: relative;top:110px;left:320px;"/></a>
		</div>
</body>
</html>