<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="right.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<meta charset="UTF-8">

<title>视频介绍</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">

<link rel="stylesheet" href="css/style.css">

</head>
<body>

<div class="slider-container">
<div class="slider-control left inactive"></div>
<div class="slider-control right"></div>
<ul class="slider-pagi"></ul>
<div class="slider">
<div class="slide slide-0 active">
  <div class="slide__bg" style="background-image: url('image/3d-slider-3.jpg');"></div>
  <div class="slide__content">
	<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
	  <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
	</svg>
	<div class="slide__text">
	  <h2 class="slide__text-heading">主页</h2>
	  <p class="slide__text-desc">本站以邮件方式发送网盘地址</p>
	  <p class="slide__text-desc">如有疑问可以打开右侧添加QQ</p>
	  <p class="slide__text-desc">可能被误当成垃圾邮件，请去垃圾箱找找</p>
	   <h4 class="slide__text-heading">图包1.0版</h4>
	   <a class="slide__text-link" href="pictures.do">转到</a>
	     <h4 class="slide__text-heading">图包2.0版</h4>
	   <a class="slide__text-link" href="pictures2.do">转到</a>
	</div>
  </div>
</div>
<div class="slide slide-1 ">
  <div class="slide__bg" style="background-image: url('image/bg03.jpg');"></div>
  <div class="slide__content">
	<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
	  <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
	</svg>
	<div class="slide__text">
	  <h2 class="slide__text-heading">Project 1</h2>
	  <a class="slide__text-link" href="http://www.bilibili.com/video/av9058411/?from=search&seid=10856211312431010506" target="_blank"> [多素材/AMV](1080P)用一箱本子换一张限定版CD</a>
	  <p class="slide__text-desc">详情</p>
	  <a class="slide__text-link" href="javascript:void(0);" onclick="fun01('${email}',1)">接收邮件</a>
	<%-- <a class="slide__text-link" href="javascript:void(0);" onclick="fun01('${email}',1)">链接（ctrl + c 到地址栏）</a> --%>
	</div>
  </div>
</div>
<div class="slide slide-2">
  <div class="slide__bg" style="background-image: url('image/3d-slider-1.jpg');"></div>
  <div class="slide__content">
	<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
	  <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
	</svg>
	<div class="slide__text">
	  <h2 class="slide__text-heading">Project 2</h2>
	  <p class="slide__text-desc">四月精美图包.</p>
	  	  <a class="slide__text-link" href="javascript:void(0);" onclick="fun01('${email}',2)">接收邮件</a>
<%-- 	  <a class="slide__text-link" href="javascript:void(0);" onclick="fun01('${email}',2)">链接（ctrl + c 到地址栏）</a> --%>
	</div>
  </div>
</div>
<div class="slide slide-3">
  <div class="slide__bg" style="background-image: url('image/3d-slider-4.jpg');"></div>
  <div class="slide__content">
	<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
	  <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
	</svg>
	<div class="slide__text">
	  <h2 class="slide__text-heading">Project 3</h2>
	  <p class="slide__text-desc">[AMV]四月.</p>
	  <p class="slide__text-desc">正在制作过程中.</p>
	  <a class="slide__text-link">Project link</a>
	</div>
  </div>
</div>
<!-- <div class="slide slide-4">
  <div class="slide__bg"></div>
  <div class="slide__content">
	<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
	  <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
	</svg>
	<div class="slide__text">
	  <h2 class="slide__text-heading">Project name 5</h2>
	  <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia.</p>
	  <a class="slide__text-link">Project link</a>
	</div>
  </div>
</div> -->
</div>

</div>

<script src='js/jquery-1.9.1.min.js'></script>

<script src="js/index.js"></script>
<script type="text/javascript">
function fun01(a,b){
  $.ajax({
  type: 'POST',
  url: 'sendvideo.do',
  data: {"email":a,"videoID":b},
  dataType: 'text',
  success: function(data){
 
  if(data!="error"){
 	// var a1=data.split('@@')[0];
    //var a2=data.split('@@')[1];
  	//alert("地址："+a1+"提取码："+a2);
  	alert("发送成功");
 	}
  else{
  alert("发送失败");
	}
  },
  error:function(){

  },
}); 
/* var d=$("div.slider-container");
d.prepend('<iframe  scrolling = "yes" src="https://www.baidu.com"></iframe>'); */
};
</script>
</body>
</html>
