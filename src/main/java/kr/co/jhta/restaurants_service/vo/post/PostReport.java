package kr.co.jhta.restaurants_service.vo.post;

import java.util.Date;

import kr.co.jhta.restaurants_service.vo.user.User;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Setter
@Getter
@Alias("PostReport")
public class PostReport {

	@Id
	private int id;
	private String category;
	private String content;
	private Date createDate;
	private Date updateDate;
	private User reporter;
	private Post post;
	private STATUS status;
	private User admin;

	public enum STATUS {
		PENDING, CONFIRMED, REJECTED
	}

	public PostReport() {
		this.createDate = new Date(); // default to current time
		this.status = STATUS.PENDING; // default to `PENDING`
	}
}
