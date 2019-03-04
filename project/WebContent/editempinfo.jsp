<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title >修改员工信息</title>
<script src="js/jquery-3.3.1.min.js"  type="text/javascript"></script>
<script type="text/javascript">
		function saveStuInfo(){
			var userName= document.getElementById("username").value;
			var userAge = document.getElementById("userage").value;
			var userAddress = document.getElementById("useraddress").value;
			var userCellPhone = document.getElementById("usercellphone").value;
			var userSex = document.getElementById("usersex").value;
			var userJob = document.getElementById("userjob").value;
			var userDepartment = document.getElementById("userdepartment").value;
			$.ajax({
					type:"post",
					url : "editstuinfo",
					data:{"userName":userName,"userAge":userAge,"userAddress":userAddress,"userCellPhone":userCellPhone,"userSex":userSex,"userJob":userJob,"userDepartment":userDepartment},
					dataType:"text",
					success: function(data){
							if(data=="true"){
									document.getElementById("result-message").innerHTML = "保存成功！";
									document.getElementById("result-message").style.color = "green";
									document.getElementById("result-message").style.display = "inline";
									setTimeout(function(){document.getElementById("result-message").style.display="none"},1000);
									location.href = "main.jsp";
							}else{
									document.getElementById("result-message").innerHTML = "保存失败！";
									document.getElementById("result-message").style.color = "red";
									document.getElementById("result-message").style.display = "inline";
									setTimeout(function(){document.getElementById("result-message").style.display="none"},3000);	
							}
					},
					error:function(){
						
					}
			})
		}

</script>

</head>
<body style="width:100%;height:100%;background-color: white;position: absolute;">
		<%
			request.setCharacterEncoding("UTF-8");
			String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
			String userName = request.getParameter("uname");//用request得到
			String userAge = request.getParameter("uage");
			String userAddress = request.getParameter("uaddress");
			String userSex = request.getParameter("usex");
			String userCellPhone = request.getParameter("ucellphone");
			String userJob = request.getParameter("ujob");
			String userDepartment = request.getParameter("udepartment");
			userName =new String(userName .getBytes("ISO-8859-1"),"UTF-8");  //更改编码格式
			userAge =new String(userAge .getBytes("ISO-8859-1"),"UTF-8"); 
			userAddress =new String(userAddress .getBytes("ISO-8859-1"),"UTF-8"); 
			userSex =new String(userSex .getBytes("ISO-8859-1"),"UTF-8"); 
			userCellPhone =new String(userCellPhone .getBytes("ISO-8859-1"),"UTF-8"); 
			userJob =new String(userJob .getBytes("ISO-8859-1"),"UTF-8"); 
			userDepartment =new String(userDepartment .getBytes("ISO-8859-1"),"UTF-8"); 
		%>

		<div  style="width:100%;height:100px;background-color: blue;margin-top:0px;margin-left:0px;padding:0px;">
				<label style="width:300px;height:100px;left:600px;position: absolute;text-align: center;line-height: 85px;"><font style="color:gray;font-size: 30px;"><i>修改员工信息</i></font></label>
		</div>
		<label  id="result-message"  style="width:300px;height:40px;top:105px;left:610px;position: absolute;background-color: gray;font-size:18px;text-align: center;line-height:32px;display:none; "></label>
		<div  style="width:600px;height:450px;position: relative;background-color: gray;left:450px;top:50px;">
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:5px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">用户名：</label>
						<input type="text"  id="username"  name="username"  value="<%=userName %>" style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserName"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:50px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">年龄：</label>
						<input type="text"  id="userage"  name="userage"  value="<%=userAge %>" style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserAge"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:95px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">住址：</label>
						<input type="text"  id="useraddress"  name="useraddress"  value="<%=userAddress %>"  style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserAddress"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:140px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">性别：</label>
						<input type="text"  id="usersex"  name="usersex"  value="<%=userSex %>"  style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserSex"  style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:185px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">手机号码：</label>
						<input type="text"  id="usercellphone"  name="usercellphone"  value="<%=userCellPhone %>"  style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserCellPhone"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:230px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">职位：</label>
						<input type="text"  id="userjob"  name="userjob"  value="<%=userJob %>" style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserJob"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<div style="width:580px;height:40px;background-color: none;position: absolute;top:275px;left:10px;">
						<label  style="width:80px;height:39px;margin-top:0px;margin-left:0px;position: absolute;background-color: yellow;color:blue;text-align: right;line-height: 35px;">所属部门：</label>
						<input type="text"  id="userdepartment"  name="userdepartment"  value="<%=userDepartment %>" style="width:200px;height:33px;margin-left:80px;margin-top:opx;position: absolute;">
						<label  style="width:50px;height:39px;margin-top:0px;margin-left:285px;position: absolute;text-align: center;line-height: 37px;font-size: 18px;color:red;">*必填</label>
						<label  id="errorUserDpartment"   style="width:240px;height:38px;margin-left:338px;margin-top:opx;position: absolute;text-align: center;line-height: 37px"></label>
				</div>
				<input  type="button"  value="保存"  onclick="saveStuInfo()"  style="width:80px;height:30px;position: absolute;margin-top:340px;margin-left:20px;background-color: yellow;">
				<a  href="http://localhost:8888/project/main.jsp"><input  type="button"  value="取消"  style="width:80px;height:30px;position: absolute;margin-top:340px;margin-left:180px;background-color: yellow;"></a>
		</div>
</body>
</html>