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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<script src="../resources/js/jquery/jquery.min.js"></script>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">


<title>책 판매 목록</title>
<style>
  div.pagee.ul li {list-style: none; float: left; padding: 6px; }
 
 ul li { display:inline-block; margin:10px; }
  div.pic img { width:200px; height:200px; }
  div.book1 { padding:10px 0; text-align:center; }
  div.book1 a { color:#000; }

</style>

</head>
<body>

<div class="all" align="center">

<form action = "search.do" method="get">
<select name = "searchType" id = "searchType">
	<option value = "book_name" <c:out value = "${search.searchType eq 'book_title' ? 'selected' : ''}"/>>책 제목</option>
	<option value = "book_writer" <c:out value = "${search.searchType eq 'book_writer' ? 'selected' : ''}"/>>글쓴이</option>
</select>
<input type = "keyword" name = 'keyword' value = "${search.keyword}">
<input type = "submit" class="btn btn-success" value = "검색" >
</form><br>



<div class="container1" style="width: 1300px; margin: auto;">
	      <ul>
	<c:forEach items = "${supPaging}" var = "List" >
	<li>
	
	<div class ="pic"><!-- 책 사진 -->>
		<img src ="<spring:url value='/resources/img/${List.book_picture}'/>">
		</div>
		<div class="book1"><!-- 책 명 -->>
	<a href="${path}/book/getBookInfo.do${pageMaker.makeQuery(pageMaker.supPaging.page)}&book_name=${List.book_name}">${List.book_name}</a>
	</div>
		<div class="book1"><!-- 저자 -->
	${List.book_writer}
	</div>
		<div class="book1"><!-- 가격 -->
	${List.book_price}
	</div>
	</li>
	
	
	</c:forEach>
	</ul></div>
	<br><br>
	
	<br><br>
	<div class="pagee">
	<ul>
	<c:if test="${pageMaker.prev}">
		<li><a href="${path}/book/bookAll.do?page=${pageMaker.startPage-1}">이전</a></li>
     </c:if>
	 <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
		<li <c:out value ="${pageMaker.supPaging.page == idx ? '' : ''}"/>>
		<a href="${path}/book/bookAll.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
		<li><a href ="${path}/book/bookAll.do?page=${pageMaker.endPage+1}">다음</a></li>
	</c:if></ul></div>
</div>
</body>
</html>
 