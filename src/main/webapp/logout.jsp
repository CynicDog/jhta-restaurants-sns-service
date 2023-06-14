<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 로그아웃 처리
	// 1. 세션의 무효화 시키기
	session.invalidate();
	
	// 2. home.jsp 재요청 URL 응답 보내기
	response.sendRedirect("home.jsp");
%>