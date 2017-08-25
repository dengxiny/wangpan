<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" align="left">
				<c:if test="${pb.list.size()<4&&pb.list.size()>0}">
					<div class="row clearfix">
						<c:forEach items="${pb.list}" var="list">
							<div class="col-md-4 column">
								<span class="label label-default">${list.ID}</span>
								<!-- 	<input type="checkbox" name="sel" /><br>  -->
								<img alt="重新加载图片.." style="width: 300px;height: 300px"
									src="${list.path}" />
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${pb.list.size()>3&&pb.list.size()<7}">
					<c:forEach items="${list}" var="list" begin="0" end="2">
						<div class="col-md-4 column">
							<span class="label label-default">${list.ID}</span> <img
								alt="重新加载图片.." style="width: 300px;height: 300px"
								src="${list.path}" />
							<!-- 	<input type="checkbox" name="sel" /><br> -->
						</div>
					</c:forEach>
					<c:forEach items="${pb.list}" var="list" begin="3"
						end="${pb.list.size()}">
						<div class="col-md-4 column">
							<span class="label label-default" >${list.ID}</span><img
								alt="重新加载图片.." style="width: 300px;height: 300px"
								src="${list.path}" />
							<!-- 	 <input type="checkbox" name="sel"/><br> -->
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${pb.list.size()>6&&pb.list.size()<10}">
					<c:forEach items="${pb.list}" var="list" begin="0" end="2">
						<div class="col-md-4 column">
							<span class="label label-default">${list.ID}</span><br> <img
								alt="重新加载图片.." style="width: 300px;height: 300px"
								src="${list.path}" /><br>
							<%-- 	<div class="checkbox" name="sel" value="${list.ID}" align="right">
								<ins></ins>
							</div> --%>
						</div>
					</c:forEach>
					<c:forEach items="${pb.list}" var="list" begin="3" end="5">
						<div class="col-md-4 column">
							<span class="label label-default">${list.ID}</span><br> <img
								alt="重新加载图片.." style="width: 300px;height: 300px"
								src="${list.path}" /><br>
							<%-- <div class="checkbox" name="sel" value="${list.ID}" align="right">
								<ins></ins>
							</div> --%>
						</div>
					</c:forEach>
					<c:forEach items="${pb.list}" var="list" begin="6"
						end="${pb.list.size()}">
						<div class="col-md-4 column">
							<span class="label label-default">${list.ID}</span><br> <img
								alt="重新加载图片.." style="width: 300px;height: 300px"
								src="${list.path}" /><br>
							<%-- <div class="checkbox" name="sel" value="${list.ID}" align="right"> 
								<ins></ins>
							</div>--%>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column" align="center">
				<ul class="pagination">
					<li><a>共${pb.totalpage}页</a></li>
					<li><a>第${pb.pagecode}页</a></li>
					<li><a href="pictures.do?pagecode=1">首页</a></li>
					<c:if test="${pb.pagecode>1}">
						<li><a href="pictures.do?pagecode=${pb.pagecode-1}">上一页</a></li>
					</c:if>
					<c:choose>
						<c:when test="${pb.totalpage<5}">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${pb.totalpage}"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${pb.pagecode-2}"></c:set>
							<c:set var="end" value="${pb.pagecode+3}"></c:set>
							<c:if test="${begin<1}">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="6"></c:set>
							</c:if>
							<c:if test="${end>pb.totalpage}">
								<c:set var="begin" value="${pb.totalpage-4}"></c:set>
								<c:set var="end" value="${pb.totalpage}"></c:set>
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${begin}" end="${end}">
						<li><a href="pictures.do?pagecode=${i}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pb.pagecode<pb.totalpage}">
						<li><a href="pictures.do?pagecode=${pb.pagecode+1}">下一页</a>
						</li>
					</c:if>
					<li><a href="pictures.do?pagecode=${pb.totalpage}">末页</a></li>
					<li><a href="Home.do">返回主页</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>