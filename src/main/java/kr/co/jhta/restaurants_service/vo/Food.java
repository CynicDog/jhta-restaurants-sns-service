package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Food {

	private int id;
	private String name;
	private int price;
	private String pictureName;
	private Store store;
}
