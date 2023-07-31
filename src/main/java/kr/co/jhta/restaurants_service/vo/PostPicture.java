package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostPicture {

	private int id;
	private String pictureName;
	private Post post;

}
