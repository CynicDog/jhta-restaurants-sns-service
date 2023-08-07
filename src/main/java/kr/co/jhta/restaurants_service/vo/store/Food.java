package kr.co.jhta.restaurants_service.vo.store;

import kr.co.jhta.restaurants_service.vo.store.Store;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter @Setter
@NoArgsConstructor
@Alias("Food")
public class Food {

	@Id
	private int id;
	private String name;
	private int price;
	private Store store;
}
