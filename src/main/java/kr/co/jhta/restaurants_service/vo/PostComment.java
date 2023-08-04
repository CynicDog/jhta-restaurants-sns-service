package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("PostComment")
public class PostComment {

	private int id;
	private String content;
	private String disabled;
	private Date createDate;
	private Date updateDate;
	private Post post;
	private Customer customer;
	
}
