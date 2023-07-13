<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=request.getContextPath()%>/">
    <title>Insert title here</title>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="tian/css/bootstrap.min.css"/>
</head>
<body>

<div class="container">

    <form class="form-horizontal col-xs-offset-1" action="bus/modify" method="post" enctype="multipart/form-data">
        <h3 class="page-header">添加商品</h3>
        <input type="hidden" name="id" value="${good.id}">
        <input type="hidden" name="busId" value="${good.busId}">
        <div class="form-group">
            <div class="col-xs-4">
                <label >商品名称
                    <input class="form-control input-sm" type="text" name="name" value="${good.name}">
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-4">
                <label >商品价格
                    <input class="form-control input-sm" type="text" name="price" value="${good.price}">
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-4">
                <label >商品图片
                    <input class="form-control input-sm" type="file" name="file">
                </label>
            </div>
        </div>


        <div class="form-group">
            <div class="col-xs-10">
                <label >商品内容
                    <textarea  class="ckeditor" name="content" >${good.content}</textarea>
                </label>
            </div>
        </div>

        <input class="btn btn-primary btn-sm" type="submit" value="提交"/>
    </form>

</div>
</body>
</html>
<script type="text/javascript">
    CKEDITOR.replace('content', {
        "filebrowserUploadUrl" : "<%=request.getContextPath()%>/ck/upload"
    });
</script>