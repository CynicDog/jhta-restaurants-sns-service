package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class StoreOpentime {

	private int id;
	private String timeCategory;
	private String day;
	private String opentime;
	private String closetime;
	private Store store;
}
