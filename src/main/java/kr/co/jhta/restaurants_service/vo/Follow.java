package kr.co.jhta.restaurants_service.vo;


import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Follow {

	private int followerId;
	private int followeeId;
	private Date createDate;
}
