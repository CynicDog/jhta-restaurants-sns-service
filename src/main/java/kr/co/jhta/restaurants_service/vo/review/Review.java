package kr.co.jhta.restaurants_service.vo.review;

import java.util.Date;

import kr.co.jhta.restaurants_service.vo.store.Store;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter @Setter
@Alias("Review")
public class Review {

	@Id
	private int id;
	private double rating;
	private String content;
	private Date createDate;
	private Date updateDate;
	private int likedCount;
	private User customer;
	private Store store;
	private int reportCount;
	private DISABLED disabled;
	private BLOCKED blocked;

	public Review() {
		this.createDate = new Date(); // default to current time
		this.updateDate = new Date(); // default to current time
		this.disabled = DISABLED.NO; // default to `NO`
	}

	public enum DISABLED {
		NO, YES
	}

	public enum BLOCKED {
		NO, YES
	}
	
}
