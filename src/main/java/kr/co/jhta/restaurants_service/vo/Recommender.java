package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Recommender {

	private int id;
	private Customer customer;
	private Review review;
}
