<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
/* side */
.side{position:fixed;width:54px;height:275px;right:0;top:214px;z-index:100;}
.side ul li{width:54px;height:54px;float:left;position:relative;border-bottom:1px solid #444;}
.side ul li .sidebox{position:absolute;width:54px;height:54px;top:0;right:0;transition:all 0.3s;background:#000;opacity:0.8;filter:Alpha(opacity=80);color:#fff;font:14px/54px "微软雅黑";overflow:hidden;}
.side ul li .sidetop{width:54px;height:54px;line-height:54px;display:inline-block;background:#000;opacity:0.8;filter:Alpha(opacity=80);transition:all 0.3s;}
.side ul li .sidetop:hover{background:#ae1c1c;opacity:1;filter:Alpha(opacity=100);}
.side ul li img{float:left;}
</style>
  <body>
  <div class="side">
	<ul>
	  <li ><a href="javascript:void(0);" ><div class="sidebox"><img src="image/side_icon04.png">QQ客服</div></a></li>
	  <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="image/side_icon05.png"></a></li>
  </ul>
</div>
    <script src='js/jquery-1.9.1.min.js'></script>
<script>
$(function(){
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"124px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"})
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"})	
	});
	$(".sidebox").click(function(){
	
		var link = 'http://wpa.qq.com/msgrd?v=3&uin=576140241&site=qq&menu=yes';
		window.open(link,'_blank');
	});
});
//回到顶部函数
function goTop(){
	$('html,body').animate({'scrollTop':0},300);
}
</script>
  </body>
</html>
