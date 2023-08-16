package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import kr.co.jhta.restaurants_service.vo.store.Food;
import kr.co.jhta.restaurants_service.vo.store.StoreOpenTime;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StoreDetailDto {

	private int storeId;
	private String storeName;
	private String storeCategory;
	private String storeAddress;
	private String storeDescription;
	private String storePhone;
	private List<Food> foods;
	private List<StoreOpenTime> openTimes;
}
