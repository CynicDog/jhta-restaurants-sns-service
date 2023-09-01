package kr.co.jhta.restaurants_service.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostContentsDto {
	private Integer id;
	private String title;
	private String subTitle;
	private Date createDate;
	private Date updateDtae;
	private Integer customerId;
	private String userName;
	private String pictureFile;
}
