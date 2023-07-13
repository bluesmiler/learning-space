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
    <h1 class="t_nav"><span>有事说事儿，无事儿退堂。</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">议事厅</a></h1>
    <div class="newblog left">
        <div id="content">
            <c:forEach items="${list}" var="list" >
                <div class="line"></div>
                <h2>${list.congressHallHeadline}</h2>
                <p class="dateview"><span>发布时间：${list.congressHallTime}</span><span>作者： ${list.user.nickname}</span><span>分类：[<a href="/news/life/">议事厅</a>]</span></p>
                <c:forEach items="${list.congPictuers}" var="pic">
                    <figure><img src="cong/doshow?congPictureName=${pic.congPictureAttribute}" width="175" height="117" id="allUrl"></figure>
                </c:forEach>
                <ul class="nlist">
                    <p>${fn:substring(list.congressHallContent,0,80) }${fn:substring(".........",0,10)}</p>
                    <a title="/" href="cong/findId/${list.congressHallId}" target="_self" class="readmore">阅读全文>></a>
                </ul>
            </c:forEach>
        </div>


        <div class="line"></div>
        <div class="blank"></div>
        <div class="ad">

            <div class="mail">
                <div class="send">
                    <div class="sendbox">
                        <form  action="cong/add" id="jvForm" method="post" class="messages" enctype="multipart/form-data">

                            <div class="messlist" >
                                <label>标题</label>
                                <input type="text" name="congressHallHeadline">
                            </div>

                            <div class="messlist textareas">
                                <label>帖子内容</label>
                                <textarea type="text" placeholder="说点什么吧..." name="congressHallContent"></textarea>
                                <div class="clears"></div>
                            </div>
                            <label>添加图片</label> <input type="file" name="file" id="congPictureName" >

                            <div class="messsub">
                                <input type="submit" value="提交" style="background:#00a3eb;color:#fff;" />
                                <input type="reset" value="重填" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="d1">
        一共${page.pages}页
        <%--<p>${page.pageNum }</p>--%>
        <a href="cong/list?page=${page.firstPage}">第一页</a>
        <a href="cong/list?page=${page.prePage}">上一页</a>
        <c:forEach var='i' begin="1" end="${page.pages }" step="1">
            <a href="cong/list?page=${i }">${i }</a>
        </c:forEach>
        <a href="cong/list?page=${page.nextPage}">下一页</a>
        <a href="cong/list?page=${page.lastPage}">最后页</a>
        </div>

    </div>
    <aside class="right">
        <div class="rnav">
            <ul>
                <li class="rnav1"><a href="/download/" target="_blank">日记</a></li>
                <li class="rnav2"><a href="/newsfree/" target="_blank">程序人生</a></li>
                <li class="rnav3"><a href="/web/" target="_blank">欣赏</a></li>
                <li class="rnav4"><a href="/newshtml5/" target="_blank">短信祝福</a></li>
            </ul>
        </div>
        <div class="news">
            <h3>
                <p>最新<span>文章</span></p>
            </h3>
            <ul class="rank">
                <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
                <li><a href="/" title="with love for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
                <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
                <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
                <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
                <li><a href="/" title="建站流程篇——教你如何快速学会做网站" target="_blank">建站流程篇——教你如何快速学会做网站</a></li>
                <li><a href="/" title="box-shadow 阴影右下脚折边效果" target="_blank">box-shadow 阴影右下脚折边效果</a></li>
                <li><a href="/" title="打雷时室内、户外应该需要注意什么" target="_blank">打雷时室内、户外应该需要注意什么</a></li>
            </ul>
            <h3 class="ph">
                <p>点击<span>排行</span></p>
            </h3>
            <ul class="paih">
                <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
                <li><a href="/" title="withlove for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
                <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
                <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
                <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
            </ul>
        </div>
        <div class="visitors">

            <ul>

            </ul>
        </div>
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>
        <!-- Baidu Button END -->
    </aside>
</article>

</body>
</html>
<script type="text/javascript" src="wang/js/modernizr.js" ></script>
<script type="text/javascript" src="wang/js/jquery-3.2.1.min.js" ></script>

<script src="wang/js/silder.js"></script>

