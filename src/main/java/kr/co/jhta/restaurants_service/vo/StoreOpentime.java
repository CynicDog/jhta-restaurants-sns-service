package kr.co.jhta.restaurants_service.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Alias("StoreOpentime")
public class StoreOpentime {

	private int id;
	private String Category;
	private String day;
	private String opentime;
	private String closetime;
	private Store store;
}
