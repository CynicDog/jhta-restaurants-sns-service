package kr.co.jhta.restaurants_service.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("ReviewKeyword")
public class ReviewKeyword {
	
	private int id;
	private String keyword;
	private Review review;
	
}
