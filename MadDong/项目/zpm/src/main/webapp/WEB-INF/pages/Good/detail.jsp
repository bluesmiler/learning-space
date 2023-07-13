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
        <title>article no sidebar  | Amaze UI Examples</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
        <link rel="stylesheet" href="tian/css/amazeui.min.css">
        <link rel="stylesheet" href="tian/css/app.css">
</head>

<body id="blog-article-sidebar">
<!-- header start -->
<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
        <div class="am-u-sm-8 am-u-sm-centered">
                <h2 class="am-hide-sm-only">商品详情</h2>
        </div>
</header>
<!-- header end -->
<hr>

<!-- nav start -->
<nav class="am-g am-g-fixed blog-fixed blog-nav">
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="blog-collapse">
                <ul class="am-nav am-nav-pills am-topbar-nav">
                        <li><a href="bus/allBus">商户首页</a></li>
                </ul>
                <form class="am-topbar-form am-topbar-right am-form-inline" role="search">
                        <div class="am-form-group">
                                <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
                        </div>
                </form>
        </div>
</nav>
<!-- nav end -->
<hr>
<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed blog-content">
        <div class="am-u-sm-12">
                <article class="am-article blog-article-p">
                        <div class="am-article-hd">
                                <h1 class="am-article-title blog-text-center">${busGood.name }</h1>
                                <h3 style="color: red">单价：${busGood.price}元/个</h3>
                                <img src="good/show/${busGood.image}" alt="" class="blog-entry-img blog-article-margin">
                                <div>
                                        ${busGood.content }
                                </div>

                        </div>
                </article>
        </div>
</div>
<!-- content end -->


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