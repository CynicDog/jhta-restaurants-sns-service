package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Report {

	private int id;
	private String category;
	private String content;
	private Date createDate;
	private Date confirmDate;
	private int count;
	private Customer reporter;
	private Review review;
	private Post post;
	private String confirmed;
	private Admins admin;
	
}
