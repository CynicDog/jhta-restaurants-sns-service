package kr.co.jhta.restaurants_service.vo.review;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Setter @Getter
@NoArgsConstructor
@Alias("ReviewPicture")
public class ReviewPicture {

	@Id
	private int id;
	private String pictureName;
	@JsonIgnore
	private Review review;
}
