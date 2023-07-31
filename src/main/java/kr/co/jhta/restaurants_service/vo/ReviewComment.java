package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReviewComment {

	private int id;
	private String content;
	private Date createDate;
	private Date updateDate;
	private Review review;
	private String disabled;
	
}
