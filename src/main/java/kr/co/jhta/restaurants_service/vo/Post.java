package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Post {

	private int id;
	private String title;
	private String content;
	private Date createDate;
	private Date updateDate;
	private Customer customer;
	private Store store;
	private String disabled;
	private String blocked;
	private String reportCount;
}
