<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/26 0026
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/">
</head>
<body>
    <c:forEach items="${commList}" var="comm">
        ${comm.comm_name}
    </c:forEach>
    <c:if test="${user.sex eq '男'}">

        123
    </c:if>
</body>
</html>
