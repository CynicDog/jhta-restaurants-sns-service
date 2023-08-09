package kr.co.jhta.restaurants_service.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostData {

	private String storeName;
    private String content;
    private String pictureName;
}
