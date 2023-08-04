package kr.co.jhta.restaurants_service.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Alias("ReviewPicture")
public class ReviewPicture {

	private int id;
	private String name;
	private Review review;
	
}
