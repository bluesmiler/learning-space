<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=request.getContextPath() %>/" />
<title>帖子</title>
</head>
<body>
	<h1>议事厅</h1>
	 <c:forEach items="${list}" var="list">
	 	${list.congressHallHeadline}<br/>
		 ${list.congressHallContent}<br/>
		 ${list.user.nickname}<br/>
	 	${list.congressHallTime}<br/>
	 		<c:forEach items="${list.congPictuers}" var="pic">
				${pic.congPictureName}<br/>
				${pic.congPictureAttribute}<br/>
			</c:forEach>
	  </c:forEach>
</body>
</html>