package kr.co.jhta.restaurants_service.vo.post;

import kr.co.jhta.restaurants_service.vo.post.PostReport;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PostReportCategory {

    private String category;
    private PostReport postReport;

    public PostReportCategory() {
    }
}
