package kr.co.jhta.restaurants_service.service;

import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.mapper.ReviewLikeMapper;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@ToString
@RequiredArgsConstructor
public class ReviewLikeService {
	private final ReviewLikeMapper reviewLikeMapper;


	public void insertLike(int customerId, int reviewId) {
		reviewLikeMapper.insertLike(customerId,reviewId);
		reviewLikeMapper.addLike(reviewId);
	}

	public void deleteLike(int customerId, int reviewId) {
		reviewLikeMapper.deleteLike(customerId,reviewId);
		reviewLikeMapper.cancelLike(reviewId);
	}

}
