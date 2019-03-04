<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.3.1.min.js"  type="text/javascript"></script>
<title>Insert title here</title>
<script language="JavaScript">
    function autoPlay() {
	    var myAuto = document.getElementById('music');
	    myAuto.play();
	}
	function closePlay() {
	    var myAuto = document.getElementById('music');
	    myAuto.pause();
	    myAuto.load();
	}

</script>

</head>
<body>
   <audio src="song.mp3" controls="controls" width="30px" hidden=true loop=0 id="music"></audio>
   <input type="button" onclick="autoPlay()" value="播放" />
   <input type="button" onclick="closePlay()" value="关闭" />

</body>
</html>