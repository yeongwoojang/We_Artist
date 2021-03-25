<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>version1</h1>
	<h2>김선민만세</h2>
	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<h2><a href="/member/join">회원가입</a></h2>
			<h2><a href="/member/login">로그인</a></h2>
		</c:when>
		<c:otherwise>
			<h2><a href="/member/mypage">마이페이지</a></h2>
			<h2><a href="/member/logout">로그아웃</a></h2>
		</c:otherwise>
	</c:choose>
</body>
</html>