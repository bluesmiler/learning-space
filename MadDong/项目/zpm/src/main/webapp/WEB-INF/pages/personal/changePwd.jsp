<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<title>修改密码 - 会员管理 - H-ui.admin v3.1</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理<span class="c-gray en">&gt;</span> 密码修改 <a class="btn btn-success radius r" id="fresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<article class="page-container">
	<form action="../user/updatePwd" method="post" class="form form-horizontal" id="change" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${user.truename} </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${user.phone} </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input  type="hidden" value="${user.userId}" name="userId" />
				<input type="password" style="width: 300px" class="input-text" autocomplete="off" placeholder="不修改请留空" name="password" id="password">
				<span id="span" style="color:red;"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" style="width: 300px" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword2" id="newpassword">
				<span id="newSpan" style="color:red;"></span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" id="btn" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<span id="reminder" style="color:red;"></span>
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
    var passwordTest =/^[a-zA-Z0-9_-]{6,16}$/
	var password1 = $('#password');
    var newpassword =$('#newpassword');
    password1.blur(function () {
		if (!passwordTest.test(password1.val())){
		    $('#span').text('密码长度需要大于6位')
		}
    })

    newpassword.blur(function () {
        if (!passwordTest.test(newpassword.val())){
            $('#newSpan').text('密码长度需要大于6位')
        }
    })

	$('#btn').click(function () {
        if (password1.val()==newpassword.val()&&(passwordTest.test(password1.val())&&passwordTest.test(newpassword.val()))){
            $('#change').submit()
        }else{
            password1.val('')
            newpassword.val('')
            if (password1.val()!=newpassword.val()){
                $('#reminder').text("两次密码不相等")
            }
        }
    })

	password1.focus(function () {
        $('#span').text('')
        $('#reminder').text("")
    })

	newpassword.focus(function () {
        $('#newSpan').text('')
        $('#reminder').text("")
    })


});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>