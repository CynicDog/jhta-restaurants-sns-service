package kr.co.jhta.restaurants_service.vo.store;

import java.util.Date;

import kr.co.jhta.restaurants_service.vo.user.User;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@Alias("Bookmark")
public class Bookmark {

	@Id
	private int id;
	private Store store;
	private User customer;
	private Date createDate;

	public Bookmark() {
		this.createDate = new Date();
	}
}
