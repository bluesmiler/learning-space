<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="gb2312">
    <title>住这儿论坛</title>
    <meta name="keywords" content="" />
    <meta name="description" content="。" />
    <base href="<%=request.getContextPath()%>/">
    <link href="wang/css/base.css" rel="stylesheet" type="text/css" />
    <link href="wang/css/index.css" rel="stylesheet" type="text/css" />
    <script src="js/silder.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <![endif]-->
    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <style type="text/css">
        .d1{
            border:1px solid white;
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
<div class="banner">
    <section class="box">
        <ul class="texts">
            <p>本着“全心全意为业主着想，尽心尽力为客户服务”的宗旨</p>
            <p>突出“高效快捷，细致周到”的物业管理服务风格</p>
            <p>为小区业主提供全方位的、不间断的物业管理服务工作。</p>
        </ul>

    </section>
</div>
<div class="template">
    <div class="box">
        <h3>
            <p><span>园区图片</span>展示 Show</p>
        </h3>
        <ul>
            <li><a href="/"  target="_blank"><img src="wang/images/timg.jpg"></a><span>乱石铺路，青草幽幽</span></li>
            <li><a href="/" target="_blank"><img src="wang/images/timg2.jpg"></a><span>蓝天白云</span></li>
            <li><a href="/"  target="_blank"><img src="wang/images/timg3.jpg"></a><span>屋檐后</span></li>
            <li><a href="/" target="_blank"><img src="wang/images/timg4.jpg"></a><span>花园</span></li>
            <li><a href="/"  target="_blank"><img src="wang/images/timg5.jpg"></a><span>全景展示</span></li>
            <li><a href="/"  target="_blank"><img src="wang/images/timg6.jpg"></a><span>河道</span></li>
        </ul>
    </div>
</div>
<article>
    <h2 class="title_tj">
        <p>文章<span>推荐</span></p>
    </h2>
    <div class="bloglist left">
            <c:forEach items="${list}" var="list">
        <h3> ${list.helpHeadline} </h3>
                <c:forEach items="${list.helpPictures}" var="pic">
        <figure><img src="help/doshow?helpPictureName=${pic.helpPictureAttribute}" width="175" height="117"></figure>
                </c:forEach>

        <ul>
            <p>${fn:substring(list.helpContent,0,80) }${fn:substring(".........",0,10)}</p>
            <a title="/" href="help/findId/${list.helpId}" target="_self" class="readmore">阅读全文>></a>
        </ul>
        <p class="dateview"><span> ${list.helpTime} </span><span>作者：${list.user.nickname}</span><span>推荐文章：[<a href="/news/life/">赞</a>]</span></p>
            </c:forEach>
        <br/>
        <br/>

        <div class="d1">
        一共${page.pages}页
            <%--<p>${page.pageNum }</p>--%>
        <a href="help/list?page=${page.firstPage}">第一页</a>
        <a href="help/list?page=${page.prePage}">上一页</a>
        <c:forEach var='i' begin="1" end="${page.pages }" step="1">
            <a href="help/list?page=${i }">${i }</a>
        </c:forEach>
        <a href="help/list?page=${page.nextPage}">下一页</a>
        <a href="help/list?page=${page.lastPage}">最后页</a>
        </div>
    </div>

    <aside class="right">
        <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
        <div class="news">
            <h3>
                <p>热点<span>推送</span></p>
            </h3>
            <ul class="rank">
                <li><a href="complain/preInsert" target="_blank">添加投诉</a></li>
                <li><a href="repairs/preInsert" target="_blank">添加报修</a></li>
                <li><a href="feedback/preInsert" target="_blank">意见反馈</a></li>
                <li><a href="sendwater/preInsert" target="_blank">送水</a></li>
                <li><a href="repairs/chat" target="_blank">mad dog聊天室</a></li>
                <%--<li><a href="http://jiaju.sina.com.cn/news/20171101/6331314731059839404.shtml" title="蒙娜丽莎集团首发通过 陶瓷行业又将迎来一上市企业" target="_blank">蒙娜丽莎集团首发通过 陶瓷行业又将迎来一上市企业</a></li>--%>
                <%--<li><a href="http://jiaju.sina.com.cn/news/20171101/6331303145884680402.shtml" title="红木料涨价但家具市场冷清" target="_blank">红木料涨价但家具市场冷清</a></li>--%>
                <%--<li><a href="http://jiaju.sina.com.cn/news/20151214/6081997407292555392.shtml" title="智能家居普及之路仍漫长" target="_blank">智能家居普及之路仍漫长</a></li>--%>
                <%--<li><a href="http://jiaju.sina.com.cn/news/20151211/6081029344778846309.shtml" title="家居周观察|“互联网+”的照明到底能有多智能？" target="_blank">家居周观察|“互联网+”的照明到底能有多智能？</a></li>--%>
                <%--<li><a href="http://zx.jiaju.sina.com.cn/anli/104021.html" title="汉口城市广场新中式儒家雅韵" target="_blank">汉口城市广场新中式儒家雅韵</a></li>--%>
                <%--<li><a href="http://jiaju.sina.com.cn/news/20171031/6330936670145544340.shtml" title="破解家装合同纠纷难题 法官来拆招" target="_blank">破解家装合同纠纷难题 法官来拆招</a></li>--%>
                <li><a href="http://jiaju.sina.com.cn/news/20171030/6330675146457940984.shtml" title="家居直播周刊｜急！万圣节不出门在家看些啥？" target="_blank">家居直播周刊｜急！万圣节不出门在家看些啥？</a></li>
                <li><a href="http://jiaju.sina.com.cn/zixun/20171030/6330594998660432322.shtml" title="2017中国（川姜）床品数码印花趋势专题交流会震撼来袭" target="_blank">2017中国（川姜）床品数码印花趋势专题交流会震撼来袭</a></li>
            </ul>
            <h3 class="ph">
                <p>点击<span>排行</span></p>
            </h3>
            <ul class="paih">
                <li><a href="/" title="蒙娜丽莎集团首发通过 陶瓷行业又将迎来一上市企业" target="_blank">蒙娜丽莎集团首发通过 陶瓷行业又将迎来一上市企业</a></li>
                <li><a href="/" title="红木料涨价但家具市场冷清" target="_blank">红木料涨价但家具市场冷清</a></li>
                <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
                <li><a href="/" title="智能家居普及之路仍漫长" target="_blank">智能家居普及之路仍漫长</a></li>
                <li><a href="/" title="企业做家具具体流程步骤" target="_blank">企业做家具具体流程步骤</a></li>
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
        <a href="/" class="weixin"> </a></aside>
</article>
</body>
</html>
