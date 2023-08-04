package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("ReviewComment")
public class ReviewComment {

	private int id;
	private String content;
	private Date createDate;
	private Date updateDate;
	private String disabled;
	private Review review;
	
}
