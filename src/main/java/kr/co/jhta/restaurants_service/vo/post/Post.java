package kr.co.jhta.restaurants_service.vo.post;

import java.util.Date;

import kr.co.jhta.restaurants_service.vo.store.Store;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@Alias("Post")
public class Post {

	@Id
	private int id;
	private String title;
	private String subTitle;
	private Date createDate;
	private Date updateDate;
	private User customer;
	private int reportCount;
	private int likedCount;
	private DISABLED disabled;
	private BLOCKED blocked;

	public Post() {

		this.createDate = new Date(); // default to current time
		this.updateDate = new Date(); // default to current time
		this.disabled = Post.DISABLED.NO; // default to `NO`
		this.blocked = Post.BLOCKED.NO; // default to `NO`
	}

	public Post(String title, String subTitle, User customer) {
		this.title = title;
		this.subTitle = subTitle;
		this.customer = customer;
	}

	public enum DISABLED  {
		NO, YES
	}

	public enum BLOCKED {
		NO, YES
	}
}
