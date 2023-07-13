<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

    <meta charset="gb2312">
    <title>住这儿论坛</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <base href="<%=request.getContextPath()%>/">
    <link href="wang/css/base.css" rel="stylesheet" type="text/css" />
    <link href="wang/css/style.css" rel="stylesheet" type="text/css" />

    <!--[if lt IE 9]><![endif]-->

    <style>
        *{margin:0px;padding:0px;}
        body{background-color:#f9f9f9;}

        .clears{ clear:both;}
        /*messages*/
        .messages{padding:15px 0;}
        .messages input,.messages select,.messages textarea{margin:0;padding:0; background:none; border:0; font-family:"Microsoft Yahei";}
        .messlist {height:30px;margin-bottom:10px;}
        .messlist label{float:left;width:100px; height:30px; font-size:14px; line-height:30px; text-align:right;padding-right:10px;}
        .messlist input{float:left;width:300px;height:28px;padding-left:5px;border:#ccc 1px solid;}
        .messlist.textareas{ height:auto;}
        .messlist textarea{float:left;width:400px; height:110px;padding:5px;border:#ccc 1px solid;}
        .messlist.yzms input{width:100px;}
        .messlist.yzms .yzmimg{ float:left;margin-left:10px;}
        .messsub{padding:0px 0 0 110px;}
        .messsub input{width:100px; height:35px; background:#ddd; font-size:14px; font-weight:bold; cursor:pointer;margin-right:5px}
        .messsub input:hover{ background:#f60;color:#fff;}
        #label0{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label1{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label2{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label3{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label4{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label5{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label6{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label7{display:none;color:#0aa770;height:28px;line-height:28px;}
        #label8{display:none;color:#0aa770;height:48px;line-height:48px;}
        #label9{display:none;color:#0aa770;height:48px;line-height:48px;}
        #label10{display:none;color:#0aa770;height:48px;line-height:48px;}
        .d1{
            width:600px;
            height:100px;
            margin-top: 30px;
            text-align:center;
            line-height:40px;
        }
    </style>

</head>
<body>
<header>

    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav"><a href="help/list"><span>官网首页</span><span class="en">Protal</span></a><a href="good/list"><span>便利商品</span><span class="en">About</span></a><a href="cong/list/"><span>议事厅</span><span class="en">CongressHall</span></a><a href="share/list"><span>邻里分享</span><span class="en">NeighborsShare</span></a><a href="bus/allBus"><span>周边商户</span><span class="en">CommunityActivities</span></a><a href="cong/skip"><span>个人帖子</span><span class="en">SecondaryMarket</span></a><a href="book.html"><span>登陆</span><span class="en">Log in</span></a></nav>
    </nav>
</header>
<article class="blogs">
    <h1 class="t_nav"><span></span><a href="/" class="n1">网站首页</a><a href="/" class="n2">个人帖子</a></h1>
    <div class="newblog left">
        <div id="content">

                <div class="line"></div>
               <h2><a href="cong/findge"> 议事厅</a></h2>
            <h2><a href="share/findsge"> 邻里分享</a></h2>
        </div>


        <div class="line"></div>
        <div class="blank"></div>
        <div class="ad">




    </div>
    <aside class="right">
        <div class="rnav">
            <ul>

            </ul>
        </div>
        <div class="news">
            <h3>

            </h3>
            <ul class="rank">

            </ul>
            <h3 class="ph">

            </h3>

        </div>
        <div class="visitors">

            <ul>

            </ul>
        </div>
        <!-- Baidu Button BEGIN -->

        <!-- Baidu Button END -->
    </aside>
</article>

</body>
</html>
<script type="text/javascript" src="wang/js/modernizr.js" ></script>
<script type="text/javascript" src="wang/js/jquery-3.2.1.min.js" ></script>

<script src="wang/js/silder.js"></script>

