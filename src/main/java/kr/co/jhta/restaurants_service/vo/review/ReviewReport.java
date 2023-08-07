package kr.co.jhta.restaurants_service.vo.review;

import kr.co.jhta.restaurants_service.vo.user.User;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Setter
@Getter
@Alias("PostReport")
public class ReviewReport {

	@Id
	private int id;
	private String category;
	private String content;
	private Date createDate;
	private Date updateDate;
	private User reporter;
	private Review review;
	private STATUS status;
	private User admin;

	public enum STATUS {
		PENDING, CONFIRMED, REJECTED
	}

	public ReviewReport() {
		this.createDate = new Date(); // default to current time
		this.status = STATUS.PENDING; // default to `PENDING`
	}
}
