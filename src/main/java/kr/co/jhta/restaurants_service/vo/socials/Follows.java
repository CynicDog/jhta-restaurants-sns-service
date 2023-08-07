package kr.co.jhta.restaurants_service.vo.socials;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Getter @Setter
@Alias("Follows")
public class Follows {

	private int followerId;
	private int followedId;
	private Date createDate;

	public Follows() {
		this.createDate = new Date();
	}

	public Follows(int followerId, int followedId) {
		this.createDate = new Date();
		this.followerId = followerId;
		this.followedId = followedId;
	}
}
