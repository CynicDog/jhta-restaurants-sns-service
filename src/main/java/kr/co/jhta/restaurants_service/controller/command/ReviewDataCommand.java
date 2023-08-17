package kr.co.jhta.restaurants_service.controller.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ReviewDataCommand {
	
	private Integer rating;
	private String content;
	private MultipartFile chooseFile;
	private List<String> reviewKeyword;
	private Integer storeId;
	private Integer userId;
	
}
