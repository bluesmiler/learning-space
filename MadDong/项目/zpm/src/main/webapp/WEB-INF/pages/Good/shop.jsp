<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<base href="<%=request.getContextPath()%>/">
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

	<link rel="stylesheet" type="text/css" href="tian/css/amazeui.min.css">
	<link rel="stylesheet" href="tian/css/app.css">
</head>

<body id="blog">

<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
	<div class="am-u-sm-8 am-u-sm-centered">
		<h2 class="am-hide-sm-only">便利商品</h2>
	</div>
</header>
<hr>
<nav class="am-g am-g-fixed blog-fixed blog-nav">
	<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

	<div class="am-collapse am-topbar-collapse" id="blog-collapse">
		<ul class="am-nav am-nav-pills am-topbar-nav">
			<li class="am-active"><a href="good/list">所有商品</a></li>
			<li class="am-dropdown" data-am-dropdown>
				<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
					商品分类 <span class="am-icon-caret-down"></span>
				</a>
				<ul class="am-dropdown-content">
					<li><a href="good/typeGood?id=1">饮用水</a></li>
					<li><a href="good/typeGood?id=2">电子锁</a></li>
					<li><a href="good/typeGood?id=3">烟酒</a></li>
					<li><a href="good/typeGood?id=4">零食</a></li>
				</ul>
			</li>
			<li><a href="good/preAdd">添加商品</a></li>
			<li><a href="cart/list">我的购物车</a></li>
		</ul>
		<form class="am-topbar-form am-topbar-right am-form-inline" role="search">
			<div class="am-form-group">
				<input type="text" class="am-form-field am-input-sm" placeholder="搜索">
			</div>
		</form>
	</div>
</nav>
<hr>


<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed">
	<div class="am-u-md-12 am-u-sm-12">
		<c:forEach items="${list }" var="li">
			<article class="am-g blog-entry-article">
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
					<a href="good/detail?id=${li.id }"><img src="good/show/${li.image}" alt="" style="height: 300px ;width:533px "  class="am-u-sm-12"></a>
				</div>
				<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
					<span>${li.name }&nbsp;</span>
					<span>${li.price}元/个&nbsp;&nbsp;</span>
					<span style="color: green">${li.goodType.name}&nbsp;</span>
					<a href="good/delete?id=${li.id}"><button class="am-btn-link"><span class="am-icon-scissors "></span>删除&nbsp;&nbsp;</button></a>
					<a href="good/preModify?id=${li.id}"><button class="am-btn-link"><span class="am-icon-eraser "></span>修改</button></a>
					<p>${li.contentShort }</p>
				</div>
			</article>
		</c:forEach>
	</div>
</div>
<!-- content end -->

<div class="am-g am-g-fixed blog-fixed" >
	一共${page.pages}页
	<%--<p>${page.pageNum }</p>--%>
	<a href="good/list?page=${page.firstPage}">第一页</a>
	<a href="good/list?page=${page.prePage}">上一页</a>
	<c:forEach var='i' begin="1" end="${page.pages }" step="1">
		<a href="good/list?page=${i }">${i }</a>
	</c:forEach>
	<a href="good/list?page=${page.nextPage}">下一页</a>
	<a href="good/list?page=${page.lastPage}">最后页</a>
</div>



<!--[if (gte IE 9)|!(IE)]><!-->
<script src="tian/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="tian/js/amazeui.min.js"></script>
<!-- <script src="assets/js/app.js"></script> -->
</body>
</html>