package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import kr.co.jhta.restaurants_service.vo.store.Food;
import kr.co.jhta.restaurants_service.vo.store.Store;
import kr.co.jhta.restaurants_service.vo.store.StoreOpenTime;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StoreDetailDto {

	private Store store;
	private List<Food> foods;
	private List<StoreOpenTime> openTimes;
	private List<Store> stores;
	
	public double getDistance(double lat1, double lon1, double lat2, double lon2) {
		  double dLat = Math.toRadians(lat2 - lat1);
		  double dLon = Math.toRadians(lon2 - lon1);

		  double a = Math.sin(dLat/2)* Math.sin(dLat/2)+ Math.cos(Math.toRadians(lat1))* Math.cos(Math.toRadians(lat2))* Math.sin(dLon/2)* Math.sin(dLon/2);
		  double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		  double d = 6371* c * 1000;    // Distance in m
		  return d;
	}
}
