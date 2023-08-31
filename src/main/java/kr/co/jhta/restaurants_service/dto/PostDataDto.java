package kr.co.jhta.restaurants_service.dto;

import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.store.Bookmark;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostDataDto {
	private PostData postData;
	private Store store;
	private Bookmark bookmark;
	private Double averageRating;
}
