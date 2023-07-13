<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=request.getContextPath() %>/" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title> 投诉</title>
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

<script type="text/javascript">
    //选择图片，马上预览
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
<%--<form id="form"  action="complain/insertSelective" enctype="multipart/form-data" method="post">--%>
		<%--投诉内容：<textarea name="complainContent"></textarea><br/>--%>
		<%--<input type="file" id="xdaTanFileImg"  multiple="multiple"  name="fileAttach" onchange="xmTanUploadImg(this)"/>--%>
    <%--<div class="img-box" id="imgboxid">--%>
	<%----%>
    <%--</div>--%>

	                  <%--<div id="xmTanDiv"></div><br/>--%>
	            <%--<div id="errordiv"   style="margin-top:15px;width:100%;text-align:center;">--%>
	            <%----%>
            <%--</div><br/>--%>
    <%--期望上门时间：<input type="date" name="complainTime"/><br/>--%>
    	<%--<input id="bt" type="submit" name="submit" value="提交" /> --%>
<%--</form>--%>



<form class="form-horizontal" role="form" action="complain/insertSelective" enctype="multipart/form-data" method="post">
    <div class="form-group">
        <label for="firstname" class="col-sm-2 control-label">投诉内容:</label>
        <div class="col-sm-10">
            <textarea name="complainContent" class="form-control" id="firstname"
                      placeholder="请输入投诉内容"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">上传图片</label>
        <div class="col-sm-10">
            <input type="file" id="xdaTanFileImg"  multiple="multiple"  name="fileAttach" onchange="xmTanUploadImg(this)"/>
            <div class="img-box" id="imgboxid">

            </div>

            <div id="xmTanDiv"></div><br/>
            <div id="errordiv"   style="margin-top:15px;width:100%;text-align:center;">

            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>