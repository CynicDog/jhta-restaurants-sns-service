<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% 
	// 요청 파라미터값 조회하기
	int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	int storeId = Integer.parseInt(request.getParameter("storeId"));
	
	// 세션에서 로그인한 사용자 정보 조회하기
	Integer loginId = (Integer) session.getAttribute("loginId");
	
	// 예외처리
	/* if (loginId == null) {
		response.sendRedirect("../loginFormPage.jsp?err=req&job=" + URLEncoder.encode("리뷰삭제", "utf-8"));
		return;
	} */
	
	// 리뷰의 작성 아이디와 로그인 아이디가 일치하는지 체크
	ReviewDao reviewDao = ReviewDao.getInstance();
	Review review = reviewDao.getReviewById(reviewId);
	
	if (!loginId.equals(review.getCustomer().getId())) {
		response.sendRedirect("storeDetail.jsp?storeId=" + storeId);
		return;
	}
	
	// 리뷰 정보 삭제
	reviewDao.deleteReviewById(reviewId);
	
	// detail.jsp를 재요청하는 URL을 응답으로 보냅니다.
	response.sendRedirect("storeDetail.jsp?storeId=" + storeId);
%>
