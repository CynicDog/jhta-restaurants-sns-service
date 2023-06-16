<%@page import="vo.Food"%>
<%@page import="dao.FoodDao"%>
<%@page import="dao.StorePictureDao"%>
<%@page import="vo.StorePicture"%>
<%@page import="vo.StoreOpentime"%>
<%@page import="dao.StoreOpenTimeDao"%>
<%@page import="dao.ReviewPictureDao"%>
<%@page import="vo.ReviewPicture"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="vo.Store"%>
<%@page import="java.util.List"%>
<%@page import="dao.StoreDao"%>
<% 
	
	StoreDao storeDao = StoreDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance(); 
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	FoodDao foodDao = FoodDao.getInstance();
	
	int storeId = Integer.parseInt(request.getParameter("storeId"));
	
	// child table deletion 
	if (reviewDao.getReviewsByStoreId(storeId) != null) { 
		List<Review> reviews = reviewDao.getReviewsByStoreId(storeId);
		for (Review review: reviews) { 
			
			int reviewId = review.getId();
			
			// child table deletion 
			if (reviewPictureDao.getReviewPictureByReviewId(reviewId) != null) { 
				List<ReviewPicture> reviewPictures = reviewPictureDao.getReviewPictureByReviewId(reviewId); 
				for (ReviewPicture reviewPicture : reviewPictures) {
					
					reviewPictureDao.deleteReviewPictureById(reviewPicture.getId()); 
				}
			}
			
			reviewDao.deleteReviewById(reviewId); 
		}
	}
	
	// child table deletion 
	if (storeOpenTimeDao.getStoreOpenTimeByStoreId(storeId) != null) {
		List<StoreOpentime> storeOpentimes = storeOpenTimeDao.getStoreOpenTimeByStoreId(storeId); 
		for (StoreOpentime storeOpentime : storeOpentimes) {
			
			storeOpenTimeDao.deleteStoreOpenTime(storeOpentime.getId()); 
		} 
	}
	
	// child table deletion 
	if (storePictureDao.getStorePictureByStoreId(storeId) != null) {
		StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
		storePictureDao.deleteStorePicture(storePicture.getId());
	}
	
	// child table deletion
	if (foodDao.getFoodsByStoreId(storeId) != null) {
		List<Food> foods = foodDao.getFoodsByStoreId(storeId);
		for (Food food : foods) {
			
			foodDao.deleteFoodById(food.getId()); 
		}
	}
	
	
	storeDao.deleteStoreById(storeId); 
	
	response.sendRedirect("userDetail.jsp"); 
%>
