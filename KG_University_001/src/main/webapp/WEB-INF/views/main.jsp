<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>KG_University</title>
</head>
<body>

	<h2>메인화면</h2>
	서점
	<c:forEach items="${bvo}" var = "bvo" begin="0" end="4">
		${bvo.book_name}
	</c:forEach>
	
	<br><br>
	자유게시판
	<c:forEach items="${fvo}" var = "fvo" begin="0" end="4">
		${fvo.title}
	</c:forEach>
</body>
</html>