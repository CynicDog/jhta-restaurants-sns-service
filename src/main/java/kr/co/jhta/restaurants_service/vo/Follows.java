package kr.co.jhta.restaurants_service.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class Follows {

	private int followerId;
	private int followedId;
	private Date timestamp;
}
