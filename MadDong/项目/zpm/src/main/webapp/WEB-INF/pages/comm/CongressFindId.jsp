<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="gb2312">
    <title>详情</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <base href="<%=request.getContextPath()%>/">
    <link href="wang/css/base.css" rel="stylesheet">
    <link href="wang/css/new.css" rel="stylesheet">

    <link rel="stylesheet" href="wang/css/styless.css">
    <link rel="stylesheet" href="wang/css/commentss.css">

    <!--[if lt IE 9]>
    <script src="wang/js/modernizr.js"></script>
    <![endif]-->

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

    </style>
</head>
<body>
<script src="wang/demos/googlegg.js"></script>

<header>
    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav"><a href="help/list"><span>官网首页</span><span class="en">Protal</span></a><a href="good/list"><span>便利商品</span><span class="en">About</span></a><a href="cong/list/"><span>议事厅</span><span class="en">CongressHall</span></a><a href="share/list"><span>邻里分享</span><span class="en">NeighborsShare</span></a><a href="bus/allBus"><span>周边商户</span><span class="en">CommunityActivities</span></a><a href="cong/skip"><span>个人帖子</span><span class="en">SecondaryMarket</span></a><a href="book.html"><span>登陆</span><span class="en">Log in</span></a></nav>
    </nav>
</header>
<article class="blogs">
    <h1 class="t_nav"><span>您当前的位置：<a href="/index.html">首页</a>&nbsp;&gt;&nbsp;<a href="/news/s/">议事厅</a>&nbsp;&gt;&nbsp;<a href="/news/s/">这事儿</a></span><a href="/" class="n1">网站首页</a><a href="/" class="n2">议事厅</a></h1>
    <div class="index_about">
        <h2 class="c_titile">${congressHall.congressHallHeadline}</h2>
        <p class="box_c"><span class="d_time">发布时间：${congressHall.congressHallTime}</span><span>编辑：${congressHall.user.nickname}</span></p>
        <ul class="infos">

            <p>${congressHall.congressHallContent}</p>
        <c:forEach items="${congressHall.congPictuers}" var="pic">
            <p><img src="cong/doshow?congPictureName=${pic.congPictureAttribute}" ></p>
        </c:forEach>
        </ul>

        <div class="ad"> </div>
        <div class="nextinfo">
            <%--<p>上一篇：<a href="/news/s/2013-09-04/606.html">程序员应该如何高效的工作学习</a></p>--%>
            <%--<p>下一篇：<a href="/news/s/2013-10-21/616.html">柴米油盐的生活才是真实</a></p>--%>
        </div>
        <div class="otherlink">
            <h2>评论区</h2>

            <ul>
                <form  method="post" id="yourformid">
                    <input type="hidden" name="congressHallId"value="${congressHall.congressHallId}">
                <tr >
                <td></td>
                <td>
                    <div class="messlist textareas">
                        <label>评论</label>
                        <textarea type="text" placeholder="说点什么吧..." name="commentContent"></textarea>
                        <div class="clears"></div>
                    </div>
                </td>
                </tr>
                <input type="submit" value="提交" onclick="commit1()" >
                </form>


                <c:forEach var="allList" items="${allList}">

                    ${allList.commentId }楼----${allList.user.nickname }:${allList.commentTime }<button onclick="fn('#ss${allList.commentId}')">点击这里</button>
                    <div style="display: none;" id="ss${allList.commentId}">
                        <form action="cong/addReply" method="post" id="form${allList.commentId}" >
                            <input type="hidden" name="id" value="${congressHall.congressHallId}"/>
                            <input type="hidden" name="commentId" value="${allList.commentId}">
                            <%--有问题--%>
                            <%--<input type="hidden" name="userId" value="${allList.user.userId}">--%>
                            <input type="text" name="replyContent" >
                            <input type="button" value="回复" id="${allList.commentId}" onclick="reply(this)">
                        </form>
                    </div>
                    <p>${allList.commentContent }</p><br/>
                    <c:forEach var="replies" items="${allList.replyList}">
                        ${replies.user.nickname}:${replies.replyTime}回复：${allList.user.nickname}<br/>
                        <br/>
                        ${replies.replyContent}
                        <ul></ul>
                        <hr/>
                    </c:forEach>
                </c:forEach>

            </ul>
        </div>
    </div>
    <aside class="right">
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>
        <!-- Baidu Button END -->
        <div class="blank"></div>
        <div class="news">
            <h3>
                <p>栏目<span>最新</span></p>
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
            <h3>

            </h3>
            <ul>
            </ul>
        </div>
    </aside>
</article>

<script src="wang/js/silder.js"></script>
</body>
</html>
<script type="text/javascript" src="wang/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript">
    function  fn(ss) {
        $(ss).show();
    }
    function commit1() {
        $.ajax({
            cache: true,
            type: "POST",
            url:"cong/addComment",
            data:$('#yourformid').serialize(),// 你的formid
            async: false,
            error: function(request) {
            },
            success: function(data) {
                $("#commonLayout_appcreshi").parent().html(data);
                window.location.reload();
            }
        });
    }

    function reply(item) {
        var commentId = $(item).attr('id')
        var formId = '#form'+commentId;
           $(formId).submit();
//           alert("回复成功")
//        parent.location.reload();

    }



</script>