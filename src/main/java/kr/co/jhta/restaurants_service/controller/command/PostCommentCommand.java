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
public class PostCommentCommand {

	private String content;
	private Integer postingId;
	private Integer userId;
}
