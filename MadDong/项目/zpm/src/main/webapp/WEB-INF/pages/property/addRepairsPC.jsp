<%--
  Created by IntelliJ IDEA.
  User: jj
  Date: 2017/10/30
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=request.getContextPath()%>/hui/"/>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


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

    <title>新增报修 - 报修管理 - H-ui.admin v3.1</title>
    <meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
    <style type="text/css">
        .img-div{
            border: 1px solid #ddd;
            border-radius: 100%;
            float: left;
            line-height: 1;
            margin-left: 5px;
            overflow: hidden;
        }
    </style>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-article-add" action="../repairs/insertSelective" enctype="multipart/form-data" method="post">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>报修内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="repContent" class="input-text" placeholder="" ></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上传照片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="xdaTanFileImg"  multiple="multiple"  name="fileAttach" onchange="xmTanUploadImg(this)"/>
                <div class="img-box" id="imgboxid">

                </div>

                <div id="xmTanDiv"></div>
                <div id="errordiv"   style="margin-top:15px;width:100%;text-align:center;">

                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">期望上门时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="date" name="repTime"/>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input id="bt" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
                <script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
                <script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
                <script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
                <script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
                <script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script>
                <script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script>
                <script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
                <script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
                <script type="text/javascript">
                    $(function(){
                        $('.skin-minimal input').iCheck({
                            checkboxClass: 'icheckbox-blue',
                            radioClass: 'iradio-blue',
                            increaseArea: '20%'
                        });

                        //表单验证
                        $("#form-article-add").validate({
                            rules:{
                                repContent:{
                                    required:true,
                                },
                                fileAttach:{
                                    required:true,
                                },
                                repTime:{
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

                        $list = $("#fileList"),
                            $btn = $("#btn-star"),
                            state = "pending",
                            uploader;


                    });
                    //添加照片
                    function xmTanUploadImg(obj) {

                        var fl=obj.files.length;
                        for(var i=0;i<fl;i++){
                            var file=obj.files[i];
                            var reader = new FileReader();

                            //读取文件过程方法

                            reader.onloadstart = function (e) {
                                console.log("开始读取....");
                            }
                            reader.onprogress = function (e) {
                                console.log("正在读取中....");
                            }
                            reader.onabort = function (e) {
                                console.log("中断读取....");
                            }
                            reader.onerror = function (e) {
                                console.log("读取异常....");
                            }
                            reader.onload = function (e) {
                                console.log("成功读取....");

                                var imgstr='<img style="width:100px;height:100px;" src="'+e.target.result+'"/>';
                                var oimgbox=document.getElementById("imgboxid");
                                var ndiv=document.createElement("div");

                                ndiv.innerHTML=imgstr;
                                ndiv.className="img-div";
                                oimgbox.appendChild(ndiv);

                            }

                            reader.readAsDataURL(file);
                        }

                    }
                </script>
                <!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
