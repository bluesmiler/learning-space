<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/30
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=request.getContextPath()%>/hui/"/>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
    <meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-article-add" action="../repairs/update"  method="post">
        <input type="hidden" name="repId" value="${repairs.repId}"/>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理人员：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="${repairs.repMan}" placeholder="${repairs.repMan}" id="repMan" name="repMan"/>
        </div>
    </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${repairs.handleSituation==2}">
                        <input type="radio" name="handleSituation" value="2" checked="checked">处理完毕
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="handleSituation"  value="2">处理完毕
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${repairs.handleSituation==1}">
                        <input type="radio" name="handleSituation" value="1" checked="checked">处理完毕
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="handleSituation"  value="1">处理完毕
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${repairs.handleSituation !=2 and repairs.handleSituation !=1}">
                        <input type="radio" name="handleSituation" value="0" checked="checked">未处理
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="handleSituation"  value="0">处理完毕
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
</body>
</html>

