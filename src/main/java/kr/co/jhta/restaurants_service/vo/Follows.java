package kr.co.jhta.restaurants_service.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Getter
@Setter
@Alias("Follows")
public class Follows {

	private int followerId;
	private int followedId;

	@CreatedDate
	private Date createDate;

	public Follows() {
	}

	public Follows(int followerId, int followedId) {
		this.followerId = followerId;
		this.followedId = followedId;
	}
}
