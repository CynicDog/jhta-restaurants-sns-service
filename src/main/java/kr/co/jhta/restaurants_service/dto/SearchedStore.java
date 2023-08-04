package kr.co.jhta.restaurants_service.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SearchedStore {
	
	private int id;
	private int name;
	private double reviewAvg;

}
