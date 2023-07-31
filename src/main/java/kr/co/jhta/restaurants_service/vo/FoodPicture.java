package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FoodPicture {

	private int id;
	private String name;
	private Food food;
	
}
