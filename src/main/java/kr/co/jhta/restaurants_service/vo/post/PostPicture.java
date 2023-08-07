package kr.co.jhta.restaurants_service.vo.post;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@NoArgsConstructor
@Alias("PostPicture")
public class PostPicture {

	@Id
	private int id;
	private String pictureName;
	private Post post;

}
