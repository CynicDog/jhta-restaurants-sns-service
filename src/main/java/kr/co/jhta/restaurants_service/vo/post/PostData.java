package kr.co.jhta.restaurants_service.vo.post;

import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@NoArgsConstructor
@Alias("PostData")
public class PostData {
	private int id;
	private Post post;
	private Store store;
	private String content;
	private String pictureFile;

	public PostData(Post post, Store store, String content, String pictureFile) {
		this.post = post;
		this.store = store;
		this.content = content;
		this.pictureFile = pictureFile;//
	}
}