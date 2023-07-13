<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<base href="<%=request.getContextPath() %>/" />
<link rel="icon" href="img/dog.ico"/>
<!--[if lt IE 9]>
<script type="text/javascript" src="hui/lib/html5shiv.js"></script>
<script type="text/javascript" src="hui/lib/respond.min.js"></script>
<![endif]-->
<link href="hui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="hui/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="hui/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="hui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<!--[if IE 6]>
<script type="text/javascript" src="hui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>登录界面</title>

</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper" style="padding-top:0px">




    <div id="loginform" class="loginBox" style="padding-top:0px">

      <form class="form form-horizontal" action="user/login" id="form" method="post">
        <div class="row c1">
          <div class=" col-xs-8 col-xs-offset-5">
            <h3 >用户登录</h3>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-3 "><i class="Hui-iconfont">&#xe60d;</i></label>
          <div class="formControls col-xs-5">
            <input id="phone" style="width: 300px;" name="phone" type="text" placeholder="手机号码" class="input-text size-M"/>
            <span id="phoneSpan"></span>
          </div>
        </div>

        <div class="row cl">
          <label class="form-label col-xs-3 "><i class="Hui-iconfont">&#xe60e;</i></label>
          <div class="formControls col-xs-5">
            <input  name="password" style="width:300px" id="password" type="password" placeholder="密码" class="input-text size-M"/>
            <span id="passwordSpan"></span>
          </div>
        </div>

        <div class="row cl">
          <div class="formControls col-xs-7 col-xs-offset-3">
            <input class="input-text size-M" type="text" placeholder="验证码" name="validateCode" id="validateCode" style="width:100px;">
            <img id="img" src="verificationCode/show/1" >
            <a id="kanbuq" href="javascript:fresh();">看不清，换一张</a>
          </div>
        </div>

        <div class="row cl">
          <div class="formControls col-xs-5 col-xs-offset-3">
            <button TYPE="button" style="width: 300px" id="login"  class="btn btn-primary btn-block"  >&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</button>
            <a href="user/toRegister">注册账号</a>
            <span style="width: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span id="reminder" style="color:red;">${reminder}</span>
          </div>
        </div>
      </form>
    </div>
</div>
<div class="footer">Copyright MadDog物业管理系统</div>
</body>
</html>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
  $(function () {
      $("#phone").focus(function () {
          $("#reminder").text("")
      })
      $("#password").focus(function () {
          $("#reminder").text("")
      })
      $("#validateCode").focus(function () {
          $("#reminder").text("")
      })

      $("#login").mouseleave(function () {
          $("#login").blur();
      })

      var phoneTest = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/
      var passwordTest =/^[a-zA-Z0-9_-]{6,16}$/
      var phone =$("#phone");
      var password = $("#password")
      var phoneSpan =$("#phoneSpan")
      var passwordSpan=$("#passwordSpan")

      phone.blur(function () {

          if (!phoneTest.test(phone.val())){
              phone.css("border-color","red")
              phoneSpan.text("格式不正确").css("color",'red');
          }
      })

      phone.focus(function () {
          phone.css("border-color","#ddd")
          phoneSpan.text("");
      })

      password.blur(function () {

          if (!passwordTest.test(password.val())){
              password.css("border-color","red")
              passwordSpan.text("格式不正确").css("color",'red');
          }
      })

      password.focus(function () {
          password.css("border-color","#ddd")
          passwordSpan.text("");
      })

      $("#login").click(function () {
          if (phoneTest.test(phone.val())&&passwordTest.test(password.val())){
              $("#form").submit();
          }
      })


  })






  function fresh() {
//      ?后需要跟一个随机数，后端不会做处理，作用是避免浏览器读取缓存的链接，这里是使用系统当前日期
      $("#img").attr("src","verificationCode/show/"+new Date());
  }

</script>