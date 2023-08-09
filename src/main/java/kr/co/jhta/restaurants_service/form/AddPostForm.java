package kr.co.jhta.restaurants_service.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter@Setter
@NoArgsConstructor
public class AddPostForm {

	private String title;
	private String subTitle;
	
	private List<Integer> storeId;
    private List<String> content;
    private List<MultipartFile> chooseFile;
}
