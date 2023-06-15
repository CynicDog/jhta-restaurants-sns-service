package utils;

import java.util.Map;

public class EngKorConverter {

	
	private static Map<String, String> foodCategoryDictionary = Map.ofEntries(
			Map.entry("korean", "한식"), 
			Map.entry("chinese", "중식"), 
			Map.entry("japanese", "일식"),
			Map.entry("fastfood", "패스트푸드"),
			Map.entry("stew", "찜, 탕, 찌개"),
			Map.entry("meat", "육고기"),
			Map.entry("street", "분식"),
			Map.entry("asian", "아시안"),
			Map.entry("dessert", "디저트"),
			Map.entry("etc", "기타")
		); 	
		
	public static String foodCategoryToKorean(String key) {
		return foodCategoryDictionary.get(key);
	}
	
	private static Map<String, String> dayOffsDictionary = Map.ofEntries(
			Map.entry("day1", "월요일"), 
			Map.entry("day2", "화요일"),      
			Map.entry("day3", "수요일"),
			Map.entry("day4", "목요일"),
			Map.entry("day5", "금요일"),
			Map.entry("day6", "토요일"),
			Map.entry("day7", "일요일")
		); 
	
	public static String dayOffsToKorean(String key) {
		return dayOffsDictionary.get(key); 
	}
			
}
