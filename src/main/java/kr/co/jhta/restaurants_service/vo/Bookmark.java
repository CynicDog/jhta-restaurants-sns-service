package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Bookmark {

	private int id;
	private Store store;
	private String username;
	private Date CreateDate;

}
