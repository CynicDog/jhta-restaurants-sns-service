package kr.co.jhta.restaurants_service.vo.post;

import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostData {
	private int id;
	private Post post;
	private Store store;
	private String content;
	private String pictureFile;
}