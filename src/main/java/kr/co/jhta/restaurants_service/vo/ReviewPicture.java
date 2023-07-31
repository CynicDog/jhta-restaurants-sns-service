package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class ReviewPicture {

	private int id;
	private String name;
	private Review review;
	
}
