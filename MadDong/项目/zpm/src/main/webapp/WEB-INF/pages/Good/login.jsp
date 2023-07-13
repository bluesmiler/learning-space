<%--
  Created by IntelliJ IDEA.
  User: tzj
  Date: 2017/10/30
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>商家登录</title>
    <base href="<%=request.getContextPath()%>/">
    <link href="tian/css/login.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="login">
    <div class="message">商户登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" action="bus/doLogin">

        <input name="userName" placeholder="用户名/手机号" required="" type="text">
        <hr class="hr15">
        <input name="passWord" placeholder="密码" required="" type="password">
        <hr class="hr15">
        <input value="登录" style="width:100%;" type="submit">
        <hr class="hr20">
        <!-- 帮助 <a onClick="alert('请联系管理员')">忘记密码</a> -->
    </form>
    <a href="bus/doRegist">没有账号 ？ 立即注册</a>


</div>

<div class="copyright">© 2016品牌名称 by <a href="http://www.mycodes.net/" target="_blank">源码之家</a></div>
</body>
</html>
