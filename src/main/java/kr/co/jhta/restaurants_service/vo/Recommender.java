package kr.co.jhta.restaurants_service.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Alias("Recommender")
public class Recommender {

	private int id;
	private Customer customer;
	private Review review;
}
