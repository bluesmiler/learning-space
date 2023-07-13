<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>添加用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理<span class="c-gray en">&gt;</span> 用户信息修改 <a class="btn btn-success radius r" id="fresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<article class="page-container">
    <form class="form form-horizontal" id="form-article-add" action="../complain/update"  method="post">
        <input type="hidden" name="complainId" value="${complainWithBLOBs.complainId}"/>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理人员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${complainWithBLOBs.handleman}" placeholder="${complainWithBLOBs.handleman}" id="handleman" name="handleman"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>反馈结果:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${complainWithBLOBs.complainFdb}" placeholder="${complainWithBLOBs.complainFdb}" id="complainFdb" name="complainFdb"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${complainWithBLOBs.fdbSituation==2}">
                        <input type="radio" name="fdbSituation" value="2" checked="checked">处理完毕
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="fdbSituation"  value="2">处理完毕
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${complainWithBLOBs.fdbSituation==1}">
                        <input type="radio" name="fdbSituation" value="1" checked="checked">处理完毕
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="fdbSituation"  value="1">处理完毕
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${complainWithBLOBs.fdbSituation!=2 and complainWithBLOBs.fdbSituation!=1}">
                        <input type="radio" name="fdbSituation" value="0" checked="checked">未处理
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="fdbSituation"  value="0">处理完毕
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

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-member-add").validate({
            rules:{
                handleman:{
                    required:true,
                },
                complainFdb:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
            }
        });


    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>