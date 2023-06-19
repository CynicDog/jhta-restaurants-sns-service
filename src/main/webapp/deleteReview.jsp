<%@page import="java.util.List"%>
<%@page import="vo.ReviewPicture"%>
<%@page import="dao.ReviewPictureDao"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% 
	ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();
	// 요청 파라미터값 조회하기
	int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	int storeId = Integer.parseInt(request.getParameter("storeId"));
	String fromUserDetails = request.getParameter("fromUserDetails"); 
	
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
	
	List<ReviewPicture> reviewPictures = reviewPictureDao.getReviewPictureByReviewId(reviewId);
	
	for (ReviewPicture reviewPicture : reviewPictures) {
		reviewPictureDao.deleteReviewPictureById(reviewPicture.getId());
	}
	
	
	// 리뷰 정보 삭제
	reviewDao.deleteReviewById(reviewId);
	
	// userDetail.jsp에서 호출된 delet 요청인 경우, 삭제 작업 이후 redirection은 userDetail.jsp로
	// storeDetail.jsp에서 호출된 delet 요청인 경우, 삭제 작업 이후 redirection은 storeDetail.jsp로 분기. 
	if (fromUserDetails != null) {  
		response.sendRedirect("userDetail.jsp"); 
	} else {  
		response.sendRedirect("storeDetail.jsp?storeId=" + storeId);
	}
%>
