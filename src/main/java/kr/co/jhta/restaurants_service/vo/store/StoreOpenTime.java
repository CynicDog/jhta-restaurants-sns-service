package kr.co.jhta.restaurants_service.vo.store;

import kr.co.jhta.restaurants_service.vo.store.Store;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Setter @Getter
@Alias("StoreOpenTime")
public class StoreOpenTime {

	@Id
	private int id;
	private String day;
	private String openTime;
	private String closeTime;
	private Store store;

	public StoreOpenTime() {
	}
}
