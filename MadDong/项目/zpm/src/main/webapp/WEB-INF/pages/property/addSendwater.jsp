<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/1
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()%>/" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>添加送水</title>
</head>
<body>
<form class="form-horizontal" role="form" action="sendwater/insertSelective" method="post">
    <div class="form-group">
        <label class="col-sm-2 control-label">品牌</label>
        <div class="col-sm-10">
            <select name="orderBand">
                <option value="三元" selected="selected">三元</option>
                <option value="景泰">景泰</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">桶数</label>
        <div class="col-sm-10">
            <select name="orderCount">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">是否带空桶</label>
        <div class="col-sm-10">
            <input type="radio" value="0" name="orderBarrel">不需带
            <input type="radio" value="1" name="orderBarrel">需带
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>
</html>
