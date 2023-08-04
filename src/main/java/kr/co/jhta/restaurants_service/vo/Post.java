package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("Post")
public class Post {

	private int id;
	private String title;
	private String content;
	private Date createDate;
	private Date updateDate;
	private Customer customer;
	private Store store;
	private String reportCount;
	private String disabled;
	private String blocked;
}
