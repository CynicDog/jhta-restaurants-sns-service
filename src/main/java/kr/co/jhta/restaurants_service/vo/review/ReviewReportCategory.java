package kr.co.jhta.restaurants_service.vo.review;

import kr.co.jhta.restaurants_service.vo.post.PostReport;
import kr.co.jhta.restaurants_service.vo.review.ReviewReport;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewReportCategory {

    private String category;
    private ReviewReport reportReport;

    public ReviewReportCategory() {
    }
}
