package kr.co.jhta.restaurants_service.controller.command;

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
	
	private int rating;
	private String content;
	private MultipartFile chooseFile;
	private String keyword;
	private Integer storeId;
//	private Integer customerId;
	
 //   public ReviewDataCommand(MultipartFile chooseFile, int rating, String content, String keyword) {
 //      this.chooseFile = chooseFile;
 //       this.rating = rating;
 //      this.content = content;
 //      this.keyword = keyword;
 //   }
	
}
