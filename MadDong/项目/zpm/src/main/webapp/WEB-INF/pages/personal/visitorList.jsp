<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>访客列表</title>
</head>
<body>

    <c:forEach items="${list}" var="vList">
        <p>访客姓名：${vList.visitorName}</p>
        <p>访客性别；${vList.visitorSex}</p>
        <p>拜访日期：<fmt:formatDate value="${vList.createTime}" dateStyle="yyyy-MM-dd"></fmt:formatDate></p>
        <p>拜访二维码：
        <image src="show/${vList.codeName}"/>

        </p>
    </c:forEach>

</body>
</html>