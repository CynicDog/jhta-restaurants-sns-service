package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("HomeDto")
public class HomeDto {
	private List<HomeContent> homeContents;
}
