package kr.co.jhta.restaurants_service.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("SearchedStore")
public class SearchedStore {
	
	private int id;
	private String name;
	private double reviewAvg;
	private int reviewCnt;
	private int bookmarkCnt;
	private String category;
    private double latitude;
    private double longitude;

}
