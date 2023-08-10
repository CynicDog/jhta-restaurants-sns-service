package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostCommand {

	private String postTitle;
	private String postSubtitle;
}
