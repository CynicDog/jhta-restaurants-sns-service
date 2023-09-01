package kr.co.jhta.restaurants_service.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReviewContentsDto {
	private Integer id;
	private Integer ratting;
	private Date createDate;
	private Integer likedCount;
	private Integer customerId;
	private String userName;
	private Integer storeId;
	private String storeName;
	private String pictureName;
}
