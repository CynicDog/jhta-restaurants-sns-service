package kr.co.jhta.restaurants_service.dto;


import org.apache.ibatis.type.Alias;

import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("HomeContent")
public class HomeContent {
	private int id;
	private String username;
	private Post post;
	private String storeName;
	private String category;
	private String address;
	private Review review;
	private String content;
	private String title;
	private String pictureFile;
	private String imageUrl;
	private String createDate;
}
