<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<script type="text/javascript" src="ckeditor/ckeditor.js"></script>--%>
    <title>写帖子</title>
    <base href="<%=request.getContextPath()%>/">
</head>
<body>
<form method="post" enctype="multipart/form-data" action="help/add">
    标题：<input type="text" name="helpHeadline"><br/>
    内容：<input type="text" name="helpContent"><br/>
    图片：<input type="file" name="file" id="helpPictureName" ><br/>
    <input type="submit" value="提交">
</form>

</body>
</html>