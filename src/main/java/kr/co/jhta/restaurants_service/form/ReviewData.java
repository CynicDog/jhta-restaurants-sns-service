package kr.co.jhta.restaurants_service.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ReviewData {
	
	private int rating;
	private String content;
	private String pictureName;
	
}
