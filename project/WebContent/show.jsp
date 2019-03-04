<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  href="css/show.css" type="text/css"/>
<script type="text/javascript"  src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
     var i=0;
function qiehuan(){
    //获取元素
    var demoimg = document.getElementById("demoimg");
    var demoli = demoimg.getElementsByTagName("li");
    //获取图片盒子距左边的距离给left，图片的宽度给swidth，
    //图片盒子中li即图片总数给lis
    var left = demoimg.offsetLeft;
    var swidth = demoli[0].offsetWidth;
    var lis = demoli.length;
    //left从0开始逐渐递减，图片盒子向左移动。
    //当所有图片都移动到左边之后，left=0，重新开始，形成循环播放。
    if(left>-swidth*(lis-1)){
        left = left - swidth;
        demoimg.style.left = left+"px";
        i = i+1;
    }else{
        left = 0;
        demoimg.style.left = left+"px";
        i = 0;
    }

    //附加效果 blue部分  
    var dblue = document.getElementById("blue");
    //通过参数i设置与图片li对应的blue部分第i个li背景色
    dblue.getElementsByTagName("li")[i].style.background = "blue";
    var thisi = dblue.getElementsByTagName("li")[i];
    var syi = dblue.getElementsByTagName("li");
    //遍历blue的所有li元素，设置非当前li的背景色，注意:syi[j]!=thisi
    for(j=0;j<lis;j++){
        if(syi[j]!=thisi){
          syi[j].style.background="#ccc";
        }
    }
}

//定时器，每隔2000毫秒执行一次qiehuan()代码，数值越小，幻灯片切换越快
window.setInterval("qiehuan()",100);

</script>

<title>Insert title here</title>
</head>
<body>
<div id="demo">
    <ul id="demoimg">
        <li><img src="images/1.png"></li>
        <li><img src="images/2.png"></li>
        <li><img src="images/3.png"></li>
    </ul>
    <ul id="blue">
        <li style="background:blue"></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
</html>